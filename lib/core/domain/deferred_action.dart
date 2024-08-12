import 'dart:async';
import 'dart:developer';

class DeferredAction {
  DeferredAction({
    required this.callback,
    this.delay = const Duration(seconds: 2),
  });

  final FutureOr<void> Function() callback;

  Timer? _timer;

  final Duration delay;

  void call() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }

    _timer = Timer(
      delay,
      callback,
    );
  }

  Future<void> dispose() async {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      final result = await callback();
      log('dispose defferred action');
    }
  }
}
