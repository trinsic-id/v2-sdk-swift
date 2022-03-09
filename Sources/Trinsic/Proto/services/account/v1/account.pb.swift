// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: services/account/v1/account.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// Confirmation method type for two-factor workflows
public enum Services_Account_V1_ConfirmationMethod: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// No confirmation required
  case none // = 0

  /// Email confirmation required
  case email // = 1

  /// SMS confirmation required
  case sms // = 2

  /// Confirmation from a connected device is required
  case connectedDevice // = 3

  /// Indicates third-party method of confirmation is required
  case other // = 10
  case UNRECOGNIZED(Int)

  public init() {
    self = .none
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .none
    case 1: self = .email
    case 2: self = .sms
    case 3: self = .connectedDevice
    case 10: self = .other
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .none: return 0
    case .email: return 1
    case .sms: return 2
    case .connectedDevice: return 3
    case .other: return 10
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Services_Account_V1_ConfirmationMethod: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Services_Account_V1_ConfirmationMethod] = [
    .none,
    .email,
    .sms,
    .connectedDevice,
    .other,
  ]
}

#endif  // swift(>=4.2)

/// Request for creating new account
public struct Services_Account_V1_SignInRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Account registration details
  public var details: Services_Account_V1_AccountDetails {
    get {return _details ?? Services_Account_V1_AccountDetails()}
    set {_details = newValue}
  }
  /// Returns true if `details` has been explicitly set.
  public var hasDetails: Bool {return self._details != nil}
  /// Clears the value of `details`. Subsequent reads from it will return its default value.
  public mutating func clearDetails() {self._details = nil}

  /// Invitation code associated with this registration
  /// This field is optional.
  public var invitationCode: String = String()

  /// EcosystemId to sign in. This field is optional
  /// and will be ignored if invitation_code is passed
  public var ecosystemID: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _details: Services_Account_V1_AccountDetails? = nil
}

/// Account Registration Details
public struct Services_Account_V1_AccountDetails {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Account name (optional)
  public var name: String = String()

  /// Email account (required)
  public var email: String = String()

  /// SMS number including country code (optional)
  public var sms: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Response for creating new account
/// This object will indicate if a confirmation code
/// was sent to one of the users two-factor methods
/// like email, SMS, etc.
public struct Services_Account_V1_SignInResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The status of the response
  public var status: Services_Common_V1_ResponseStatus = .success

  /// Indicates if confirmation of account is required.
  /// This settings is configured globally by the server administrator.
  public var confirmationMethod: Services_Account_V1_ConfirmationMethod = .none

  /// Contains authentication data for use with the current device.
  /// This object must be stored in a secure place. It can also be
  /// protected with a PIN, but this is optional.
  /// See the docs at https://docs.trinsic.id for more information
  /// on working with authentication data.
  public var profile: Services_Account_V1_AccountProfile {
    get {return _profile ?? Services_Account_V1_AccountProfile()}
    set {_profile = newValue}
  }
  /// Returns true if `profile` has been explicitly set.
  public var hasProfile: Bool {return self._profile != nil}
  /// Clears the value of `profile`. Subsequent reads from it will return its default value.
  public mutating func clearProfile() {self._profile = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _profile: Services_Account_V1_AccountProfile? = nil
}

/// Device profile containing sensitive authentication data.
/// This information should be stored securely
public struct Services_Account_V1_AccountProfile {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The type of profile, used to differentiate between
  /// protocol schemes or versions
  public var profileType: String = String()

  /// Auth data containg information about the current device access
  public var authData: Data = Data()

  /// Secure token issued by server used to generate zero-knowledge proofs
  public var authToken: Data = Data()

