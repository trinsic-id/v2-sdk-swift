//
//  ContentView.swift
//  Example
//
//  Created by Tomislav Markovski on 8/17/23.
//

import SwiftUI
import Trinsic

struct ContentView: View {
    let connect = ConnectClient()
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Verify with Trinsic Connect") {
                    let request = VerifiablePresentationRequest(ecosystem: "did-hack",
                                                                schema: "https://schema.trinsic.cloud/did-hack/attendance-credential")
                    
                    connect.requestVerifiableCredential(request) { result, error in
                        guard let vp = result else {
                            return
                        }
                        path.append(vp)
                    }
                }
            }
            .padding()
            .navigationDestination(for: VerifiablePresentation.self) { value in
                PresentationView(vp: value)
            }
        }
    }
}

struct PresentationView: View {
    let vp: VerifiablePresentation
    var body: some View {
        VStack {
            Text(parseJson())
        }
    }
    
    func parseJson() -> String {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self.vp.data, options: .prettyPrinted),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString.replacingOccurrences(of: "\\/", with: "/")
        } else {
            return "Error converting NSDictionary to JSON string"
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
