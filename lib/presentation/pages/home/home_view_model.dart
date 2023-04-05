import 'package:baseproject/presentation/domain/use_case/get_question_category_use_case.dart';
import 'package:baseproject/presentation/pages/home/home_state.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(this.getQuestionCategoryUseCase) : super(HomeState());

  GetQuestionCategoryUseCase getQuestionCategoryUseCase;

  Future init() async {
    await getCategory();
  }

  Future<void> getCategory() async {
    state = state.copyWith(status: LoadingStatus.inProgress);
    try {
      final result = await getQuestionCategoryUseCase.run();
      state = state.copyWith(
        status: LoadingStatus.success,
        categoryList: result.categories ?? [],
      );
    } catch (err) {
      state = state.copyWith(
        status: LoadingStatus.error,
        errorMessage: 'No category found',
      );
    }
  }
}
