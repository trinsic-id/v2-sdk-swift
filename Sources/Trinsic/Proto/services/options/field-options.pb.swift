// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: services/options/field-options.proto
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
private struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
    struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
    typealias Version = _2
}

public struct Services_Options_SdkTemplateOption {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Whether the service endpoint allows anonymous (no auth token necessary) authentication
    /// This is used by the `protoc-gen-trinsic-sdk` plugin for metadata.
    public var anonymous: Bool = false

    /// Whether the SDK template generator should ignore this method. This method will
    /// be wrapped manually.
    public var ignore: Bool = false

    /// Whether the SDK template generator should generate this method without arguments, eg
    /// ProviderService.GetEcosystemInfo() where the request object is empty
    public var noArguments: Bool = false

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
    extension Services_Options_SdkTemplateOption: @unchecked Sendable {}
#endif // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Extension support defined in field-options.proto.

// MARK: - Extension Properties

// Swift Extensions on the exteneded Messages to add easy access to the declared
// extension fields. The names are based on the extension field name from the proto
// declaration. To avoid naming collisions, the names are prefixed with the name of
// the scope where the extend directive occurs.

public extension SwiftProtobuf.Google_Protobuf_FieldOptions {
    /// Whether field is optional in Trinsic's backend.
    /// This is not the same as an `optional` protobuf label;
    /// it only impacts documentation generation for the field.
    var Services_Options_optional: Bool {
        get { getExtensionValue(ext: Services_Options_Extensions_optional) ?? false }
        set { setExtensionValue(ext: Services_Options_Extensions_optional, value: newValue) }
    }

    /// Returns true if extension `Services_Options_Extensions_optional`
    /// has been explicitly set.
    var hasServices_Options_optional: Bool {
        hasExtensionValue(ext: Services_Options_Extensions_optional)
    }

    /// Clears the value of extension `Services_Options_Extensions_optional`.
    /// Subsequent reads from it will return its default value.
    mutating func clearServices_Options_optional() {
        clearExtensionValue(ext: Services_Options_Extensions_optional)
    }
}

public extension SwiftProtobuf.Google_Protobuf_MethodOptions {
    var Services_Options_sdkTemplateOption: Services_Options_SdkTemplateOption {
        get { getExtensionValue(ext: Services_Options_Extensions_sdk_template_option) ?? Services_Options_SdkTemplateOption() }
        set { setExtensionValue(ext: Services_Options_Extensions_sdk_template_option, value: newValue) }
    }

    /// Returns true if extension `Services_Options_Extensions_sdk_template_option`
    /// has been explicitly set.
    var hasServices_Options_sdkTemplateOption: Bool {
        hasExtensionValue(ext: Services_Options_Extensions_sdk_template_option)
    }

    /// Clears the value of extension `Services_Options_Extensions_sdk_template_option`.
    /// Subsequent reads from it will return its default value.
    mutating func clearServices_Options_sdkTemplateOption() {
        clearExtensionValue(ext: Services_Options_Extensions_sdk_template_option)
    }
}

// MARK: - File's ExtensionMap: Services_Options_Field_u45Options_Extensions

/// A `SwiftProtobuf.SimpleExtensionMap` that includes all of the extensions defined by
/// this .proto file. It can be used any place an `SwiftProtobuf.ExtensionMap` is needed
/// in parsing, or it can be combined with other `SwiftProtobuf.SimpleExtensionMap`s to create
/// a larger `SwiftProtobuf.SimpleExtensionMap`.
public let Services_Options_Field_u45Options_Extensions: SwiftProtobuf.SimpleExtensionMap = [
    Services_Options_Extensions_optional,
    Services_Options_Extensions_sdk_template_option,
]

// Extension Objects - The only reason these might be needed is when manually
// constructing a `SimpleExtensionMap`, otherwise, use the above _Extension Properties_
// accessors for the extension fields on the messages directly.

/// Whether field is optional in Trinsic's backend.
/// This is not the same as an `optional` protobuf label;
/// it only impacts documentation generation for the field.
public let Services_Options_Extensions_optional = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufBool>, SwiftProtobuf.Google_Protobuf_FieldOptions>(
    _protobuf_fieldNumber: 60000,
    fieldName: "services.options.optional"
)

public let Services_Options_Extensions_sdk_template_option = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Services_Options_SdkTemplateOption>, SwiftProtobuf.Google_Protobuf_MethodOptions>(
    _protobuf_fieldNumber: 60001,
    fieldName: "services.options.sdk_template_option"
)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

private let _protobuf_package = "services.options"

extension Services_Options_SdkTemplateOption: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".SdkTemplateOption"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "anonymous"),
        2: .same(proto: "ignore"),
        3: .standard(proto: "no_arguments"),
    ]

    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try try decoder.decodeSingularBoolField(value: &anonymous)
            case 2: try try decoder.decodeSingularBoolField(value: &ignore)
            case 3: try try decoder.decodeSingularBoolField(value: &noArguments)
            default: break
            }
        }
    }

    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if anonymous != false {
            try visitor.visitSingularBoolField(value: anonymous, fieldNumber: 1)
        }
        if ignore != false {
            try visitor.visitSingularBoolField(value: ignore, fieldNumber: 2)
        }
        if noArguments != false {
            try visitor.visitSingularBoolField(value: noArguments, fieldNumber: 3)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    public static func == (lhs: Services_Options_SdkTemplateOption, rhs: Services_Options_SdkTemplateOption) -> Bool {
        if lhs.anonymous != rhs.anonymous { return false }
        if lhs.ignore != rhs.ignore { return false }
        if lhs.noArguments != rhs.noArguments { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}
