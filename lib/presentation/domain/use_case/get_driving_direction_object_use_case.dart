import 'package:baseproject/data/repositories/entities/direction_object.dart';
import 'package:baseproject/data/repositories/user_map_repository.dart';
import 'package:baseproject/presentation/domain/use_case/get_walking_direction_object_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';

class GetDrivingDirectionObjectUseCase
    implements FutureUseCase<DirectionObjectInput, DirectionObject> {
  @override
  Future<DirectionObject> run(DirectionObjectInput input) async {
    return await injector.get<UserMapRepository>().getDrivingDirection(
          input.direction,
          input.accessToken,
          input.annotations,
          input.geometries,
          input.overviews,
        );
  }
}
