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

public class VerificationClient: NSObject, ASWebAuthenticationPresentationContextProviding {
    public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
//        UIApplication.SharedApplication.ConnectedScenes
//                        .ToArray()
//                        .OfType<UIWindowScene>()
//                        .SelectMany(scene => scene.Windows)
//                        .First(window => window.IsKeyWindow)
        ASPresentationAnchor()
//        session.presentationContextProvider?.presentationAnchor(for: session) ?? ASPresentationAnchor()
    }
    
    public override init() {}
    
    public func identityVerification(presenting controller: UIViewController, completion: @escaping (String, Bool) -> Void) -> Void {
        let issuer = URL(string: "https://did-hack.connect.trinsic.cloud")!

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
                                                    "trinsic:ecosystem": "did-hack",
                                                    "trinsic:schema": "https://schema.trinsic.cloud/did-hack/attendance-credential"
                                                  ])
            
            var requestUrl = request.authorizationRequestURL()
            
            let session = ASWebAuthenticationSession(url: request.authorizationRequestURL(), callbackURLScheme: "com.example") { url, error in
                print(url)
                
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
                    print(tokenResponse)
                    
                    completion(tokenResponse.debugDescription, true)
                }
            }
            
            session.presentationContextProvider = self
            session.start()
        
        }
    }
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
