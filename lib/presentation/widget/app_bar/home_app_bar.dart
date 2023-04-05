import 'package:baseproject/presentation/resources/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({Key? key, this.userAvatar}) : super(key: key);

  final String? userAvatar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leadingWidth: 60,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: Image.asset(AppImages.defaultUser,fit: BoxFit.cover,),
        ),
      ),
      title: SvgPicture.asset(AppImages.appbarIcon,fit: BoxFit.fill,),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight+5);
}
