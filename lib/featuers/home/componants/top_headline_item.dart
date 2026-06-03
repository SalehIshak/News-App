import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/widgets/custom_cached_network_image.dart';
import 'package:news_app/featuers/home/componants/news_item_row.dart';
import 'package:news_app/featuers/home/models/news_article_model.dart';
import 'package:news_app/featuers/home/screens/news_details_screen.dart';

class TopHeadlineItem extends StatelessWidget {
  final NewsArticleModel dataModel;
  const TopHeadlineItem({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailsScreen(dataModel: dataModel)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CustomCachedNetworkImage(imageURL: dataModel.urlToImage ?? ""),
            ),
            Gap(5),
            ////  COLUMN (TITLES  UTHOR  DATE AND ICONS)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    dataModel.title,
                    style: TextStyle(
                      color: Color(0xff141414),
                      fontSize: 16,
                      fontFamily: "TimesNewRoman",
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Text("data"),

                  NewsItemRow(modelData: dataModel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
