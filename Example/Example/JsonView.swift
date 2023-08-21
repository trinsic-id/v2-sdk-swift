//
//  JsonView.swift
//  Example
//
//  Created by Tomislav Markovski on 8/21/23.
//

import Foundation
import SwiftUI

struct JsonObjectView: View {
    let object: NSDictionary
    var body: some View {
        let dict = object as! Dictionary<String, Any>
        let keys = dict.keys.map { $0 }
        
        List {
            ForEach(keys, id: \.self) { key in
                let value = dict[key]
                
                if let itemValue = value as? String {
                    VStack(alignment: .leading) {
                        Text(key)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .lineLimit(1)
                        Text(itemValue)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                } else if let itemValue = value as? String {
                    Text(itemValue)
                        .lineLimit(1)
                        .truncationMode(.tail)
                } else if value is NSDictionary {
                    NavigationLink(key) {
                        JsonObjectView(object: value as! NSDictionary)
                    }
                } else if value is NSArray {
                    NavigationLink(key) {
                        JsonArrayView(object: value as! NSArray)
                    }
                }
            }
        }
    }
}

struct JsonArrayView: View {
    let object: NSArray
    var body: some View {
        let items = object as! [Any]
        
        List {
            ForEach(0..<items.count, id: \.self) { index in
                let item = items[index]
                if let textItem = item as? String {
                    Text(textItem)
                } else if let arrayItem = item as? NSArray {
                    NavigationLink("[]") {
                        JsonArrayView(object: arrayItem)
                    }
                } else if let objectItem = item as? NSDictionary {
                    NavigationLink("{}") {
                        JsonObjectView(object: objectItem)
                    }
                } else {
                    Text("Unknown type")
                }
            }
        }
    }
}
