/// Close the HttpServer on process TERM signals.
///
/// You can run the shelf server in docker containers.
///
/// Because of the Dart compiler can generate single binary executables,
/// you can get very small docker container images.
/// It is good.
///
/// There is one problem that that containers do not shutdown smooth on docker
/// controller's termination signal.
///
/// This library helps to do that.
library shelf_docker_shutdown;

export 'src/shelf_docker_shutdown_base.dart';
