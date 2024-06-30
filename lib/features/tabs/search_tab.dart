import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/tabs/widgets/release_widget.dart';
import 'package:movies/features/tabs/widgets/search_widget.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
        ),
        GestureDetector(
            onTap: () {
              showSearch(
                context: context,
                delegate: SearchTabDelegate(), // Replace with your delegate
              );
            },
            child: const SearchContainer()),
        const Expanded(flex: 7, child: NotFoundWidget())
      ],
    );
  }
}

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No movies found",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 12,
        ),
        Image.asset("assets/images/no_movie.png"),
      ],
    );
  }
}

//////////
class SearchTabDelegate extends SearchDelegate {
  SearchTabDelegate();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const ReleaseWidget();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    /// before search and after search
    return const NotFoundWidget();
  }
}
