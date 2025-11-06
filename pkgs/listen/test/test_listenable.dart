import 'package:listen/listen.dart';

class TestListenable extends Listenable {
  final _listeners = <void Function()>{};

  void notify() {
    for (final listener in _listeners) {
      listener();
    }
  }

  @override
  void addListener(void Function() listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(void Function() listener) {
    _listeners.remove(listener);
  }
}
