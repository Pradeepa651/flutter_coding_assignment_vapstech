import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RectangleImage extends StatelessWidget {
  final String? src;
  const RectangleImage({Key? key, this.src}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.h,
        width: 100.w,
        padding: const EdgeInsets.symmetric(vertical: 2.5).r,
        decoration: ShapeDecoration(
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: src != null
            ? AspectRatio(
                aspectRatio: 1 / 2,
                child: Image.network(
                  src!,
                ),
              )
            : const SizedBox());
  }
}
