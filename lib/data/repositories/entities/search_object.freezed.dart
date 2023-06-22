// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchObject _$SearchObjectFromJson(Map<String, dynamic> json) {
  return _SearchObject.fromJson(json);
}

/// @nodoc
mixin _$SearchObject {
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'query')
  List<String>? get query => throw _privateConstructorUsedError;
  @JsonKey(name: 'features')
  List<Features>? get features => throw _privateConstructorUsedError;
  @JsonKey(name: 'attribution')
  String? get attribution => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchObjectCopyWith<SearchObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchObjectCopyWith<$Res> {
  factory $SearchObjectCopyWith(
          SearchObject value, $Res Function(SearchObject) then) =
      _$SearchObjectCopyWithImpl<$Res, SearchObject>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String? type,
      @JsonKey(name: 'query') List<String>? query,
      @JsonKey(name: 'features') List<Features>? features,
      @JsonKey(name: 'attribution') String? attribution});
}

/// @nodoc
class _$SearchObjectCopyWithImpl<$Res, $Val extends SearchObject>
    implements $SearchObjectCopyWith<$Res> {
  _$SearchObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? query = freezed,
    Object? features = freezed,
    Object? attribution = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Features>?,
      attribution: freezed == attribution
          ? _value.attribution
          : attribution // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchObjectCopyWith<$Res>
    implements $SearchObjectCopyWith<$Res> {
  factory _$$_SearchObjectCopyWith(
          _$_SearchObject value, $Res Function(_$_SearchObject) then) =
      __$$_SearchObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String? type,
      @JsonKey(name: 'query') List<String>? query,
      @JsonKey(name: 'features') List<Features>? features,
      @JsonKey(name: 'attribution') String? attribution});
}

/// @nodoc
class __$$_SearchObjectCopyWithImpl<$Res>
    extends _$SearchObjectCopyWithImpl<$Res, _$_SearchObject>
    implements _$$_SearchObjectCopyWith<$Res> {
  __$$_SearchObjectCopyWithImpl(
      _$_SearchObject _value, $Res Function(_$_SearchObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? query = freezed,
    Object? features = freezed,
    Object? attribution = freezed,
  }) {
    return _then(_$_SearchObject(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      query: freezed == query
          ? _value._query
          : query // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      features: freezed == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Features>?,
      attribution: freezed == attribution
          ? _value.attribution
          : attribution // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchObject implements _SearchObject {
  _$_SearchObject(
      {@JsonKey(name: 'type') this.type,
      @JsonKey(name: 'query') final List<String>? query,
      @JsonKey(name: 'features') final List<Features>? features,
      @JsonKey(name: 'attribution') this.attribution})
      : _query = query,
        _features = features;

  factory _$_SearchObject.fromJson(Map<String, dynamic> json) =>
      _$$_SearchObjectFromJson(json);

  @override
  @JsonKey(name: 'type')
  final String? type;
  final List<String>? _query;
  @override
  @JsonKey(name: 'query')
  List<String>? get query {
    final value = _query;
    if (value == null) return null;
    if (_query is EqualUnmodifiableListView) return _query;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Features>? _features;
  @override
  @JsonKey(name: 'features')
  List<Features>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'attribution')
  final String? attribution;

  @override
  String toString() {
    return 'SearchObject(type: $type, query: $query, features: $features, attribution: $attribution)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchObject &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._query, _query) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.attribution, attribution) ||
                other.attribution == attribution));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_query),
      const DeepCollectionEquality().hash(_features),
      attribution);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchObjectCopyWith<_$_SearchObject> get copyWith =>
      __$$_SearchObjectCopyWithImpl<_$_SearchObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchObjectToJson(
      this,
    );
  }
}

abstract class _SearchObject implements SearchObject {
  factory _SearchObject(
          {@JsonKey(name: 'type') final String? type,
          @JsonKey(name: 'query') final List<String>? query,
          @JsonKey(name: 'features') final List<Features>? features,
          @JsonKey(name: 'attribution') final String? attribution}) =
      _$_SearchObject;

