import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/enums/requist_status_enum.dart';
import 'package:news_app/featuers/home/componants/top_headline_item.dart';
import 'package:news_app/featuers/home/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TopHeadlineList extends StatelessWidget {
  const TopHeadlineList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, widgwt) {
        switch (provider.topHeadLineStatuse) {
          case RequistStatusEnum.loading:
            return SliverList.separated(
              separatorBuilder: (BuildContext context, int index) => Gap(5),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(width: double.infinity, height: 140, color: Colors.white),
                    ),
                  ),
                );
              },
            );
          case RequistStatusEnum.error:
            return SliverToBoxAdapter(child: Center(child: Text(provider.errorMessage!)));
          case RequistStatusEnum.loaded:
            return SliverList.separated(
              separatorBuilder: (BuildContext context, int index) => Gap(5),
              itemCount: provider.newsTopHeadLinesList.length,
              itemBuilder: (context, index) {
                final modelData = provider.newsTopHeadLinesList[index];
                return TopHeadlineItem(dataModel: modelData);
              },
            );
        }
      },
    );
  }
}
