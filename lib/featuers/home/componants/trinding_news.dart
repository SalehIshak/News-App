import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/enums/requist_status_enum.dart';
import 'package:news_app/featuers/home/componants/trending_news_item.dart';
import 'package:news_app/featuers/home/providers/home_provider.dart';
import 'package:news_app/featuers/home/componants/view_all_componants.dart';
import 'package:news_app/featuers/home/screens/categorys_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TrindingNews extends StatelessWidget {
  const TrindingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 277,
        child: Stack(
          children: [
            /// Image
            Image.asset("assets/images/home/home_back_ground.png"),

            //// COLUMN =>  NEWST WORD AND  ROW
            Positioned.fill(
              top: 60,
              child: Column(
                children: [
                  //// NEWST WORD
                  Text(
                    "NEWST",
                    style: TextStyle(
                      color: Color(0xffC53030),
                      fontSize: 25,
                      fontFamily: "TimesNewRoman",
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Gap(10),

                  /// ROW
                  ViewAllComponants(
                    title: "Trending News",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CategorysScreen()));
                    },
                  ),

                  Gap(10),
                  //// LISTVIEW ROW ////////
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 140,
                      child: Consumer<HomeProvider>(
                        builder: (context, HomeProvider provider, Widget? weget) {
                          switch (provider.everyThingStatuse) {
                            case RequistStatusEnum.loading:
                              return Center(
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) => Gap(10),
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        child: Container(width: 235, height: 70, color: Colors.white),
                                      ),
                                    );
                                  },
                                ),
                              );
                            case RequistStatusEnum.error:
                              return Center(child: CircularProgressIndicator(color: Colors.white));
                            case RequistStatusEnum.loaded:
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) => Gap(10),
                                itemCount: provider.newsEverythingList.length,
                                itemBuilder: (context, index) {
                                  final dataModel = provider.newsEverythingList[index];
                                  return TrendingNewsItem(dataModel: dataModel);
                                },
                              );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
