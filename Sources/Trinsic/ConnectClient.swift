//
//  ConnectClient.swift
//
//
//  Created by Tomislav Markovski on 8/15/23.
//

import AppAuth
import AuthenticationServices
import Foundation
#if os(iOS)
    import UIKit
#elseif os(macOS)
    import AppKit
#endif

public class ConnectClient: NSObject, ASWebAuthenticationPresentationContextProviding {
    public func presentationAnchor(for _: ASWebAuthenticationSession) -> ASPresentationAnchor {
        #if os(iOS)
            UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap(\.windows)
                .first { $0.isKeyWindow } ?? ASPresentationAnchor()
        #elseif os(macOS)
            NSApplication.shared.windows.first { $0.isKeyWindow } ?? ASPresentationAnchor()
        #endif
    }

    override public init() {}

    public func requestVerifiableCredential(_ request: VerifiablePresentationRequest, completion: @escaping (VerifiablePresentation?, ConnectError?) -> Void) {
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
                                                      "trinsic:schema": request.schema,
                                                  ])

            let session = ASWebAuthenticationSession(url: request.authorizationRequestURL(), callbackURLScheme: "com.example") { url, _ in
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
                    if let error = tokenError {
                        completion(nil, .networkError(reason: error.localizedDescription))
                        return
                    }
                    guard let response = tokenResponse,
                          let additionalParams = response.additionalParameters,
                          let vp = additionalParams["vp_token"] as? NSDictionary
                    else {
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

    public func requestIdentityVerification(_: @escaping (String, Bool) -> Void) {}
}

public class VerifiablePresentation: NSObject {
    public init(data: NSDictionary) {
        self.data = data
    }

    public let data: NSDictionary

    public var jsonString: String {
        if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: .withoutEscapingSlashes),
           let jsonString = String(data: jsonData, encoding: .utf8)
        {
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
        issuer = nil
        challenge = nil
        domain = nil
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
    public extension UIApplication {
        var topViewController: UIViewController? {
            var topViewController: UIViewController?
            if #available(iOS 13, *) {
                topViewController = connectedScenes.compactMap {
                    ($0 as? UIWindowScene)?.windows.filter(\.isKeyWindow).first?.rootViewController
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
        if hasPrefix("urn:trinsic:ecosystems:") {
            return String(dropFirst("urn:trinsic:ecosystems:".count))
        }
        if hasPrefix("urn:ecosystems:") {
            return String(dropFirst("urn:ecosystems:".count))
        }
        return self
    }
}
