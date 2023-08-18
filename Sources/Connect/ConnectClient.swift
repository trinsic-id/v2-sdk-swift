//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 8/15/23.
//

import Foundation
import AppAuth
import UIKit
import AuthenticationServices

public class ConnectClient: NSObject, ASWebAuthenticationPresentationContextProviding {
    public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        ?? ASPresentationAnchor()
    }
    
    public override init() {}
    
    public func requestVerifiableCredential(_ request: VerifiablePresentationRequest, completion: @escaping (String, Bool) -> Void) -> Void {
        let issuer = URL(string: "https://\(request.ecosystem).connect.trinsic.cloud")!
        
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
                                                    "trinsic:ecosystem": request.ecosystem,
                                                    "trinsic:schema": request.schema
                                                  ])
            
            var requestUrl = request.authorizationRequestURL()
            
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
                
                OIDAuthorizationService.perform(tokenRequest) { tokenResponse, tokenError in
                    completion((tokenResponse?.additionalParameters!.debugDescription)!, true)
                }
            }
            
            session.presentationContextProvider = self
            session.start()
        }
    }
    
    public func requestIdentityVerification (_ completion: @escaping (String, Bool) -> Void) -> Void {
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

extension URL {
    func valueOfQueryParameter(named name: String) -> String? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false) else { return nil }
        return components.queryItems?.first(where: { $0.name == name })?.value
    }
}
