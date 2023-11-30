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

                    connect.requestVerifiableCredential(request) { result, _ in
                        guard let vp = result else {
                            return
                        }
                        path.append(vp)
                    }
                }
            }
            .padding()
            .navigationDestination(for: VerifiablePresentation.self) { value in
                JsonObjectView(object: value.data)
            }
        }
    }
}

// struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
// }
