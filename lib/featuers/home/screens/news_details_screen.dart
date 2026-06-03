import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/widgets/custom_cached_network_image.dart';
import 'package:news_app/featuers/home/componants/news_item_row.dart';
import 'package:news_app/featuers/home/models/news_article_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsArticleModel dataModel;
  const NewsDetailsScreen({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Details"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 343,
                height: 172,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(5),
                  child: CustomCachedNetworkImage(imageURL: dataModel.urlToImage ?? ""),
                ),
              ),

              // Image.network(dataModel.urlToImage!, fit: BoxFit.fill),
              Text(
                dataModel.description,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: "TimesNewRoman"),
              ),
              Gap(15),
              NewsItemRow(modelData: dataModel, utherWidth: 150),
              Gap(15),
              Text(
                dataModel.content,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: "TimesNewRoman"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
