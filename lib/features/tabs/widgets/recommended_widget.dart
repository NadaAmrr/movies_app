import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/api/api_manager.dart';
import 'package:movies/core/utils/app_colors.dart';
import 'package:movies/core/utils/app_strings.dart';
import 'package:movies/core/widgets/movie_select_widget.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.secondary,
        height: 187.h,
        child: FutureBuilder(
            future: ApiManager.fetchRecommend(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.main,
                  ),
                );
              }
              if (snapshot.hasError) {
                return const Text(
                    textAlign: TextAlign.center, AppStrings.error);
              }
              var results = snapshot.data?.results ?? [];
              if (results.isEmpty) {
                return const Text(
                    textAlign: TextAlign.center, AppStrings.empty);
              }
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        /// Movie selected
                        MovieSelectItemWidget(movieImage: results[index].backdropPath ?? "", isSelected: false),
                        ///
                        Text("data")
                      ],
                    );
                  },
                  itemCount: results.length,
                ),
              );
            }));
  }
}
