//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import Okapi
import GRPC
import NIO

public class Services {
    
    public static func Account() -> ServiceBuilder<AccountService> {
        ServiceBuilder<AccountService>()
    }
    
    public static func Wallet() -> ServiceBuilder<WalletService> {
        ServiceBuilder<WalletService>()
    }
    
    public static func Credential() -> ServiceBuilder<CredentialService> {
        ServiceBuilder<CredentialService>()
    }
    
    public static func TrustRegistry() -> ServiceBuilder<TrustRegistryService> {
        ServiceBuilder<TrustRegistryService>()
    }
    
    public static func Provider() -> ServiceBuilder<ProviderService> {
        ServiceBuilder<ProviderService>()
    }
}

public protocol ServiceProfile {
    associatedtype TService
    var profile: AccountProfile? { get }
    static func create(channel: GRPCChannel, profile: AccountProfile?) -> TService
}

public enum SdkError: Error {
    case profileNotSet
    case serverError(code: Int)
    case unknown
}

public  class ServiceBuilder<T: ServiceProfile> {
    
    internal var endpoint = "prod.trincis.cloud"
    internal var port: UInt16 = 443
    internal var useTls = true
    
    internal var profile: AccountProfile? = nil
    
    public func build() -> T.TService {
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 10)
        let builder = self.useTls ?
            ClientConnection.usingPlatformAppropriateTLS(for: group) :
            ClientConnection.insecure(group: group)
        
        let channel = builder.connect(host: self.endpoint, port: Int(self.port))
        
        return T.create(channel: channel, profile: self.profile)
    }
    
    public func with(endpoint: String) -> ServiceBuilder<T> {
        self.endpoint = endpoint
        return self
    }
    
    public func with(port: UInt16) -> ServiceBuilder<T> {
        self.port = port
        return self
    }
    
    public func with(useTls: Bool) -> ServiceBuilder<T> {
        self.useTls = useTls
        return self
    }
    
    public func with(profile: AccountProfile) -> ServiceBuilder<T> {
        self.profile = profile
        return self
    }
}
