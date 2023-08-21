//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 8/15/23.
//

import Foundation
import AppAuth
import AuthenticationServices
#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

public class ConnectClient: NSObject, ASWebAuthenticationPresentationContextProviding {
    public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        #if os(iOS)
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow } ?? ASPresentationAnchor()
        #elseif os(macOS)
        NSApplication.shared.windows.first { $0.isKeyWindow } ?? ASPresentationAnchor()
        #endif
    }
    
    public override init() {}
    
    public func requestVerifiableCredential(_ request: VerifiablePresentationRequest, completion: @escaping (VerifiablePresentation?, ConnectError?) -> Void) -> Void {
        let ecosystem = request.ecosystem.ecosystemName()
        let issuer = URL(string: "https://\(ecosystem).connect.trinsic.cloud")!
        
        // discovers endpoints
        OIDAuthorizationService.discoverConfiguration(forIssuer: issuer) { configuration, error in
            guard let config = configuration else {
                print("Error retrieving discovery document: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // builds authentication request
            let request = OIDAuthorizationRequest(configuration: config,
                                                  clientId: "https://example.com",
                                                  scopes: [OIDScopeOpenID],
                                                  redirectURL: URL(string: "com.example://oauth2redirect")!,
                                                  responseType: OIDResponseTypeCode,
                                                  additionalParameters: [
                                                    "trinsic:ecosystem": ecosystem,
                                                    "trinsic:schema": request.schema
                                                  ])
            
            let session = ASWebAuthenticationSession(url: request.authorizationRequestURL(), callbackURLScheme: "com.example") { url, error in
                let tokenRequest = OIDTokenRequest(configuration: config,
                                                   grantType: OIDGrantTypeAuthorizationCode,
                                                   authorizationCode: url?.valueOfQueryParameter(named: "code"),
                                                   redirectURL: URL(string: "com.example://oauth2redirect")!,
                                                   clientID: "https://example.com",
                                                   clientSecret: nil,
                                                   scopes: [OIDScopeOpenID],
                                                   refreshToken: nil,
                                                   codeVerifier: request.codeVerifier,
                                                   additionalParameters: nil)
                
                OIDAuthorizationService.perform(tokenRequest)  { tokenResponse, tokenError in
                    if let error = tokenError {
                        completion(nil, .networkError(reason: error.localizedDescription))
                        return
                    }
                    guard let response = tokenResponse,
                          let additionalParams = response.additionalParameters,
                          let vp = additionalParams["vp_token"] as? NSDictionary else {
                        completion(nil, .networkError(reason: "No response"))
                        return
                    }
                    
                    completion(VerifiablePresentation(data: vp), nil)
                }
            }
            
            session.presentationContextProvider = self
            session.start()
        }
    }
    
    public func requestIdentityVerification (_ completion: @escaping (String, Bool) -> Void) -> Void {
    }
}

public class VerifiablePresentation: NSObject {
    public init(data: NSDictionary) {
        self.data = data
    }
    
    public let data: NSDictionary
    
    public var jsonString: String {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self.data, options: .withoutEscapingSlashes),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        } else {
            return "Error converting NSDictionary to JSON string"
        }
    }
}

public struct VerifiablePresentationRequest: Codable {
    public init(ecosystem: String, schema: String) {
        self.ecosystem = ecosystem
        self.schema = schema
        self.issuer = nil
        self.challenge = nil
        self.domain = nil
    }
    
    public init(ecosystem: String, schema: String, issuer: String?, challenge: String?, domain: String?) {
        self.ecosystem = ecosystem
        self.schema = schema
        self.issuer = issuer
        self.challenge = challenge
        self.domain = domain
    }
    
    public var schema: String
    public var ecosystem: String
    public var issuer: String?
    public var challenge: String?
    public var domain: String?
}

public enum ConnectError: Swift.Error {
    case invalidArgument(name: String, reason: String)
    case networkError(reason: String)
}

#if os(iOS)
extension UIApplication {
    public var topViewController: UIViewController? {
        var topViewController: UIViewController? = nil
        if #available(iOS 13, *) {
            topViewController = connectedScenes.compactMap {
                return ($0 as? UIWindowScene)?.windows.filter { $0.isKeyWindow  }.first?.rootViewController
            }.first
        } else {
            topViewController = keyWindow?.rootViewController
        }
        if let presented = topViewController?.presentedViewController {
            topViewController = presented
        } else if let navController = topViewController as? UINavigationController {
            topViewController = navController.topViewController
        } else if let tabBarController = topViewController as? UITabBarController {
            topViewController = tabBarController.selectedViewController
        }
        return topViewController
    }
}
#endif

extension URL {
    func valueOfQueryParameter(named name: String) -> String? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false) else { return nil }
        return components.queryItems?.first(where: { $0.name == name })?.value
    }
}

extension String {
    func ecosystemName() -> String {
        if self.hasPrefix("urn:trinsic:ecosystems:") {
            return String(self.dropFirst("urn:trinsic:ecosystems:".count))
        }
        if self.hasPrefix("urn:ecosystems:") {
            return String(self.dropFirst("urn:ecosystems:".count))
        }
        return self
    }
}
