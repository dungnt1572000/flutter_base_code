import 'package:baseproject/data/repositories/user_map_repository.dart';
import 'package:baseproject/presentation/domain/use_case/use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';

import '../../../data/repositories/entities/direction_obj.dart';

class GetWalkingDirectionObjectUseCase
    implements FutureUseCase<DirectionObjectInput, DirectionObj> {
  @override
  Future<DirectionObj> run(DirectionObjectInput input) async {
    return await injector.get<UserMapRepository>().getWalkingDirection(
          input.direction,
          input.accessToken,
          input.annotations,
          input.geometries,
          input.overviews,
        );
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