  /// Token security information about the token.
  /// If token protection is enabled, implementations must supply
  /// protection secret before using the token for authentication.
  public var protection: Services_Account_V1_TokenProtection {
    get {return _protection ?? Services_Account_V1_TokenProtection()}
    set {_protection = newValue}
  }
  /// Returns true if `protection` has been explicitly set.
  public var hasProtection: Bool {return self._protection != nil}
  /// Clears the value of `protection`. Subsequent reads from it will return its default value.
  public mutating func clearProtection() {self._protection = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _protection: Services_Account_V1_TokenProtection? = nil
}

/// Token protection info
public struct Services_Account_V1_TokenProtection {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Indicates if token is protected using a PIN,
  /// security code, HSM secret, etc.
  public var enabled: Bool = false

  /// The method used to protect the token
  public var method: Services_Account_V1_ConfirmationMethod = .none

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Services_Account_V1_InfoRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Services_Account_V1_InfoResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The account details associated with
  /// the calling request context
  public var details: Services_Account_V1_AccountDetails {
    get {return _details ?? Services_Account_V1_AccountDetails()}
    set {_details = newValue}
  }
  /// Returns true if `details` has been explicitly set.
  public var hasDetails: Bool {return self._details != nil}
  /// Clears the value of `details`. Subsequent reads from it will return its default value.
  public mutating func clearDetails() {self._details = nil}

  /// any ecosystems the account has access to
  public var ecosystems: [Services_Account_V1_AccountEcosystem] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _details: Services_Account_V1_AccountDetails? = nil
}

public struct Services_Account_V1_ListDevicesRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Services_Account_V1_ListDevicesResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Services_Account_V1_RevokeDeviceRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Services_Account_V1_RevokeDeviceResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Services_Account_V1_AccountEcosystem {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var id: String = String()

  public var name: String = String()

  public var description_p: String = String()

  public var uri: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Services_Account_V1_ConfirmationMethod: @unchecked Sendable {}
extension Services_Account_V1_SignInRequest: @unchecked Sendable {}
extension Services_Account_V1_AccountDetails: @unchecked Sendable {}
extension Services_Account_V1_SignInResponse: @unchecked Sendable {}
extension Services_Account_V1_AccountProfile: @unchecked Sendable {}
extension Services_Account_V1_TokenProtection: @unchecked Sendable {}
extension Services_Account_V1_InfoRequest: @unchecked Sendable {}
extension Services_Account_V1_InfoResponse: @unchecked Sendable {}
extension Services_Account_V1_ListDevicesRequest: @unchecked Sendable {}
extension Services_Account_V1_ListDevicesResponse: @unchecked Sendable {}
extension Services_Account_V1_RevokeDeviceRequest: @unchecked Sendable {}
extension Services_Account_V1_RevokeDeviceResponse: @unchecked Sendable {}
extension Services_Account_V1_AccountEcosystem: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "services.account.v1"

extension Services_Account_V1_ConfirmationMethod: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "None"),
    1: .same(proto: "Email"),
    2: .same(proto: "Sms"),
    3: .same(proto: "ConnectedDevice"),
    10: .same(proto: "Other"),
  ]
}

