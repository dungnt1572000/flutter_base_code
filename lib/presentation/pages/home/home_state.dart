 import 'package:baseproject/data/model/get_questions_category_response.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/questions_categories.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState{
  factory HomeState({
    @Default('') String errorMessage,
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default([]) List<QuestionsCategories> categoryList,
 }) = _HomeState;
 }