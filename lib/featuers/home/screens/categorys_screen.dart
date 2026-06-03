import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/datasource/remote_data/api_services.dart';
import 'package:news_app/core/enums/requist_status_enum.dart';
import 'package:news_app/core/repos/news_repository.dart';
import 'package:news_app/featuers/home/componants/categorys_list.dart';
import 'package:news_app/featuers/home/componants/top_headline_item.dart';
import 'package:news_app/featuers/home/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CategorysScreen extends StatelessWidget {
  const CategorysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories"), centerTitle: true),

      body: ChangeNotifierProvider(
        create: (context) => HomeProvider(NewsRepository(ApiService())),
        child: Consumer<HomeProvider>(
          builder: (context, provider, widget) {
            return Column(
              children: [
                Gap(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 30,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => Gap(20),
                      itemCount: categorysList.length,
                      itemBuilder: (context, index) {
                        return Consumer<HomeProvider>(
                          builder: (context, HomeProvider provider, Widget? widget) {
                            final category = provider.sellectedCategory == categorysList[index];
                            return IntrinsicWidth(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      provider.updateSellectedCategorys(categorysList[index]);
                                    },
                                    child: Text(
                                      categorysList[index][0].toUpperCase() + categorysList[index].substring(1),
                                      style: TextStyle(
                                        color: category ? Colors.red : Color(0xff363636),
                                        fontSize: 16,
                                        fontFamily: "TimesNewRoman",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  category ? Container(height: 1, color: Colors.red) : SizedBox.shrink(),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),

                Gap(15),
                Expanded(
                  child: Consumer<HomeProvider>(
                    builder: (context, provider, widgwt) {
                      switch (provider.topHeadLineStatuse) {
                        case RequistStatusEnum.loading:
                          return ListView.separated(
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
                          return Center(child: Text(provider.errorMessage!));
                        case RequistStatusEnum.loaded:
                          return ListView.separated(
                            separatorBuilder: (BuildContext context, int index) => Gap(5),
                            itemCount: provider.newsTopHeadLinesList.length,
                            itemBuilder: (context, index) {
                              final modelData = provider.newsTopHeadLinesList[index];
                              return TopHeadlineItem(dataModel: modelData);
                            },
                          );
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
