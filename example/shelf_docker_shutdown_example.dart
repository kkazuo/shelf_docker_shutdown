import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_docker_shutdown/shelf_docker_shutdown.dart';

void main() async {
  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(_echoRequest);

  var server = await shelf_io.serve(handler, 'localhost', 8080);

  // Enable content compression
  server.autoCompress = true;

  print('Serving at http://${server.address.host}:${server.port}');

  await server.closeOnTermSignal();
  print('Server shutdown ok.');
}

Response _echoRequest(Request request) =>
    Response.ok('Request for "${request.url}"');
