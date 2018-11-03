import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:grpc/src/server/call.dart';

import 'generated/echo.pbgrpc.dart';

class ServiceImpl extends EchoServiceBase {
  @override
  Future<ClientStreamingEchoResponse> clientStreamingEcho(
      ServiceCall call, Stream<ClientStreamingEchoRequest> request) {
    // TODO: implement clientStreamingEcho
  }

  @override
  Future<EchoResponse> echo(ServiceCall call, EchoRequest request) async {
//    call.headers.addAll(call.clientMetadata);
    return EchoResponse()..message = request.message;
  }

  @override
  Future<EchoResponse> echoAbort(ServiceCall call, EchoRequest request) {
    throw GrpcError.aborted('Aborted from server side.');
  }

  @override
  Stream<EchoResponse> fullDuplexEcho(
      ServiceCall call, Stream<EchoRequest> request) {}

  @override
  Stream<EchoResponse> halfDuplexEcho(
      ServiceCall call, Stream<EchoRequest> request) {
    // TODO: implement halfDuplexEcho
  }

  @override
  Future<Empty> noOp(ServiceCall call, Empty request) {
    // TODO: implement noOp
  }

  @override
  Stream<ServerStreamingEchoResponse> serverStreamingEcho(
      ServiceCall call, ServerStreamingEchoRequest request) async* {
//    call.headers.addAll(call.clientMetadata);
    for (var i = 0; i < request.messageCount; i++) {
      yield ServerStreamingEchoResponse()..message = request.message;
      await Future.delayed(Duration(milliseconds: request.messageInterval));
    }
  }

  @override
  Stream<ServerStreamingEchoResponse> serverStreamingEchoAbort(
      ServiceCall call, ServerStreamingEchoRequest request) {
    return Stream<ServerStreamingEchoResponse>.fromFuture(
        Future.error(GrpcError.aborted('Aborted from server side.')));
  }
}
