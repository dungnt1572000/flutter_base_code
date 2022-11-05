import 'package:baseproject/data/repositories/entities/direction_object.dart';
import 'package:baseproject/data/repositories/entities/searching_object.dart';
import 'package:baseproject/data/services/network_service/api_client.dart';

class UserMapRepository {
  final ApiClient _apiClient;

  UserMapRepository(this._apiClient);

  Future<SearchingObject> getSearchingObject(String place, String accessToken) {
    return _apiClient.fetchToGetSearchingObject(place, accessToken);
  }

  Future<DirectionObject> getWalkingDirection(
      String direction,
      String accessToken,
      String annotations,
      String geometries,
      String overviews) {
    return _apiClient.getDirectionWalking(
        direction, accessToken, annotations, geometries, overviews);
  }

  Future<DirectionObject> getDrivingDirection(
      String direction,
      String accessToken,
      String annotations,
      String geometries,
      String overviews) {
    return _apiClient.getDirectionDriving(
        direction, accessToken, annotations, geometries, overviews);
  }
}
