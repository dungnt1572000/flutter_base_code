import 'dart:math';

import 'package:baseproject/presentation/domain/use_case/get_question_category_use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';
import 'package:baseproject/presentation/pages/home/home_state.dart';
import 'package:baseproject/presentation/pages/home/home_view_model.dart';
import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:baseproject/presentation/widget/app_bar/home_app_bar.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/questions_categories.dart';

final _provider = StateNotifierProvider<HomeViewModel, HomeState>(
    (ref) => HomeViewModel(injector.get<GetQuestionCategoryUseCase>()));

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  HomeViewModel get viewModel => ref.read(_provider.notifier);

  HomeState get state => ref.watch(_provider);
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
     print('Wao day la link: ${dynamicLinkData.link.path}');
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,()async {
      await initDynamicLinks();
      await viewModel.init();});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: context.colors.backGroundColor),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                height: 138,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                decoration: BoxDecoration(
                  color: context.colors.backGroundItemColor,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      _buildCategoryItem(state.categoryList[index]),
                  itemCount: state.categoryList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(QuestionsCategories item) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 101,
        width: 165,
        decoration: BoxDecoration(
          color: getRandomColor(),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: Center(
          child: Text(
            item.categoryName ?? 'Unknown',
            style: AppTextStyles.labelMedium.copyWith(
              color: getInvertedColor(
                getRandomColor(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getRandomColor() {
    final Random random = Random();
    final int r = random.nextInt(256);
    final int g = random.nextInt(256);
    final int b = random.nextInt(256);
    return Color.fromRGBO(r, g, b, 1.0);
  }

  Color getInvertedColor(Color color) {
    final double luminance = color.computeLuminance();
    return luminance > 0.6 ? Colors.black : Colors.white;
  }
}
