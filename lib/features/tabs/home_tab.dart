import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/release_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /// Popular
          // PopularViewWidget(),
          SizedBox(
            height: 24.h,
          ),
          /// Release
          const ReleaseWidget(),
          SizedBox(
            height:24.h ,
          ),
          /// Top Rated - Recommended
          const ReleaseWidget(),
        ],
      ),
    );
  }
}
