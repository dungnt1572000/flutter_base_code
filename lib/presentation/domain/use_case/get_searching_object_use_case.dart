import 'package:baseproject/data/repositories/entities/searching_object.dart';
import 'package:baseproject/data/repositories/user_map_repository.dart';
import 'package:baseproject/presentation/domain/use_case/use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';

class GetSearchingObjectUseCase
    implements FutureUseCase<SeachingObjectInput, SearchingObject> {
  @override
  Future<SearchingObject> run(SeachingObjectInput input) async {
    return await injector
        .get<UserMapRepository>()
        .getSearchingObject(input.places, input.accessToken);
  }
}

class SeachingObjectInput {
  final String accessToken;
  final String places;

  SeachingObjectInput(this.accessToken, this.places);
}
