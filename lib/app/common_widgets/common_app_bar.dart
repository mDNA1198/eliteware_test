import 'package:eliteware_test/app/app_extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String appBarTitle;

  const CommonAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Hero(tag: 'AppBarLogo', child: Image.asset(context.images.appLogo)),
      backgroundColor: context.colors.appWhiteColor,
      elevation: 0,
      title: Hero(tag: 'AppBarTitle', child: Text(appBarTitle)),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        color: context.colors.mediumGray,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
