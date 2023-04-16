// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchObject _$$_SearchObjectFromJson(Map<String, dynamic> json) =>
    _$_SearchObject(
      type: json['type'] as String?,
      query:
          (json['query'] as List<dynamic>?)?.map((e) => e as String).toList(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => Features.fromJson(e as Map<String, dynamic>))
          .toList(),
      attribution: json['attribution'] as String?,
    );

Map<String, dynamic> _$$_SearchObjectToJson(_$_SearchObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      'query': instance.query,
      'features': instance.features,
      'attribution': instance.attribution,
    };

_$_Features _$$_FeaturesFromJson(Map<String, dynamic> json) => _$_Features(
      id: json['id'] as String?,
      type: json['type'] as String?,
      placeType: (json['place_type'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      relevance: json['relevance'] as int?,
      properties: json['properties'] == null
          ? null
          : Properties.fromJson(json['properties'] as Map<String, dynamic>),
      text: json['text'] as String?,
      placeName: json['place_name'] as String?,
      bbox: (json['bbox'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      center: (json['center'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      context: (json['context'] as List<dynamic>?)
          ?.map((e) => Context.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FeaturesToJson(_$_Features instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'place_type': instance.placeType,
      'relevance': instance.relevance,
      'properties': instance.properties,
      'text': instance.text,
      'place_name': instance.placeName,
      'bbox': instance.bbox,
      'center': instance.center,
      'geometry': instance.geometry,
      'context': instance.context,
    };

_$_Properties _$$_PropertiesFromJson(Map<String, dynamic> json) =>
    _$_Properties(
      shortCode: json['short_code'] as String?,
      wikidata: json['wikidata'] as String?,
      mapboxId: json['mapbox_id'] as String?,
      foursquare: json['foursquare'] as String?,
      landmark: json['landmark'] as bool?,
      address: json['address'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$_PropertiesToJson(_$_Properties instance) =>
    <String, dynamic>{
      'short_code': instance.shortCode,
      'wikidata': instance.wikidata,
      'mapbox_id': instance.mapboxId,
      'foursquare': instance.foursquare,
      'landmark': instance.landmark,
      'address': instance.address,
      'category': instance.category,
    };

_$_Geometry _$$_GeometryFromJson(Map<String, dynamic> json) => _$_Geometry(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$_GeometryToJson(_$_Geometry instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

_$_Context _$$_ContextFromJson(Map<String, dynamic> json) => _$_Context(
      id: json['id'] as String?,
      shortCode: json['short_code'] as String?,
      wikidata: json['wikidata'] as String?,
      mapboxId: json['mapbox_id'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$_ContextToJson(_$_Context instance) =>
    <String, dynamic>{
      'id': instance.id,
      'short_code': instance.shortCode,
      'wikidata': instance.wikidata,
      'mapbox_id': instance.mapboxId,
      'text': instance.text,
    };
