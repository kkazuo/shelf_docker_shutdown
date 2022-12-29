<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Close the HttpServer on process TERM signals.

## Motivation

You can run the shelf server in docker containers.

Because of the Dart compiler can generate single binary executables,
you can get very small docker container images.
It is good.

There is one problem that that containers do not shutdown smooth on docker controller's termination signal.

This library helps to do that.

## Usage

```dart
var server = await shelf_io.serve(handler, 'localhost', 8080);
await server.closeOnTermSignal();
```

See `example` folder for more details.
