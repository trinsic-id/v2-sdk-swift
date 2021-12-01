#!/bin/bash
PROTOC=`which protoc`
PROTOC_GEN_SWIFT=`which protoc-gen-swift`
PROTOC_GEN_GRPC_SWIFT=`which protoc-gen-grpc-swift`

PROTO_ROOT=./sdk/proto/
PROTO_DIR=./sdk/proto/services
OUT_DIR=./Sources/Proto

for f in $(find $PROTO_ROOT -name "*.proto");
do
    ${PROTOC} \
    --proto_path=${PROTO_ROOT} \
    --plugin=${PROTOC_GEN_SWIFT} \
    --swift_opt=Visibility=Public \
    --swift_out=${OUT_DIR} \
    --plugin=${PROTOC_GEN_GRPC_SWIFT} \
    --grpc-swift_opt=Visibility=Public \
    --grpc-swift_opt=KeepMethodCasing=true \
    --grpc-swift_out=${OUT_DIR} $f
done