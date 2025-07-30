import 'dart:async';

extension ToStreamExtension<T> on Iterable<T> {
  /// Converts the iterable to a [Stream].
  ///
  /// Wraps the iterable in a [Stream] that emits all the values in this iterable. If
  /// iteration is paused, the stream's events will be paused and vice versa. If an
  /// error is thrown during iteration, the stream will emit the error and then close.
  ///
  /// If [isBroadcast] is set to true, the stream will be a broadcast stream. Otherwise,
  /// the stream will be a single-subscription stream. (Default is false.)
  ///
  /// If a [delay] is provided, the amount of time specified by [delay] will be waited before
  /// each element of this iterable is sent to the stream, including the first.
  ///
  /// (If [delay] is omitted, this is identical to calling `Stream.fromIterable(iterable)`.)
  Stream<T> toStream({bool isBroadcast = false, Duration? delay}) {
    if (delay == null) {
      final stream = Stream.fromIterable(this);
      if (isBroadcast) return stream.asBroadcastStream();
      return stream;
    }

    final controller = StreamController<T>();

    unawaited(() async {
      final iterator = this.iterator;
      while (iterator.moveNext()) {
        try {
          await Future<void>.delayed(delay);
          controller.sink.add(iterator.current);
        } catch (e) {
          controller.sink.addError(e);
        }
      }
      controller.close();
    }());

    if (isBroadcast) return controller.stream.asBroadcastStream();
    return controller.stream;
  }
}
