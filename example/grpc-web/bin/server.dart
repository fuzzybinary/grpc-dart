import 'package:grpc/grpc.dart';
import 'package:grpc_web/src/server.dart';

void main() async {
  final server = Server([ServiceImpl()]);
  await server.serve(port: 9090);
  print('server running: ${server.port}');
}