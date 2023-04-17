import 'package:baseproject/data/repositories/entities/search_object.dart';
import 'package:baseproject/data/services/network_service/api_client.dart';

import 'entities/direction_obj.dart';

class UserMapRepository {
  final ApiClient _apiClient;

  UserMapRepository(this._apiClient);

  Future<SearchObject> getSearchingObject(String place, String accessToken) async{
    return await _apiClient.fetchToGetSearchingObject(place, accessToken);
  }

  Future<DirectionObj> getWalkingDirection(
      String direction,
      String accessToken,
      String annotations,
      String geometries,
      String overviews) async{
    return await _apiClient.getDirectionWalking(
        direction, accessToken, annotations, geometries, overviews);
  }

  Future<DirectionObj> getDrivingDirection(
      String direction,
      String accessToken,
      String annotations,
      String geometries,
      String overviews) async{
    return await _apiClient.getDirectionDriving(
        direction, accessToken, annotations, geometries, overviews);
  }
}