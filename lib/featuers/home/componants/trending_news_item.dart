import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/extentions/datea_time_extention.dart';
import 'package:news_app/core/widgets/custom_cached_network_image.dart';
import 'package:news_app/featuers/home/models/news_article_model.dart';
import 'package:news_app/featuers/home/screens/news_details_screen.dart';

class TrendingNewsItem extends StatelessWidget {
  final NewsArticleModel dataModel;
  const TrendingNewsItem({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailsScreen(dataModel: dataModel)));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: 235,
          height: 140,
          child: Stack(
            children: [
              CustomCachedNetworkImage(width: 235, height: 140, imageURL: dataModel.urlToImage ?? ""),

              ///// GRADIANT ////////
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.2),
                        Colors.black.withValues(alpha: 0.5),
                        Colors.black.withValues(alpha: 0.2),
                        Colors.black.withValues(alpha: 1),
                      ],
                    ),
                  ),
                ),
              ),

              //////  TITLE AND DESCRRIPTION AND TIME ///////
              Positioned.fill(
                top: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///// TITLE
                      Text(
                        dataModel.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Color(0xffFFFCFC), fontSize: 14, fontWeight: FontWeight.w700),
                      ),

                      ///// DESCRIPTION
                      Text(
                        overflow: TextOverflow.ellipsis,
                        dataModel.title,
                        style: TextStyle(color: Color(0xffFFFCFC), fontSize: 14, fontWeight: FontWeight.w700),
                      ),

                      Gap(10),
                      ////  AUTHOER AND DATE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(radius: 15, child: Image.asset("assets/images/home/logo.png")),
                              Gap(5),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  dataModel.author,
                                  style: TextStyle(
                                    color: Color(0xffFFFCFC),
                                    fontSize: 14,
                                    fontFamily: "TimesNewRoman",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            width: 65,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              dataModel.publishedAt.formateDateTime(),
                              style: TextStyle(
                                color: Color(0xffFFFCFC),
                                fontSize: 14,
                                fontFamily: "TimesNewRoman",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
