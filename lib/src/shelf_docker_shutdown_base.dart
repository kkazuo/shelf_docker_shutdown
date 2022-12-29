import 'dart:async';
import 'dart:io';

/// HttpServer extensions
extension HttpServerCloseOnTermSignalExt on HttpServer {
  /// Close server on process TERM (or INT) signal.
  Future<dynamic> closeOnTermSignal() async {
    StreamSubscription<ProcessSignal>? sigint;
    StreamSubscription<ProcessSignal>? sigterm;

    sigint = ProcessSignal.sigint.watch().take(1).listen(
      (_) {
        sigterm?.cancel();
      },
    );
    sigterm = ProcessSignal.sigterm.watch().take(1).listen(
      (_) {
        sigint?.cancel();
      },
    );

    return Future.any([sigint.asFuture<Object?>(), sigterm.asFuture<Object?>()])
        .then((_) async => close());
  }
}
