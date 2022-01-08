// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: services/verifiable-credentials/v1/verifiable-credentials.proto
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

public struct Services_Verifiablecredentials_V1_IssueRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var document: Services_Common_V1_JsonPayload {
    get {return _document ?? Services_Common_V1_JsonPayload()}
    set {_document = newValue}
  }
  /// Returns true if `document` has been explicitly set.
  public var hasDocument: Bool {return self._document != nil}
  /// Clears the value of `document`. Subsequent reads from it will return its default value.
  public mutating func clearDocument() {self._document = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _document: Services_Common_V1_JsonPayload? = nil
}

public struct Services_Verifiablecredentials_V1_IssueResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var document: Services_Common_V1_JsonPayload {
    get {return _document ?? Services_Common_V1_JsonPayload()}
    set {_document = newValue}
  }
  /// Returns true if `document` has been explicitly set.
  public var hasDocument: Bool {return self._document != nil}
  /// Clears the value of `document`. Subsequent reads from it will return its default value.
  public mutating func clearDocument() {self._document = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _document: Services_Common_V1_JsonPayload? = nil
}

public struct Services_Verifiablecredentials_V1_IssueFromTemplateRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var templateID: String = String()

  public var valuesJson: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Services_Verifiablecredentials_V1_IssueFromTemplateResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var documentJson: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Create Proof
public struct Services_Verifiablecredentials_V1_CreateProofRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var revealDocument: Services_Common_V1_JsonPayload {
    get {return _revealDocument ?? Services_Common_V1_JsonPayload()}
    set {_revealDocument = newValue}
  }
  /// Returns true if `revealDocument` has been explicitly set.
  public var hasRevealDocument: Bool {return self._revealDocument != nil}
  /// Clears the value of `revealDocument`. Subsequent reads from it will return its default value.
  public mutating func clearRevealDocument() {self._revealDocument = nil}

  public var documentID: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _revealDocument: Services_Common_V1_JsonPayload? = nil
}

public struct Services_Verifiablecredentials_V1_CreateProofResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var proofDocument: Services_Common_V1_JsonPayload {
    get {return _proofDocument ?? Services_Common_V1_JsonPayload()}
    set {_proofDocument = newValue}
  }
  /// Returns true if `proofDocument` has been explicitly set.
  public var hasProofDocument: Bool {return self._proofDocument != nil}
  /// Clears the value of `proofDocument`. Subsequent reads from it will return its default value.
  public mutating func clearProofDocument() {self._proofDocument = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _proofDocument: Services_Common_V1_JsonPayload? = nil
}

/// Verify Proof
public struct Services_Verifiablecredentials_V1_VerifyProofRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var proofDocument: Services_Common_V1_JsonPayload {
    get {return _proofDocument ?? Services_Common_V1_JsonPayload()}
    set {_proofDocument = newValue}
  }
  /// Returns true if `proofDocument` has been explicitly set.
  public var hasProofDocument: Bool {return self._proofDocument != nil}
  /// Clears the value of `proofDocument`. Subsequent reads from it will return its default value.
  public mutating func clearProofDocument() {self._proofDocument = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _proofDocument: Services_Common_V1_JsonPayload? = nil
}

