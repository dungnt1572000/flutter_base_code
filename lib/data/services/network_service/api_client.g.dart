// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.mapbox.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DirectionObject> getDirectionDriving(
      direction, accessToken, annotations, geometries, overviews) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'access_token': accessToken,
      r'annotations': annotations,
      r'geometries': geometries,
      r'overview': overviews
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DirectionObject>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, 'directions/v5/mapbox/driving/${direction}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DirectionObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DirectionObject> getDirectionWalking(
      direction, accessToken, annotations, geometries, overviews) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'access_token': accessToken,
      r'annotations': annotations,
      r'geometries': geometries,
      r'overview': overviews
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DirectionObject>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'walking/${direction}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DirectionObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SearchingObject> fetchToGetSearchingObject(place, accesstoken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'access_token': accesstoken};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SearchingObject>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, 'geocoding/v5/mapbox.places/${place}.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SearchingObject.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
