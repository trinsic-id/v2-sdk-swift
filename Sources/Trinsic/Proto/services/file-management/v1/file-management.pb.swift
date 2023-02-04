// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: services/file-management/v1/file-management.proto
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

/// Contains information about a file stored in Trinsic's CDN
public struct Services_Filemanagement_V1_File {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// ID of file, generated randomly by Trinsic on upload
    public var id: String = .init()

    /// Wallet ID of uploader
    public var uploaderID: String = .init()

    /// Size, in bytes, of file
    public var size: UInt32 = 0

    /// Uploader-provided MIME type of file
    public var mimeType: String = .init()

    /// ISO 8601 timestamp of when file was uploaded to Trinsic
    public var uploaded: String = .init()

    /// CDN URL of file
    public var url: String = .init()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
}

/// Represents aggregate statistics of all files uploaded by a single issuer
public struct Services_Filemanagement_V1_StorageStats {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Number of files uploaded by this account
    public var numFiles: UInt32 = 0

    /// Sum total size of all files, in bytes
    public var totalSize: UInt64 = 0

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
}

/// Request to upload a file to Trinsic's CDN
public struct Services_Filemanagement_V1_UploadFileRequest {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Raw content of file
    public var contents: Data = .init()

    /// MIME type describing file contents
    public var mimeType: String = .init()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
}

/// Response to `UploadFileRequest`
public struct Services_Filemanagement_V1_UploadFileResponse {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Information about newly-uploaded file
    public var uploadedFile: Services_Filemanagement_V1_File {
        get { _uploadedFile ?? Services_Filemanagement_V1_File() }
        set { _uploadedFile = newValue }
    }

    /// Returns true if `uploadedFile` has been explicitly set.
    public var hasUploadedFile: Bool { _uploadedFile != nil }
    /// Clears the value of `uploadedFile`. Subsequent reads from it will return its default value.
    public mutating func clearUploadedFile() { _uploadedFile = nil }

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}

    private var _uploadedFile: Services_Filemanagement_V1_File?
}

/// Request to fetch information about a stored file
public struct Services_Filemanagement_V1_GetFileRequest {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// ID of file to fetch
    public var id: String = .init()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
}

/// Response to `GetFileRequest`
public struct Services_Filemanagement_V1_GetFileResponse {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// File specified by `id` parameter of `GetFileRequest`.
    public var file: Services_Filemanagement_V1_File {
        get { _file ?? Services_Filemanagement_V1_File() }
        set { _file = newValue }
    }

    /// Returns true if `file` has been explicitly set.
    public var hasFile: Bool { _file != nil }
    /// Clears the value of `file`. Subsequent reads from it will return its default value.
    public mutating func clearFile() { _file = nil }

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}

    private var _file: Services_Filemanagement_V1_File?
}

/// Request to delete a file from Trinsic's CDN by ID
public struct Services_Filemanagement_V1_DeleteFileRequest {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// ID of file to delete
    public var id: String = .init()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
}

/// Response to `DeleteFileRequest`. Empty payload.
public struct Services_Filemanagement_V1_DeleteFileResponse {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
}

/// Request to list files
public struct Services_Filemanagement_V1_ListFilesRequest {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Query to search with. If not specified, will return the most recent 100 files.
    public var query: String = .init()

    /// Token provided by previous `ListFilesRequest`
    /// if more data is available for query
    public var continuationToken: String = .init()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
}

/// Response to `ListFilesRequest`
public struct Services_Filemanagement_V1_ListFilesResponse {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Files found by query
    public var files: [Services_Filemanagement_V1_File] = []

    /// Whether more results are available for this query via `continuation_token`
    public var hasMoreResults_p: Bool = false

    /// Token to fetch next set of resuts via `ListFilesRequest`
    public var continuationToken: String = .init()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
}

/// Request to get statistics about files uploaded by this account
public struct Services_Filemanagement_V1_GetStorageStatsRequest {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
}

/// Response to `GetStorageStatsRequest`
public struct Services_Filemanagement_V1_GetStorageStatsResponse {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Statistics about files uploaded by the calling account
    public var stats: Services_Filemanagement_V1_StorageStats {
        get { _stats ?? Services_Filemanagement_V1_StorageStats() }
        set { _stats = newValue }
    }

    /// Returns true if `stats` has been explicitly set.
    public var hasStats: Bool { _stats != nil }
    /// Clears the value of `stats`. Subsequent reads from it will return its default value.
    public mutating func clearStats() { _stats = nil }

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}

    private var _stats: Services_Filemanagement_V1_StorageStats?
}

