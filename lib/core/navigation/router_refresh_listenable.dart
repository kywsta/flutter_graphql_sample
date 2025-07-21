import 'dart:async';

import 'package:flutter/widgets.dart';

class RouterRefreshListenable extends ChangeNotifier {
  RouterRefreshListenable(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
