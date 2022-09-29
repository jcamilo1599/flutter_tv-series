// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_one_api_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesOneApiRespModel _$SeriesOneApiRespModelFromJson(
        Map<String, dynamic> json) =>
    SeriesOneApiRespModel(
      adult: json['adult'] as bool,
      backdropPath: json['backdropPath'] as String,
      createdBy: (json['createdBy'] as List<dynamic>)
          .map((e) => CreatedByModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      episodeRunTime: json['episodeRunTime'] as List<dynamic>,
      firstAirDate: DateTime.parse(json['firstAirDate'] as String),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String,
      id: json['id'] as int,
      inProduction: json['inProduction'] as bool,
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      lastAirDate: DateTime.parse(json['lastAirDate'] as String),
      lastEpisodeToAir: TEpisodeToAirModel.fromJson(
          json['lastEpisodeToAir'] as Map<String, dynamic>),
      name: json['name'] as String,
      nextEpisodeToAir: TEpisodeToAirModel.fromJson(
          json['nextEpisodeToAir'] as Map<String, dynamic>),
      networks: (json['networks'] as List<dynamic>)
          .map((e) => NetworkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfEpisodes: json['numberOfEpisodes'] as int,
      numberOfSeasons: json['numberOfSeasons'] as int,
      originCountry: (json['originCountry'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      originalLanguage: json['originalLanguage'] as String,
      originalName: json['originalName'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['posterPath'] as String,
      productionCompanies: (json['productionCompanies'] as List<dynamic>)
          .map((e) => NetworkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['productionCountries'] as List<dynamic>)
          .map(
              (e) => ProductionCountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      seasons: (json['seasons'] as List<dynamic>)
          .map((e) => SeasonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      spokenLanguages: (json['spokenLanguages'] as List<dynamic>)
          .map((e) => SpokenLanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      tagline: json['tagline'] as String,
      type: json['type'] as String,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: json['voteCount'] as int,
    );

Map<String, dynamic> _$SeriesOneApiRespModelToJson(
        SeriesOneApiRespModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'createdBy': instance.createdBy,
      'episodeRunTime': instance.episodeRunTime,
      'firstAirDate': instance.firstAirDate.toIso8601String(),
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'inProduction': instance.inProduction,
      'languages': instance.languages,
      'lastAirDate': instance.lastAirDate.toIso8601String(),
      'lastEpisodeToAir': instance.lastEpisodeToAir,
      'name': instance.name,
      'nextEpisodeToAir': instance.nextEpisodeToAir,
      'networks': instance.networks,
      'numberOfEpisodes': instance.numberOfEpisodes,
      'numberOfSeasons': instance.numberOfSeasons,
      'originCountry': instance.originCountry,
      'originalLanguage': instance.originalLanguage,
      'originalName': instance.originalName,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'productionCompanies': instance.productionCompanies,
      'productionCountries': instance.productionCountries,
      'seasons': instance.seasons,
      'spokenLanguages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'type': instance.type,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
