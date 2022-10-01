import 'package:flutter/material.dart';

import '../../../ui/pages/watch_now/watch_now.dart';

class WatchNowUseCase {
  WatchNowUseCase();

  void watch(
    BuildContext context, {
    required int idSerie,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (_) => WatchNowPage(idSerie: idSerie)),
    );

    // TODO: cuando se va a ver una serie, se debe añadir a "recientes"
  }
}
