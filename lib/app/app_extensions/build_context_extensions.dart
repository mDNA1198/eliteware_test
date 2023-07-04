import 'package:eliteware_test/app/app_colors/app_colors_impl.dart';
import 'package:flutter/widgets.dart';

import '../app_colors/app_colors.dart';
import '../app_images/app_images.dart';
import '../app_images/app_images_impl.dart';

extension BuildContextExt on BuildContext{
  Size get iPhone14 => const Size(390, 844);

  AppColors get colors => AppColorsImpl();
  AppImages get images => AppImagesImpl();
}