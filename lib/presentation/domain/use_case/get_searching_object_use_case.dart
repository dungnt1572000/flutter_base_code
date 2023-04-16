import 'package:baseproject/data/repositories/entities/search_object.dart';
import 'package:baseproject/data/repositories/user_map_repository.dart';
import 'package:baseproject/presentation/domain/use_case/use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';

class GetSearchingObjectUseCase
    implements FutureUseCase<SearchingObjectInput, SearchObject> {
  @override
  Future<SearchObject> run(SearchingObjectInput input) async {
    return await injector
        .get<UserMapRepository>()
        .getSearchingObject(input.places, input.accessToken);
  }
}

class SearchingObjectInput {
  final String accessToken;
  final String places;

  SearchingObjectInput(this.accessToken, this.places);
}
