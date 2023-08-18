//
//  ContentView.swift
//  Example
//
//  Created by Tomislav Markovski on 8/17/23.
//

import SwiftUI
import Connect

struct ContentView: View {
    let connect = ConnectClient()
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                    .padding(.bottom, 10)
                Button("Verify with Trinsic Connect") {
                    let request = VerifiablePresentationRequest(ecosystem: "did-hack",
                                                                schema: "https://schema.trinsic.cloud/did-hack/attendance-credential")
                    
                    connect.requestVerifiableCredential(request) { result, error in
                        path.append(result)
                    }
                }
            }
            .padding()
            .navigationDestination(for: String.self) { value in
                SecondView(text: value)
            }
        }
    }
}

struct SecondView: View {
    let text: String
    var body: some View {
        VStack {
            Text(text)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
