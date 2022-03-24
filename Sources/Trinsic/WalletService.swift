//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import GRPC

public class WalletService : ServiceBase
{
    var client: Services_Universalwallet_V1_UniversalWalletClient?

    public init () {
        super.init(options: Sdk_Options_V1_ServiceOptions())
        client = Services_Universalwallet_V1_UniversalWalletClient(channel: createChannel())
    }
    
    public override init (options: Sdk_Options_V1_ServiceOptions) {
        super.init(options: options)
        client = Services_Universalwallet_V1_UniversalWalletClient(channel: createChannel())
    }
    
    public func search(request: Services_Universalwallet_V1_SearchRequest) throws -> Services_Universalwallet_V1_SearchResponse {
        if request.query.isEmpty {
            request.query = "SELECT c.id, c.type, c.data FROM c";
        }        
        return try client!.Search(request, callOptions: try buildMetadata(request))
            .response
            .wait();
    }

    public func insertItem(request: Services_Universalwallet_V1_InsertItemRequest) throws -> Services_Universalwallet_V1_InsertItemResponse {
        return try client!.InsertItem(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }

    public func deleteItem(request: Services_Universalwallet_V1_DeleteItemRequest) throws -> Services_Universalwallet_V1_InsertItemResponse {
        return try client!.DeleteItem(request, callOptions: try buildMetadata(request))
                .response
                .wait()
    }
}
