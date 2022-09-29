import 'package:json_annotation/json_annotation.dart';

import '../series/series_result_api_resp.dart';
import 'created_by.dart';
import 'genre.dart';
import 'network.dart';
import 'production_country.dart';
import 'season.dart';
import 'spoken_language.dart';
import 't_episode_to_air.dart';

part 'series_one_api_resp.g.dart';

@JsonSerializable()
class SeriesOneApiRespModel {
  final bool adult;
  final String backdropPath;
  final List<CreatedByModel> createdBy;
  final List<dynamic> episodeRunTime;
  final DateTime firstAirDate;
  final List<GenreModel> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final DateTime lastAirDate;
  final TEpisodeToAirModel lastEpisodeToAir;
  final String name;
  final TEpisodeToAirModel nextEpisodeToAir;
  final List<NetworkModel> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<NetworkModel> productionCompanies;
  final List<ProductionCountryModel> productionCountries;
  final List<SeasonModel> seasons;
  final List<SpokenLanguageModel> spokenLanguages;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;

  SeriesOneApiRespModel({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  factory SeriesOneApiRespModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesOneApiRespModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesOneApiRespModelToJson(this);
}