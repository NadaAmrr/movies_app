import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/config/routes/routes.dart';
import 'package:movies/core/api/api_manager.dart';
import 'package:movies/core/utils/app_colors.dart';
import 'package:movies/core/utils/app_images.dart';
import 'package:movies/core/utils/app_strings.dart';
import 'package:movies/core/widgets/movie_select_widget.dart';
import 'package:intl/intl.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String formatPublishedAt(String dateStr) {
      DateTime dateTime = DateTime.parse(dateStr);
      return DateFormat('MMMM dd, yyyy').format(dateTime);
    }

    return Container(
      color: AppColors.secondary,
      height: 330.h,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Release text
          SizedBox(
            height: 15.h,
          ),
          Text(
            AppStrings.release,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 15.h,
          ),
          FutureBuilder(
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
                return SizedBox(
                  height: 250.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.shade800,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade900.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                  0.5, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MovieSelectItemWidget(
                              movieImage: results[index].backdropPath ?? "",
                              isSelected: true,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        AppImages.iconStar,
                                        width: 15.04.w,
                                        height: 12.6.h,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        (results[index]
                                                .voteAverage
                                                .toString() ??
                                            ""),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    results[index].title ?? "",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    formatPublishedAt(
                                        results[index].releaseDate ?? ""),
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: results.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 14,
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
