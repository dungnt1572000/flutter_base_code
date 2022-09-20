import 'package:baseproject/presentation/resources/app_images.dart';
import 'package:flutter/material.dart';

class NotFound404ErrorView extends StatelessWidget {
  const NotFound404ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _build404Image(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _build404Image() {
    return Image.asset(AppImages.notFound);
  }
  Widget _buildContent(){
    return const Text('Error 404');
  }
}
