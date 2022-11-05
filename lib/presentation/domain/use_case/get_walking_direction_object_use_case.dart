import 'package:baseproject/data/repositories/entities/direction_object.dart';
import 'package:baseproject/data/repositories/user_map_repository.dart';
import 'package:baseproject/presentation/domain/use_case/use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';

class GetWalkingDirectionObjectUseCase
    implements FutureUseCase<DirectionObjectInput, DirectionObject> {
  @override
  Future<DirectionObject> run(DirectionObjectInput input) async {
    return await injector.get<UserMapRepository>().getWalkingDirection(
        input.direction,
        input.accessToken,
        input.annotations,
        input.geometries,
        input.overviews);
  }
}

class DirectionObjectInput {
  final String direction;
  final String accessToken;
  final String annotations;
  final String geometries;
  final String overviews;

  DirectionObjectInput(this.direction, this.accessToken, this.annotations,
      this.geometries, this.overviews);
}
