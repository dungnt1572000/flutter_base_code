import 'package:baseproject/data/domain/use_case/use_case.dart';
import 'package:baseproject/data/repositories/entities/direction_obj.dart';
import 'package:baseproject/data/repositories/user_map_repository.dart';
import 'package:baseproject/presentation/injection/injector.dart';

import 'get_walking_direction_object_use_case.dart';

class GetDrivingDirectionObjectUseCase
    implements FutureUseCase<DirectionObjectInput, DirectionObj> {
  @override
  Future<DirectionObj> run(DirectionObjectInput input) async {
    return await injector.get<UserMapRepository>().getDrivingDirection(
          input.direction,
          input.accessToken,
          input.annotations,
          input.geometries,
          input.overviews,
        );
  }
}