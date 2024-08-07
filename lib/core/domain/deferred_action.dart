import 'dart:async';

class DeferredAction {
  DeferredAction({
    required this.callback,
    this.delay = const Duration(seconds: 2),
  });

  final FutureOr<void> Function() callback;

  Timer? _timer;
  final Duration delay;
  void call() {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(
      const Duration(seconds: 1),
      callback,
    );
  }
}
