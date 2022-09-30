import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifier.dart';

final ChangeNotifierProvider<SessionNotifier> sessionProvider =
    ChangeNotifierProvider<SessionNotifier>((_) {
  return SessionNotifier();
});
