import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  final Color color;
  const CustomImage({super.key, required this.imagePath, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 21.sp,
        width: 21.sp,
        decoration: BoxDecoration(
            image: DecorationImage(image: Svg(imagePath, color: color))));
  }
}
