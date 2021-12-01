//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import GRPC

public class WalletService
{
    public private(set) var profile: Services_Account_V1_AccountProfile?
    var client: Services_Universalwallet_V1_UniversalWalletClient

    private init (client: Services_Universalwallet_V1_UniversalWalletClient) {
        self.client = client
    }
    
    func search(query: String = "SELECT * from c") throws -> [Services_Common_V1_JsonPayload] {
        var request = Services_Universalwallet_V1_SearchRequest();
        request.query = query;
        
        let response = try client.Search(request, callOptions: getMetadata(request))
            .response
            .wait();
        
        return response.items
    }

    func insertItem(item: [String: Any]) throws -> String {
        var request = Services_Universalwallet_V1_InsertItemRequest();
        request.item = Services_Common_V1_JsonPayload();
        request.item.jsonBytes = try JSONSerialization.data(withJSONObject: item, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let result = try client.InsertItem(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result.itemID;
    }
}

extension WalletService : ServiceProfile {
    public typealias TService = WalletService
    
    public static func create(channel: GRPCChannel, profile: Services_Account_V1_AccountProfile?) -> WalletService {
        let service = WalletService(client: Services_Universalwallet_V1_UniversalWalletClient(channel: channel))
        service.profile = profile
        
        return service
    }
}
