import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/extentions/datea_time_extention.dart';
import 'package:news_app/featuers/home/models/news_article_model.dart';

class NewsItemRow extends StatelessWidget {
  final NewsArticleModel modelData;
  final double? utherWidth;
  final double? dateWidth;
  const NewsItemRow({super.key, required this.modelData, this.utherWidth, this.dateWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ///// AVATAR
            CircleAvatar(radius: 15, child: Image.asset("assets/images/home/logo.png")),

            Gap(5),
            ///// AUTHOR
            SizedBox(
              width: utherWidth ?? 50,
              child: Text(
                overflow: TextOverflow.ellipsis,
                modelData.author,
                style: TextStyle(
                  color: Color(0xff141414),
                  fontSize: 10,
                  fontFamily: "TimesNewRoman",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            //// DATE AND TIME
            SizedBox(
              width: dateWidth ?? 80,
              child: Text(
                overflow: TextOverflow.ellipsis,
                modelData.publishedAt.formateDateTime(),
                style: TextStyle(
                  color: Color(0xff141414),
                  fontSize: 10,
                  fontFamily: "TimesNewRoman",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),

        Gap(8),
        ///// BOOK MARK ICON
        Icon(Icons.bookmark_border_outlined),
      ],
    );
  }
}