#if swift(>=5.5) && canImport(_Concurrency)
    extension Services_Filemanagement_V1_File: @unchecked Sendable {}
    extension Services_Filemanagement_V1_StorageStats: @unchecked Sendable {}
    extension Services_Filemanagement_V1_UploadFileRequest: @unchecked Sendable {}
    extension Services_Filemanagement_V1_UploadFileResponse: @unchecked Sendable {}
    extension Services_Filemanagement_V1_GetFileRequest: @unchecked Sendable {}
    extension Services_Filemanagement_V1_GetFileResponse: @unchecked Sendable {}
    extension Services_Filemanagement_V1_DeleteFileRequest: @unchecked Sendable {}
    extension Services_Filemanagement_V1_DeleteFileResponse: @unchecked Sendable {}
    extension Services_Filemanagement_V1_ListFilesRequest: @unchecked Sendable {}
    extension Services_Filemanagement_V1_ListFilesResponse: @unchecked Sendable {}
    extension Services_Filemanagement_V1_GetStorageStatsRequest: @unchecked Sendable {}
    extension Services_Filemanagement_V1_GetStorageStatsResponse: @unchecked Sendable {}
#endif // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

private let _protobuf_package = "services.filemanagement.v1"

extension Services_Filemanagement_V1_File: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".File"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "id"),
        2: .standard(proto: "uploader_id"),
        3: .same(proto: "size"),
        4: .standard(proto: "mime_type"),
        5: .same(proto: "uploaded"),
        6: .same(proto: "url"),
    ]

    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try try decoder.decodeSingularStringField(value: &id)
            case 2: try try decoder.decodeSingularStringField(value: &uploaderID)
            case 3: try try decoder.decodeSingularUInt32Field(value: &size)
            case 4: try try decoder.decodeSingularStringField(value: &mimeType)
            case 5: try try decoder.decodeSingularStringField(value: &uploaded)
            case 6: try try decoder.decodeSingularStringField(value: &url)
            default: break
            }
        }
    }

    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if !id.isEmpty {
            try visitor.visitSingularStringField(value: id, fieldNumber: 1)
        }
        if !uploaderID.isEmpty {
            try visitor.visitSingularStringField(value: uploaderID, fieldNumber: 2)
        }
        if size != 0 {
            try visitor.visitSingularUInt32Field(value: size, fieldNumber: 3)
        }
        if !mimeType.isEmpty {
            try visitor.visitSingularStringField(value: mimeType, fieldNumber: 4)
        }
        if !uploaded.isEmpty {
            try visitor.visitSingularStringField(value: uploaded, fieldNumber: 5)
        }
        if !url.isEmpty {
            try visitor.visitSingularStringField(value: url, fieldNumber: 6)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    public static func == (lhs: Services_Filemanagement_V1_File, rhs: Services_Filemanagement_V1_File) -> Bool {
        if lhs.id != rhs.id { return false }
        if lhs.uploaderID != rhs.uploaderID { return false }
        if lhs.size != rhs.size { return false }
        if lhs.mimeType != rhs.mimeType { return false }
        if lhs.uploaded != rhs.uploaded { return false }
        if lhs.url != rhs.url { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Services_Filemanagement_V1_StorageStats: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".StorageStats"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "num_files"),
        2: .standard(proto: "total_size"),
    ]

    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try try decoder.decodeSingularUInt32Field(value: &numFiles)
            case 2: try try decoder.decodeSingularUInt64Field(value: &totalSize)
            default: break
            }
        }
    }

    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if numFiles != 0 {
            try visitor.visitSingularUInt32Field(value: numFiles, fieldNumber: 1)
        }
        if totalSize != 0 {
            try visitor.visitSingularUInt64Field(value: totalSize, fieldNumber: 2)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    public static func == (lhs: Services_Filemanagement_V1_StorageStats, rhs: Services_Filemanagement_V1_StorageStats) -> Bool {
        if lhs.numFiles != rhs.numFiles { return false }
        if lhs.totalSize != rhs.totalSize { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Services_Filemanagement_V1_UploadFileRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".UploadFileRequest"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "contents"),
        2: .standard(proto: "mime_type"),
    ]

    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try try decoder.decodeSingularBytesField(value: &contents)
            case 2: try try decoder.decodeSingularStringField(value: &mimeType)
            default: break
            }
        }
    }

    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if !contents.isEmpty {
            try visitor.visitSingularBytesField(value: contents, fieldNumber: 1)
        }
        if !mimeType.isEmpty {
            try visitor.visitSingularStringField(value: mimeType, fieldNumber: 2)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    public static func == (lhs: Services_Filemanagement_V1_UploadFileRequest, rhs: Services_Filemanagement_V1_UploadFileRequest) -> Bool {
        if lhs.contents != rhs.contents { return false }
        if lhs.mimeType != rhs.mimeType { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Services_Filemanagement_V1_UploadFileResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".UploadFileResponse"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "uploaded_file"),
    ]

    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try try decoder.decodeSingularMessageField(value: &_uploadedFile)
            default: break
            }
        }
    }

    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every if/case branch local when no optimizations
        // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
        // https://github.com/apple/swift-protobuf/issues/1182
        try { if let v = self._uploadedFile {
            try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
        } }()
        try unknownFields.traverse(visitor: &visitor)
    }

    public static func == (lhs: Services_Filemanagement_V1_UploadFileResponse, rhs: Services_Filemanagement_V1_UploadFileResponse) -> Bool {
        if lhs._uploadedFile != rhs._uploadedFile { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Services_Filemanagement_V1_GetFileRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".GetFileRequest"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "id"),
    ]

    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try try decoder.decodeSingularStringField(value: &id)
            default: break
            }
        }
    }

    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if !id.isEmpty {
            try visitor.visitSingularStringField(value: id, fieldNumber: 1)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    public static func == (lhs: Services_Filemanagement_V1_GetFileRequest, rhs: Services_Filemanagement_V1_GetFileRequest) -> Bool {
        if lhs.id != rhs.id { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Services_Filemanagement_V1_GetFileResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".GetFileResponse"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "file"),
    ]

    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try try decoder.decodeSingularMessageField(value: &_file)
            default: break
            }
        }
    }

    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every if/case branch local when no optimizations
        // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
        // https://github.com/apple/swift-protobuf/issues/1182
        try { if let v = self._file {
            try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
        } }()
        try unknownFields.traverse(visitor: &visitor)
    }

    public static func == (lhs: Services_Filemanagement_V1_GetFileResponse, rhs: Services_Filemanagement_V1_GetFileResponse) -> Bool {
        if lhs._file != rhs._file { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Services_Filemanagement_V1_DeleteFileRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".DeleteFileRequest"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "id"),
    ]

    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try try decoder.decodeSingularStringField(value: &id)
            default: break
            }
        }
    }

    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if !id.isEmpty {
            try visitor.visitSingularStringField(value: id, fieldNumber: 1)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    public static func == (lhs: Services_Filemanagement_V1_DeleteFileRequest, rhs: Services_Filemanagement_V1_DeleteFileRequest) -> Bool {
        if lhs.id != rhs.id { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Services_Filemanagement_V1_DeleteFileResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".DeleteFileResponse"
    public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let _ = try decoder.nextFieldNumber() {}
    }

    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        try unknownFields.traverse(visitor: &visitor)
    }

    public static func == (lhs: Services_Filemanagement_V1_DeleteFileResponse, rhs: Services_Filemanagement_V1_DeleteFileResponse) -> Bool {
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Services_Filemanagement_V1_ListFilesRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".ListFilesRequest"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "query"),
        2: .standard(proto: "continuation_token"),
    ]

    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try try decoder.decodeSingularStringField(value: &query)
            case 2: try try decoder.decodeSingularStringField(value: &continuationToken)
            default: break
            }
        }
    }

    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if !query.isEmpty {
            try visitor.visitSingularStringField(value: query, fieldNumber: 1)
        }
        if !continuationToken.isEmpty {
            try visitor.visitSingularStringField(value: continuationToken, fieldNumber: 2)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    public static func == (lhs: Services_Filemanagement_V1_ListFilesRequest, rhs: Services_Filemanagement_V1_ListFilesRequest) -> Bool {
        if lhs.query != rhs.query { return false }
        if lhs.continuationToken != rhs.continuationToken { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Services_Filemanagement_V1_ListFilesResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".ListFilesResponse"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "files"),
        2: .standard(proto: "has_more_results"),
        3: .standard(proto: "continuation_token"),
    ]

    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try try decoder.decodeRepeatedMessageField(value: &files)
            case 2: try try decoder.decodeSingularBoolField(value: &hasMoreResults_p)
            case 3: try try decoder.decodeSingularStringField(value: &continuationToken)
            default: break
            }
        }
    }

    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if !files.isEmpty {
            try visitor.visitRepeatedMessageField(value: files, fieldNumber: 1)
        }
        if hasMoreResults_p != false {
            try visitor.visitSingularBoolField(value: hasMoreResults_p, fieldNumber: 2)
        }
        if !continuationToken.isEmpty {
            try visitor.visitSingularStringField(value: continuationToken, fieldNumber: 3)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    public static func == (lhs: Services_Filemanagement_V1_ListFilesResponse, rhs: Services_Filemanagement_V1_ListFilesResponse) -> Bool {
        if lhs.files != rhs.files { return false }
        if lhs.hasMoreResults_p != rhs.hasMoreResults_p { return false }
        if lhs.continuationToken != rhs.continuationToken { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Services_Filemanagement_V1_GetStorageStatsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".GetStorageStatsRequest"
    public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let _ = try decoder.nextFieldNumber() {}
    }

    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        try unknownFields.traverse(visitor: &visitor)
    }

    public static func == (lhs: Services_Filemanagement_V1_GetStorageStatsRequest, rhs: Services_Filemanagement_V1_GetStorageStatsRequest) -> Bool {
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Services_Filemanagement_V1_GetStorageStatsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".GetStorageStatsResponse"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "stats"),
    ]

    public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try try decoder.decodeSingularMessageField(value: &_stats)
            default: break
            }
        }
    }

    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every if/case branch local when no optimizations
        // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
        // https://github.com/apple/swift-protobuf/issues/1182
        try { if let v = self._stats {
            try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
        } }()
        try unknownFields.traverse(visitor: &visitor)
    }

    public static func == (lhs: Services_Filemanagement_V1_GetStorageStatsResponse, rhs: Services_Filemanagement_V1_GetStorageStatsResponse) -> Bool {
        if lhs._stats != rhs._stats { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}
