//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import Okapi
import Proto
import GRPC;
import NIO;
import NIOHPACK

public class Service {
    
    var config: Config
    var channel: ClientConnection
    
    required init(config: Config) {
        self.config = config
        
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        let builder = config.useTls ?
            ClientConnection.usingPlatformAppropriateTLS(for: group) :
            ClientConnection.insecure(group: group)
        
        self.channel = builder.connect(host: config.endpoint, port: Int(config.port))
    }
    
    static func Account() -> ServiceBuilder<AccountService> {
        return ServiceBuilder<AccountService>()
    }
    
    func callOptions() -> CallOptions {
        var options = CallOptions();
        options.customMetadata.add(name: "Authorization", value: "TODO")
        
        return options
    }
}

public struct Config {
    internal var endpoint: String
    internal var port: UInt16
    internal var useTls: Bool
    
    internal var profile: String?
}

class ServiceBuilder<T: Service> {
    
    internal var endpoint = "prod.trincis.cloud"
    internal var port: UInt16 = 443
    internal var useTls = true
    
    internal var profile: String? = nil
    
    func build() -> T {
        return T(config: Config(
            endpoint: endpoint,
            port: port,
            useTls: useTls,
            profile: profile))
    }
    
    func with(endpoint: String) -> ServiceBuilder<T> {
        self.endpoint = endpoint
        return self
    }
    
    func with(port: UInt16) -> ServiceBuilder<T> {
        self.port = port
        return self
    }
    
    func with(useTls: Bool) -> ServiceBuilder<T> {
        self.useTls = useTls
        return self
    }
    
    func with(profile: String) -> ServiceBuilder<T> {
        self.profile = profile
        return self
    }
}
