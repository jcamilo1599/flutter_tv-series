import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/use_case_config.dart';
import '../../../../../domain/models/series/series/serie.dart';
import '../../../../common/atoms/image_network.dart';

class RecentsPage extends ConsumerWidget {
  RecentsPage({Key? key}) : super(key: key);

  final UseCaseConfig _config = UseCaseConfig();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SerieModel> series = _config.recentsUseCase.getRecents(ref);

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: List<Widget>.generate(series.length, (int index) {
        return Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 360,
                child: AtomsImageNetwork(path: series[index].posterPath!),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              series[index].name ?? '',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              '- episodes of ${series[index].numberOfEpisodes ?? '-'}',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () => _config.watchNowUseCase.watch(context, idSerie: series[index].id!),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text('Go to view'),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward_ios, size: 14)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        );
      }),
    );
  }
}
