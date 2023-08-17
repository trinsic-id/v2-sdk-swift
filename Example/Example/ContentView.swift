//
//  ContentView.swift
//  Example
//
//  Created by Tomislav Markovski on 8/17/23.
//

import SwiftUI
import Connect

import AuthenticationServices

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Connect") {
                let connect = VerificationClient()
                // get reference to the current view controller
                
                let vc = UIApplication.shared.topViewController
                
                connect.identityVerification(presenting: vc!) { (result, success) in
                    print(result)
                }
            }
        
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//extension UIApplication {
//    var topViewController: UIViewController? {
//        var topViewController: UIViewController? = nil
//        if #available(iOS 13, *) {
//            topViewController = connectedScenes.compactMap {
//                return ($0 as? UIWindowScene)?.windows.filter { $0.isKeyWindow  }.first?.rootViewController
//            }.first
//        } else {
//            topViewController = keyWindow?.rootViewController
//        }
//        if let presented = topViewController?.presentedViewController {
//            topViewController = presented
//        } else if let navController = topViewController as? UINavigationController {
//            topViewController = navController.topViewController
//        } else if let tabBarController = topViewController as? UITabBarController {
//            topViewController = tabBarController.selectedViewController
//        }
//        return topViewController
//    }
//}