public struct Services_Verifiablecredentials_V1_VerifyProofResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var valid: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Services_Verifiablecredentials_V1_SendRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var deliveryMethod: Services_Verifiablecredentials_V1_SendRequest.OneOf_DeliveryMethod? = nil

  public var email: String {
    get {
      if case .email(let v)? = deliveryMethod {return v}
      return String()
    }
    set {deliveryMethod = .email(newValue)}
  }

  public var didUri: String {
    get {
      if case .didUri(let v)? = deliveryMethod {return v}
      return String()
    }
    set {deliveryMethod = .didUri(newValue)}
  }

  public var didcommInvitation: Services_Common_V1_JsonPayload {
    get {
      if case .didcommInvitation(let v)? = deliveryMethod {return v}
      return Services_Common_V1_JsonPayload()
    }
    set {deliveryMethod = .didcommInvitation(newValue)}
  }

  public var document: Services_Common_V1_JsonPayload {
    get {return _document ?? Services_Common_V1_JsonPayload()}
    set {_document = newValue}
  }
  /// Returns true if `document` has been explicitly set.
  public var hasDocument: Bool {return self._document != nil}
  /// Clears the value of `document`. Subsequent reads from it will return its default value.
  public mutating func clearDocument() {self._document = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum OneOf_DeliveryMethod: Equatable {
    case email(String)
    case didUri(String)
    case didcommInvitation(Services_Common_V1_JsonPayload)

  #if !swift(>=4.1)
    public static func ==(lhs: Services_Verifiablecredentials_V1_SendRequest.OneOf_DeliveryMethod, rhs: Services_Verifiablecredentials_V1_SendRequest.OneOf_DeliveryMethod) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.email, .email): return {
        guard case .email(let l) = lhs, case .email(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.didUri, .didUri): return {
        guard case .didUri(let l) = lhs, case .didUri(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.didcommInvitation, .didcommInvitation): return {
        guard case .didcommInvitation(let l) = lhs, case .didcommInvitation(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  public init() {}

  fileprivate var _document: Services_Common_V1_JsonPayload? = nil
}

public struct Services_Verifiablecredentials_V1_SendResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var status: Services_Common_V1_ResponseStatus = .success

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// request object to update the status of the revocation entry
public struct Services_Verifiablecredentials_V1_UpdateStatusRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// the credential status id
  public var credentialStatusID: String = String()

  /// indicates if the status is revoked
  public var revoked: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// response object for update of status of revocation entry
public struct Services_Verifiablecredentials_V1_UpdateStatusResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var status: Services_Common_V1_ResponseStatus = .success

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// request object to update the status of the revocation entry
public struct Services_Verifiablecredentials_V1_CheckStatusRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// the credential status id
  public var credentialStatusID: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// response object for update of status of revocation entry
public struct Services_Verifiablecredentials_V1_CheckStatusResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// indicates if the status is revoked
  public var revoked: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "services.verifiablecredentials.v1"

extension Services_Verifiablecredentials_V1_IssueRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".IssueRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "document"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._document) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._document {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Verifiablecredentials_V1_IssueRequest, rhs: Services_Verifiablecredentials_V1_IssueRequest) -> Bool {
    if lhs._document != rhs._document {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Verifiablecredentials_V1_IssueResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".IssueResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "document"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._document) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._document {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Verifiablecredentials_V1_IssueResponse, rhs: Services_Verifiablecredentials_V1_IssueResponse) -> Bool {
    if lhs._document != rhs._document {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Verifiablecredentials_V1_IssueFromTemplateRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".IssueFromTemplateRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "template_id"),
    2: .standard(proto: "values_json"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.templateID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.valuesJson) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.templateID.isEmpty {
      try visitor.visitSingularStringField(value: self.templateID, fieldNumber: 1)
    }
    if !self.valuesJson.isEmpty {
      try visitor.visitSingularStringField(value: self.valuesJson, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Verifiablecredentials_V1_IssueFromTemplateRequest, rhs: Services_Verifiablecredentials_V1_IssueFromTemplateRequest) -> Bool {
    if lhs.templateID != rhs.templateID {return false}
    if lhs.valuesJson != rhs.valuesJson {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Verifiablecredentials_V1_IssueFromTemplateResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".IssueFromTemplateResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "document_json"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.documentJson) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.documentJson.isEmpty {
      try visitor.visitSingularStringField(value: self.documentJson, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Verifiablecredentials_V1_IssueFromTemplateResponse, rhs: Services_Verifiablecredentials_V1_IssueFromTemplateResponse) -> Bool {
    if lhs.documentJson != rhs.documentJson {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Verifiablecredentials_V1_CreateProofRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CreateProofRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "reveal_document"),
    2: .standard(proto: "document_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._revealDocument) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.documentID) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._revealDocument {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.documentID.isEmpty {
      try visitor.visitSingularStringField(value: self.documentID, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Verifiablecredentials_V1_CreateProofRequest, rhs: Services_Verifiablecredentials_V1_CreateProofRequest) -> Bool {
    if lhs._revealDocument != rhs._revealDocument {return false}
    if lhs.documentID != rhs.documentID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Verifiablecredentials_V1_CreateProofResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CreateProofResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "proof_document"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._proofDocument) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._proofDocument {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Verifiablecredentials_V1_CreateProofResponse, rhs: Services_Verifiablecredentials_V1_CreateProofResponse) -> Bool {
    if lhs._proofDocument != rhs._proofDocument {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Verifiablecredentials_V1_VerifyProofRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".VerifyProofRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "proof_document"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._proofDocument) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._proofDocument {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Verifiablecredentials_V1_VerifyProofRequest, rhs: Services_Verifiablecredentials_V1_VerifyProofRequest) -> Bool {
    if lhs._proofDocument != rhs._proofDocument {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Verifiablecredentials_V1_VerifyProofResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".VerifyProofResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "valid"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBoolField(value: &self.valid) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.valid != false {
      try visitor.visitSingularBoolField(value: self.valid, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Verifiablecredentials_V1_VerifyProofResponse, rhs: Services_Verifiablecredentials_V1_VerifyProofResponse) -> Bool {
    if lhs.valid != rhs.valid {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Verifiablecredentials_V1_SendRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SendRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "email"),
    2: .standard(proto: "did_uri"),
    3: .standard(proto: "didcomm_invitation"),
    100: .same(proto: "document"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        var v: String?
        try decoder.decodeSingularStringField(value: &v)
        if let v = v {
          if self.deliveryMethod != nil {try decoder.handleConflictingOneOf()}
          self.deliveryMethod = .email(v)
        }
      }()
      case 2: try {
        var v: String?
        try decoder.decodeSingularStringField(value: &v)
        if let v = v {
          if self.deliveryMethod != nil {try decoder.handleConflictingOneOf()}
          self.deliveryMethod = .didUri(v)
        }
      }()
      case 3: try {
        var v: Services_Common_V1_JsonPayload?
        var hadOneofValue = false
        if let current = self.deliveryMethod {
          hadOneofValue = true
          if case .didcommInvitation(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.deliveryMethod = .didcommInvitation(v)
        }
      }()
      case 100: try { try decoder.decodeSingularMessageField(value: &self._document) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    switch self.deliveryMethod {
    case .email?: try {
      guard case .email(let v)? = self.deliveryMethod else { preconditionFailure() }
      try visitor.visitSingularStringField(value: v, fieldNumber: 1)
    }()
    case .didUri?: try {
      guard case .didUri(let v)? = self.deliveryMethod else { preconditionFailure() }
      try visitor.visitSingularStringField(value: v, fieldNumber: 2)
    }()
    case .didcommInvitation?: try {
      guard case .didcommInvitation(let v)? = self.deliveryMethod else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }()
    case nil: break
    }
    try { if let v = self._document {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 100)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Verifiablecredentials_V1_SendRequest, rhs: Services_Verifiablecredentials_V1_SendRequest) -> Bool {
    if lhs.deliveryMethod != rhs.deliveryMethod {return false}
    if lhs._document != rhs._document {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Verifiablecredentials_V1_SendResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SendResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "status"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.status) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.status != .success {
      try visitor.visitSingularEnumField(value: self.status, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Verifiablecredentials_V1_SendResponse, rhs: Services_Verifiablecredentials_V1_SendResponse) -> Bool {
    if lhs.status != rhs.status {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Verifiablecredentials_V1_UpdateStatusRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".UpdateStatusRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "credential_status_id"),
    2: .same(proto: "revoked"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.credentialStatusID) }()
      case 2: try { try decoder.decodeSingularBoolField(value: &self.revoked) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.credentialStatusID.isEmpty {
      try visitor.visitSingularStringField(value: self.credentialStatusID, fieldNumber: 1)
    }
    if self.revoked != false {
      try visitor.visitSingularBoolField(value: self.revoked, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Verifiablecredentials_V1_UpdateStatusRequest, rhs: Services_Verifiablecredentials_V1_UpdateStatusRequest) -> Bool {
    if lhs.credentialStatusID != rhs.credentialStatusID {return false}
    if lhs.revoked != rhs.revoked {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Verifiablecredentials_V1_UpdateStatusResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".UpdateStatusResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "status"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.status) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.status != .success {
      try visitor.visitSingularEnumField(value: self.status, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Verifiablecredentials_V1_UpdateStatusResponse, rhs: Services_Verifiablecredentials_V1_UpdateStatusResponse) -> Bool {
    if lhs.status != rhs.status {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Verifiablecredentials_V1_CheckStatusRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CheckStatusRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "credential_status_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.credentialStatusID) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.credentialStatusID.isEmpty {
      try visitor.visitSingularStringField(value: self.credentialStatusID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Verifiablecredentials_V1_CheckStatusRequest, rhs: Services_Verifiablecredentials_V1_CheckStatusRequest) -> Bool {
    if lhs.credentialStatusID != rhs.credentialStatusID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Services_Verifiablecredentials_V1_CheckStatusResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CheckStatusResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "revoked"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBoolField(value: &self.revoked) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.revoked != false {
      try visitor.visitSingularBoolField(value: self.revoked, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Services_Verifiablecredentials_V1_CheckStatusResponse, rhs: Services_Verifiablecredentials_V1_CheckStatusResponse) -> Bool {
    if lhs.revoked != rhs.revoked {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