  factory _SearchObject.fromJson(Map<String, dynamic> json) =
      _$_SearchObject.fromJson;

  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'query')
  List<String>? get query;
  @override
  @JsonKey(name: 'features')
  List<Features>? get features;
  @override
  @JsonKey(name: 'attribution')
  String? get attribution;
  @override
  @JsonKey(ignore: true)
  _$$_SearchObjectCopyWith<_$_SearchObject> get copyWith =>
      throw _privateConstructorUsedError;
}

Features _$FeaturesFromJson(Map<String, dynamic> json) {
  return _Features.fromJson(json);
}

/// @nodoc
mixin _$Features {
  String? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_type')
  List<String>? get placeType => throw _privateConstructorUsedError;
  double? get relevance => throw _privateConstructorUsedError;
  Properties? get properties => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_name')
  String? get placeName => throw _privateConstructorUsedError;
  List<double>? get bbox => throw _privateConstructorUsedError;
  List<double>? get center => throw _privateConstructorUsedError;
  Geometry? get geometry => throw _privateConstructorUsedError;
  List<Context>? get context => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeaturesCopyWith<Features> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeaturesCopyWith<$Res> {
  factory $FeaturesCopyWith(Features value, $Res Function(Features) then) =
      _$FeaturesCopyWithImpl<$Res, Features>;
  @useResult
  $Res call(
      {String? id,
      String? type,
      @JsonKey(name: 'place_type') List<String>? placeType,
      double? relevance,
      Properties? properties,
      String? text,
      @JsonKey(name: 'place_name') String? placeName,
      List<double>? bbox,
      List<double>? center,
      Geometry? geometry,
      List<Context>? context});

  $PropertiesCopyWith<$Res>? get properties;
  $GeometryCopyWith<$Res>? get geometry;
}

/// @nodoc
class _$FeaturesCopyWithImpl<$Res, $Val extends Features>
    implements $FeaturesCopyWith<$Res> {
  _$FeaturesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? placeType = freezed,
    Object? relevance = freezed,
    Object? properties = freezed,
    Object? text = freezed,
    Object? placeName = freezed,
    Object? bbox = freezed,
    Object? center = freezed,
    Object? geometry = freezed,
    Object? context = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      placeType: freezed == placeType
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      relevance: freezed == relevance
          ? _value.relevance
          : relevance // ignore: cast_nullable_to_non_nullable
              as double?,
      properties: freezed == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Properties?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      placeName: freezed == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String?,
      bbox: freezed == bbox
          ? _value.bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      center: freezed == center
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as List<Context>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PropertiesCopyWith<$Res>? get properties {
    if (_value.properties == null) {
      return null;
    }

    return $PropertiesCopyWith<$Res>(_value.properties!, (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GeometryCopyWith<$Res>? get geometry {
    if (_value.geometry == null) {
      return null;
    }

    return $GeometryCopyWith<$Res>(_value.geometry!, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FeaturesCopyWith<$Res> implements $FeaturesCopyWith<$Res> {
  factory _$$_FeaturesCopyWith(
          _$_Features value, $Res Function(_$_Features) then) =
      __$$_FeaturesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? type,
      @JsonKey(name: 'place_type') List<String>? placeType,
      double? relevance,
      Properties? properties,
      String? text,
      @JsonKey(name: 'place_name') String? placeName,
      List<double>? bbox,
      List<double>? center,
      Geometry? geometry,
      List<Context>? context});

  @override
  $PropertiesCopyWith<$Res>? get properties;
  @override
  $GeometryCopyWith<$Res>? get geometry;
}

/// @nodoc
class __$$_FeaturesCopyWithImpl<$Res>
    extends _$FeaturesCopyWithImpl<$Res, _$_Features>
    implements _$$_FeaturesCopyWith<$Res> {
  __$$_FeaturesCopyWithImpl(
      _$_Features _value, $Res Function(_$_Features) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? placeType = freezed,
    Object? relevance = freezed,
    Object? properties = freezed,
    Object? text = freezed,
    Object? placeName = freezed,
    Object? bbox = freezed,
    Object? center = freezed,
    Object? geometry = freezed,
    Object? context = freezed,
  }) {
    return _then(_$_Features(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      placeType: freezed == placeType
          ? _value._placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      relevance: freezed == relevance
          ? _value.relevance
          : relevance // ignore: cast_nullable_to_non_nullable
              as double?,
      properties: freezed == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Properties?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      placeName: freezed == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String?,
      bbox: freezed == bbox
          ? _value._bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      center: freezed == center
          ? _value._center
          : center // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      context: freezed == context
          ? _value._context
          : context // ignore: cast_nullable_to_non_nullable
              as List<Context>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Features implements _Features {
  _$_Features(
      {this.id,
      this.type,
      @JsonKey(name: 'place_type') final List<String>? placeType,
      this.relevance,
      this.properties,
      this.text,
      @JsonKey(name: 'place_name') this.placeName,
      final List<double>? bbox,
      final List<double>? center,
      this.geometry,
      final List<Context>? context})
      : _placeType = placeType,
        _bbox = bbox,
        _center = center,
        _context = context;

  factory _$_Features.fromJson(Map<String, dynamic> json) =>
      _$$_FeaturesFromJson(json);

  @override
  final String? id;
  @override
  final String? type;
  final List<String>? _placeType;
  @override
  @JsonKey(name: 'place_type')
  List<String>? get placeType {
    final value = _placeType;
    if (value == null) return null;
    if (_placeType is EqualUnmodifiableListView) return _placeType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? relevance;
  @override
  final Properties? properties;
  @override
  final String? text;
  @override
  @JsonKey(name: 'place_name')
  final String? placeName;
  final List<double>? _bbox;
  @override
  List<double>? get bbox {
    final value = _bbox;
    if (value == null) return null;
    if (_bbox is EqualUnmodifiableListView) return _bbox;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double>? _center;
  @override
  List<double>? get center {
    final value = _center;
    if (value == null) return null;
    if (_center is EqualUnmodifiableListView) return _center;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Geometry? geometry;
  final List<Context>? _context;
  @override
  List<Context>? get context {
    final value = _context;
    if (value == null) return null;
    if (_context is EqualUnmodifiableListView) return _context;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Features(id: $id, type: $type, placeType: $placeType, relevance: $relevance, properties: $properties, text: $text, placeName: $placeName, bbox: $bbox, center: $center, geometry: $geometry, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Features &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._placeType, _placeType) &&
            (identical(other.relevance, relevance) ||
                other.relevance == relevance) &&
            (identical(other.properties, properties) ||
                other.properties == properties) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            const DeepCollectionEquality().equals(other._bbox, _bbox) &&
            const DeepCollectionEquality().equals(other._center, _center) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            const DeepCollectionEquality().equals(other._context, _context));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      const DeepCollectionEquality().hash(_placeType),
      relevance,
      properties,
      text,
      placeName,
      const DeepCollectionEquality().hash(_bbox),
      const DeepCollectionEquality().hash(_center),
      geometry,
      const DeepCollectionEquality().hash(_context));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeaturesCopyWith<_$_Features> get copyWith =>
      __$$_FeaturesCopyWithImpl<_$_Features>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeaturesToJson(
      this,
    );
  }
}

abstract class _Features implements Features {
  factory _Features(
      {final String? id,
      final String? type,
      @JsonKey(name: 'place_type') final List<String>? placeType,
      final double? relevance,
      final Properties? properties,
      final String? text,
      @JsonKey(name: 'place_name') final String? placeName,
      final List<double>? bbox,
      final List<double>? center,
      final Geometry? geometry,
      final List<Context>? context}) = _$_Features;

  factory _Features.fromJson(Map<String, dynamic> json) = _$_Features.fromJson;

  @override
  String? get id;
  @override
  String? get type;
  @override
  @JsonKey(name: 'place_type')
  List<String>? get placeType;
  @override
  double? get relevance;
  @override
  Properties? get properties;
  @override
  String? get text;
  @override
  @JsonKey(name: 'place_name')
  String? get placeName;
  @override
  List<double>? get bbox;
  @override
  List<double>? get center;
  @override
  Geometry? get geometry;
  @override
  List<Context>? get context;
  @override
  @JsonKey(ignore: true)
  _$$_FeaturesCopyWith<_$_Features> get copyWith =>
      throw _privateConstructorUsedError;
}

Properties _$PropertiesFromJson(Map<String, dynamic> json) {
  return _Properties.fromJson(json);
}

/// @nodoc
mixin _$Properties {
  @JsonKey(name: 'short_code')
  String? get shortCode => throw _privateConstructorUsedError;
  String? get wikidata => throw _privateConstructorUsedError;
  @JsonKey(name: 'mapbox_id')
  String? get mapboxId => throw _privateConstructorUsedError;
  String? get foursquare => throw _privateConstructorUsedError;
  bool? get landmark => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PropertiesCopyWith<Properties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertiesCopyWith<$Res> {
  factory $PropertiesCopyWith(
          Properties value, $Res Function(Properties) then) =
      _$PropertiesCopyWithImpl<$Res, Properties>;
  @useResult
  $Res call(
      {@JsonKey(name: 'short_code') String? shortCode,
      String? wikidata,
      @JsonKey(name: 'mapbox_id') String? mapboxId,
      String? foursquare,
      bool? landmark,
      String? address,
      String? category});
}

/// @nodoc
class _$PropertiesCopyWithImpl<$Res, $Val extends Properties>
    implements $PropertiesCopyWith<$Res> {
  _$PropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortCode = freezed,
    Object? wikidata = freezed,
    Object? mapboxId = freezed,
    Object? foursquare = freezed,
    Object? landmark = freezed,
    Object? address = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      shortCode: freezed == shortCode
          ? _value.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String?,
      wikidata: freezed == wikidata
          ? _value.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
      mapboxId: freezed == mapboxId
          ? _value.mapboxId
          : mapboxId // ignore: cast_nullable_to_non_nullable
              as String?,
      foursquare: freezed == foursquare
          ? _value.foursquare
          : foursquare // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as bool?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PropertiesCopyWith<$Res>
    implements $PropertiesCopyWith<$Res> {
  factory _$$_PropertiesCopyWith(
          _$_Properties value, $Res Function(_$_Properties) then) =
      __$$_PropertiesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'short_code') String? shortCode,
      String? wikidata,
      @JsonKey(name: 'mapbox_id') String? mapboxId,
      String? foursquare,
      bool? landmark,
      String? address,
      String? category});
}

/// @nodoc
class __$$_PropertiesCopyWithImpl<$Res>
    extends _$PropertiesCopyWithImpl<$Res, _$_Properties>
    implements _$$_PropertiesCopyWith<$Res> {
  __$$_PropertiesCopyWithImpl(
      _$_Properties _value, $Res Function(_$_Properties) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortCode = freezed,
    Object? wikidata = freezed,
    Object? mapboxId = freezed,
    Object? foursquare = freezed,
    Object? landmark = freezed,
    Object? address = freezed,
    Object? category = freezed,
  }) {
    return _then(_$_Properties(
      shortCode: freezed == shortCode
          ? _value.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String?,
      wikidata: freezed == wikidata
          ? _value.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
      mapboxId: freezed == mapboxId
          ? _value.mapboxId
          : mapboxId // ignore: cast_nullable_to_non_nullable
              as String?,
      foursquare: freezed == foursquare
          ? _value.foursquare
          : foursquare // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as bool?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Properties implements _Properties {
  _$_Properties(
      {@JsonKey(name: 'short_code') this.shortCode,
      this.wikidata,
      @JsonKey(name: 'mapbox_id') this.mapboxId,
      this.foursquare,
      this.landmark,
      this.address,
      this.category});

  factory _$_Properties.fromJson(Map<String, dynamic> json) =>
      _$$_PropertiesFromJson(json);

  @override
  @JsonKey(name: 'short_code')
  final String? shortCode;
  @override
  final String? wikidata;
  @override
  @JsonKey(name: 'mapbox_id')
  final String? mapboxId;
  @override
  final String? foursquare;
  @override
  final bool? landmark;
  @override
  final String? address;
  @override
  final String? category;

  @override
  String toString() {
    return 'Properties(shortCode: $shortCode, wikidata: $wikidata, mapboxId: $mapboxId, foursquare: $foursquare, landmark: $landmark, address: $address, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Properties &&
            (identical(other.shortCode, shortCode) ||
                other.shortCode == shortCode) &&
            (identical(other.wikidata, wikidata) ||
                other.wikidata == wikidata) &&
            (identical(other.mapboxId, mapboxId) ||
                other.mapboxId == mapboxId) &&
            (identical(other.foursquare, foursquare) ||
                other.foursquare == foursquare) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shortCode, wikidata, mapboxId,
      foursquare, landmark, address, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PropertiesCopyWith<_$_Properties> get copyWith =>
      __$$_PropertiesCopyWithImpl<_$_Properties>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PropertiesToJson(
      this,
    );
  }
}

abstract class _Properties implements Properties {
  factory _Properties(
      {@JsonKey(name: 'short_code') final String? shortCode,
      final String? wikidata,
      @JsonKey(name: 'mapbox_id') final String? mapboxId,
      final String? foursquare,
      final bool? landmark,
      final String? address,
      final String? category}) = _$_Properties;

  factory _Properties.fromJson(Map<String, dynamic> json) =
      _$_Properties.fromJson;

  @override
  @JsonKey(name: 'short_code')
  String? get shortCode;
  @override
  String? get wikidata;
  @override
  @JsonKey(name: 'mapbox_id')
  String? get mapboxId;
  @override
  String? get foursquare;
  @override
  bool? get landmark;
  @override
  String? get address;
  @override
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$$_PropertiesCopyWith<_$_Properties> get copyWith =>
      throw _privateConstructorUsedError;
}

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return _Geometry.fromJson(json);
}

/// @nodoc
mixin _$Geometry {
  String? get type => throw _privateConstructorUsedError;
  List<double>? get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeometryCopyWith<Geometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeometryCopyWith<$Res> {
  factory $GeometryCopyWith(Geometry value, $Res Function(Geometry) then) =
      _$GeometryCopyWithImpl<$Res, Geometry>;
  @useResult
  $Res call({String? type, List<double>? coordinates});
}

/// @nodoc
class _$GeometryCopyWithImpl<$Res, $Val extends Geometry>
    implements $GeometryCopyWith<$Res> {
  _$GeometryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeometryCopyWith<$Res> implements $GeometryCopyWith<$Res> {
  factory _$$_GeometryCopyWith(
          _$_Geometry value, $Res Function(_$_Geometry) then) =
      __$$_GeometryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type, List<double>? coordinates});
}

/// @nodoc
class __$$_GeometryCopyWithImpl<$Res>
    extends _$GeometryCopyWithImpl<$Res, _$_Geometry>
    implements _$$_GeometryCopyWith<$Res> {
  __$$_GeometryCopyWithImpl(
      _$_Geometry _value, $Res Function(_$_Geometry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_$_Geometry(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Geometry implements _Geometry {
  _$_Geometry({this.type, final List<double>? coordinates})
      : _coordinates = coordinates;

  factory _$_Geometry.fromJson(Map<String, dynamic> json) =>
      _$$_GeometryFromJson(json);

  @override
  final String? type;
  final List<double>? _coordinates;
  @override
  List<double>? get coordinates {
    final value = _coordinates;
    if (value == null) return null;
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Geometry(type: $type, coordinates: $coordinates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Geometry &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_coordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeometryCopyWith<_$_Geometry> get copyWith =>
      __$$_GeometryCopyWithImpl<_$_Geometry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeometryToJson(
      this,
    );
  }
}

abstract class _Geometry implements Geometry {
  factory _Geometry({final String? type, final List<double>? coordinates}) =
      _$_Geometry;

  factory _Geometry.fromJson(Map<String, dynamic> json) = _$_Geometry.fromJson;

  @override
  String? get type;
  @override
  List<double>? get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$_GeometryCopyWith<_$_Geometry> get copyWith =>
      throw _privateConstructorUsedError;
}

Context _$ContextFromJson(Map<String, dynamic> json) {
  return _Context.fromJson(json);
}

/// @nodoc
mixin _$Context {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_code')
  String? get shortCode => throw _privateConstructorUsedError;
  String? get wikidata => throw _privateConstructorUsedError;
  @JsonKey(name: 'mapbox_id')
  String? get mapboxId => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContextCopyWith<Context> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextCopyWith<$Res> {
  factory $ContextCopyWith(Context value, $Res Function(Context) then) =
      _$ContextCopyWithImpl<$Res, Context>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'short_code') String? shortCode,
      String? wikidata,
      @JsonKey(name: 'mapbox_id') String? mapboxId,
      String? text});
}

/// @nodoc
class _$ContextCopyWithImpl<$Res, $Val extends Context>
    implements $ContextCopyWith<$Res> {
  _$ContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? shortCode = freezed,
    Object? wikidata = freezed,
    Object? mapboxId = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      shortCode: freezed == shortCode
          ? _value.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String?,
      wikidata: freezed == wikidata
          ? _value.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
      mapboxId: freezed == mapboxId
          ? _value.mapboxId
          : mapboxId // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContextCopyWith<$Res> implements $ContextCopyWith<$Res> {
  factory _$$_ContextCopyWith(
          _$_Context value, $Res Function(_$_Context) then) =
      __$$_ContextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'short_code') String? shortCode,
      String? wikidata,
      @JsonKey(name: 'mapbox_id') String? mapboxId,
      String? text});
}

/// @nodoc
class __$$_ContextCopyWithImpl<$Res>
    extends _$ContextCopyWithImpl<$Res, _$_Context>
    implements _$$_ContextCopyWith<$Res> {
  __$$_ContextCopyWithImpl(_$_Context _value, $Res Function(_$_Context) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? shortCode = freezed,
    Object? wikidata = freezed,
    Object? mapboxId = freezed,
    Object? text = freezed,
  }) {
    return _then(_$_Context(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      shortCode: freezed == shortCode
          ? _value.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String?,
      wikidata: freezed == wikidata
          ? _value.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
      mapboxId: freezed == mapboxId
          ? _value.mapboxId
          : mapboxId // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Context implements _Context {
  _$_Context(
      {this.id,
      @JsonKey(name: 'short_code') this.shortCode,
      this.wikidata,
      @JsonKey(name: 'mapbox_id') this.mapboxId,
      this.text});

  factory _$_Context.fromJson(Map<String, dynamic> json) =>
      _$$_ContextFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'short_code')
  final String? shortCode;
  @override
  final String? wikidata;
  @override
  @JsonKey(name: 'mapbox_id')
  final String? mapboxId;
  @override
  final String? text;

  @override
  String toString() {
    return 'Context(id: $id, shortCode: $shortCode, wikidata: $wikidata, mapboxId: $mapboxId, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Context &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shortCode, shortCode) ||
                other.shortCode == shortCode) &&
            (identical(other.wikidata, wikidata) ||
                other.wikidata == wikidata) &&
            (identical(other.mapboxId, mapboxId) ||
                other.mapboxId == mapboxId) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, shortCode, wikidata, mapboxId, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContextCopyWith<_$_Context> get copyWith =>
      __$$_ContextCopyWithImpl<_$_Context>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContextToJson(
      this,
    );
  }
}

abstract class _Context implements Context {
  factory _Context(
      {final String? id,
      @JsonKey(name: 'short_code') final String? shortCode,
      final String? wikidata,
      @JsonKey(name: 'mapbox_id') final String? mapboxId,
      final String? text}) = _$_Context;

  factory _Context.fromJson(Map<String, dynamic> json) = _$_Context.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'short_code')
  String? get shortCode;
  @override
  String? get wikidata;
  @override
  @JsonKey(name: 'mapbox_id')
  String? get mapboxId;
  @override
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$_ContextCopyWith<_$_Context> get copyWith =>
      throw _privateConstructorUsedError;
}
