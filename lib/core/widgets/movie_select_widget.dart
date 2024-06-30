
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/utils/app_images.dart';

class MovieSelectItemWidget extends StatelessWidget {
  String movieImage;
  final bool isSelected;
  MovieSelectItemWidget({
    super.key,
    required this.movieImage, required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    if (movieImage != "") {
      movieImage = AppImages.baseUrl + movieImage;
    }
    return SizedBox(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                  image: NetworkImage(movieImage), fit: BoxFit.cover),
            ),
          ),
          SvgPicture.asset(
            isSelected ? AppImages.iconBrowser : AppImages.iconUnBookmark,
            width: 27.w,
            height: 36.h,
          ),
        ],
      ),
    );
  }
}