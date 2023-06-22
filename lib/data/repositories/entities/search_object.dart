import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_object.freezed.dart';
part 'search_object.g.dart';
@freezed
class SearchObject with _$SearchObject {
  factory SearchObject({
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'query') List<String>? query,
    @JsonKey(name: 'features') List<Features>? features,
    @JsonKey(name: 'attribution') String? attribution,
  }) = _SearchObject;

  factory SearchObject.fromJson(Map<String, dynamic> json) =>
      _$SearchObjectFromJson(json);
}

@freezed
class Features with _$Features {
  factory Features({
    String? id,
    String? type,
    @JsonKey(name: 'place_type') List<String>? placeType,
    double? relevance,
    Properties? properties,
    String? text,
    @JsonKey(name: 'place_name') String? placeName,
    List<double>? bbox,
    List<double>? center,
    Geometry? geometry,
    List<Context>? context,
  }) = _Features;

  factory Features.fromJson(Map<String, dynamic> json) =>
      _$FeaturesFromJson(json);
}
@freezed
class Properties with _$Properties {
  factory Properties({
    @JsonKey(name: 'short_code') String? shortCode,
    String? wikidata,
    @JsonKey(name: 'mapbox_id') String? mapboxId,
    String? foursquare,
    bool? landmark,
    String? address,
    String? category,
  }) = _Properties;

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);
}
@freezed
class Geometry with _$Geometry {
  factory Geometry({
    String? type,
    List<double>? coordinates,
  }) = _Geometry;

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
}
@freezed
class Context with _$Context {
  factory Context({
    String? id,
    @JsonKey(name: 'short_code') String? shortCode,
    String? wikidata,
    @JsonKey(name: 'mapbox_id') String? mapboxId,
    String? text,
  }) = _Context;

  factory Context.fromJson(Map<String, dynamic> json) =>
      _$ContextFromJson(json);
}
