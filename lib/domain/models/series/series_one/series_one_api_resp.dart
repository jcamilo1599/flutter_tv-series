import 'package:json_annotation/json_annotation.dart';

import '../series/serie.dart';
import 'created_by.dart';
import 'genre.dart';
import 'network.dart';
import 'production_country.dart';
import 'season.dart';
import 'spoken_language.dart';
import 't_episode_to_air.dart';

part 'series_one_api_resp.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SeriesOneApiRespModel {
  final bool? adult;
  final String? backdropPath;
  final List<CreatedByModel>? createdBy;
  final List<dynamic>? episodeRunTime;
  final DateTime? firstAirDate;
  final List<GenreModel>? genres;
  final String? homepage;
  final int? id;
  final bool? inProduction;
  final List<String>? languages;
  final DateTime? lastAirDate;
  final TEpisodeToAirModel? lastEpisodeToAir;
  final String? name;
  final TEpisodeToAirModel? nextEpisodeToAir;
  final List<NetworkModel>? networks;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<NetworkModel>? productionCompanies;
  final List<ProductionCountryModel>? productionCountries;
  final List<SeasonModel>? seasons;
  final List<SpokenLanguageModel>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? type;
  final double? voteAverage;
  final int? voteCount;
  final String? message;

  SeriesOneApiRespModel({
    this.adult,
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
    this.message,
  });

  factory SeriesOneApiRespModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesOneApiRespModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesOneApiRespModelToJson(this);
}