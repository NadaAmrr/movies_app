import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/tabs/widgets/popular_widget.dart';
import 'package:movies/features/tabs/widgets/recommended_widget.dart';
import 'widgets/release_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /// Popular
          const PopularWidget(),
          SizedBox(
            height: 24.h,
          ),
          /// Release
          const ReleaseWidget(),
          SizedBox(
            height:24.h ,
          ),
          /// Top Rated - Recommended
           const RecommendedWidget(),
        ],
      ),
    );
  }
}
