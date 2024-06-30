import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/release_item_widget.dart';
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // PopularViewWidget(),
          SizedBox(
            height: 24.h,
          ),
          /// Release
          const ReleaseItem(),
          SizedBox(
            height:24.h ,
          ),
          // topRatedItem(),

        ],
      ),
    );
  }
}
