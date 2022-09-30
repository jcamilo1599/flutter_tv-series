import 'package:tv_series/domain/models/series/series/serie.dart';

class DataTest {
  static final SerieModel serie = SerieModel.fromJson(<String, dynamic>{
    'backdrop_path': '/7q448EVOnuE3gVAx24krzO7SNXM.jpg',
    'first_air_date': '2021-09-03',
    'genre_ids': <int>[10764],
    'id': 130392,
    'name': "The D'Amelio Show",
    'origin_country': <String>['US'],
    'original_language': 'en',
    'original_name': "The D'Amelio Show",
    'overview':
        'Al pasar de una relativa sombra y una vida aparentemente normal a ser lanzados a los focos de Hollywood casi de la noche a la mañana, los D’Amelio se enfrentan a retos y oportunidades que nunca habrían imaginado. Charli, Dixie, Heidi y Marc hacen todo lo posible por mantenerse unidos mientras intentan adaptarse a la vida en Hollywood.',
    'popularity': 76.713,
    'poster_path': '/z0iCS5Znx7TeRwlYSd4c01Z0lFx.jpg',
    'vote_average': 9.1,
    'vote_count': 2970
  });
}