extension Services_Account_V1_SignInRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SignInRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "details"),
    2: .standard(proto: "invitation_code"),
    3: .standard(proto: "ecosystem_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._details) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.invitationCode) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.ecosystemID) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._details {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.invitationCode.isEmpty {
      try visitor.visitSingularStringField(value: self.invitationCode, fieldNumber: 2)
    }
    if !self.ecosystemID.isEmpty {
      try visitor.visitSingularStringField(value: self.ecosystemID, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Account_V1_SignInRequest, rhs: Services_Account_V1_SignInRequest) -> Bool {
    if lhs._details != rhs._details {return false}
    if lhs.invitationCode != rhs.invitationCode {return false}
    if lhs.ecosystemID != rhs.ecosystemID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Account_V1_AccountDetails: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".AccountDetails"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "email"),
    3: .same(proto: "sms"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.email) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.sms) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if !self.email.isEmpty {
      try visitor.visitSingularStringField(value: self.email, fieldNumber: 2)
    }
    if !self.sms.isEmpty {
      try visitor.visitSingularStringField(value: self.sms, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Account_V1_AccountDetails, rhs: Services_Account_V1_AccountDetails) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.email != rhs.email {return false}
    if lhs.sms != rhs.sms {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Account_V1_SignInResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SignInResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "status"),
    3: .standard(proto: "confirmation_method"),
    4: .same(proto: "profile"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.status) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self.confirmationMethod) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._profile) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.status != .success {
      try visitor.visitSingularEnumField(value: self.status, fieldNumber: 1)
    }
    if self.confirmationMethod != .none {
      try visitor.visitSingularEnumField(value: self.confirmationMethod, fieldNumber: 3)
    }
    try { if let v = self._profile {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Account_V1_SignInResponse, rhs: Services_Account_V1_SignInResponse) -> Bool {
    if lhs.status != rhs.status {return false}
    if lhs.confirmationMethod != rhs.confirmationMethod {return false}
    if lhs._profile != rhs._profile {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Account_V1_AccountProfile: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".AccountProfile"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "profile_type"),
    2: .standard(proto: "auth_data"),
    3: .standard(proto: "auth_token"),
    4: .same(proto: "protection"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.profileType) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.authData) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.authToken) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._protection) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.profileType.isEmpty {
      try visitor.visitSingularStringField(value: self.profileType, fieldNumber: 1)
    }
    if !self.authData.isEmpty {
      try visitor.visitSingularBytesField(value: self.authData, fieldNumber: 2)
    }
    if !self.authToken.isEmpty {
      try visitor.visitSingularBytesField(value: self.authToken, fieldNumber: 3)
    }
    try { if let v = self._protection {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Account_V1_AccountProfile, rhs: Services_Account_V1_AccountProfile) -> Bool {
    if lhs.profileType != rhs.profileType {return false}
    if lhs.authData != rhs.authData {return false}
    if lhs.authToken != rhs.authToken {return false}
    if lhs._protection != rhs._protection {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Account_V1_TokenProtection: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".TokenProtection"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "enabled"),
    2: .same(proto: "method"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBoolField(value: &self.enabled) }()
      case 2: try { try decoder.decodeSingularEnumField(value: &self.method) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.enabled != false {
      try visitor.visitSingularBoolField(value: self.enabled, fieldNumber: 1)
    }
    if self.method != .none {
      try visitor.visitSingularEnumField(value: self.method, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Account_V1_TokenProtection, rhs: Services_Account_V1_TokenProtection) -> Bool {
    if lhs.enabled != rhs.enabled {return false}
    if lhs.method != rhs.method {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Account_V1_InfoRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".InfoRequest"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Account_V1_InfoRequest, rhs: Services_Account_V1_InfoRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Account_V1_InfoResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".InfoResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "details"),
    2: .same(proto: "ecosystems"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._details) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.ecosystems) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._details {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.ecosystems.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.ecosystems, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Account_V1_InfoResponse, rhs: Services_Account_V1_InfoResponse) -> Bool {
    if lhs._details != rhs._details {return false}
    if lhs.ecosystems != rhs.ecosystems {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Account_V1_ListDevicesRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ListDevicesRequest"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Account_V1_ListDevicesRequest, rhs: Services_Account_V1_ListDevicesRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Account_V1_ListDevicesResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ListDevicesResponse"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Account_V1_ListDevicesResponse, rhs: Services_Account_V1_ListDevicesResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Account_V1_RevokeDeviceRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".RevokeDeviceRequest"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Account_V1_RevokeDeviceRequest, rhs: Services_Account_V1_RevokeDeviceRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Account_V1_RevokeDeviceResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".RevokeDeviceResponse"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Account_V1_RevokeDeviceResponse, rhs: Services_Account_V1_RevokeDeviceResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Account_V1_AccountEcosystem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".AccountEcosystem"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "name"),
    3: .same(proto: "description"),
    4: .same(proto: "uri"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.uri) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 3)
    }
    if !self.uri.isEmpty {
      try visitor.visitSingularStringField(value: self.uri, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Account_V1_AccountEcosystem, rhs: Services_Account_V1_AccountEcosystem) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.name != rhs.name {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.uri != rhs.uri {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
