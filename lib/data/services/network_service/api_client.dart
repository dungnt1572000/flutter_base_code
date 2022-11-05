import 'package:baseproject/data/repositories/entities/direction_object.dart';
import 'package:baseproject/data/repositories/entities/searching_object.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://api.mapbox.com/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('directions/v5/mapbox/driving/{direction}')
  Future<DirectionObject> getDirectionDriving(
      @Path('direction') String direction,
      @Query('access_token') String accessToken,
      @Query('annotations') String annotations,
      @Query('geometries') String geometries,
      @Query('overview') String overviews);

  @GET('directions/v5/mapbox/walking/{direction}')
  Future<DirectionObject> getDirectionWalking(
      @Path('direction') String direction,
      @Query('access_token') String accessToken,
      @Query('annotations') String annotations,
      @Query('geometries') String geometries,
      @Query('overview') String overviews);

  @GET('geocoding/v5/mapbox.places/{place}.json')
  Future<SearchingObject> fetchToGetSearchingObject(
      @Path('place') String place, @Query('access_token') String accesstoken);
}
