import 'package:flutter/material.dart';
import 'package:news_app/core/enums/requist_status_enum.dart';
import 'package:news_app/core/mixins/safe_notiy_mixin.dart';
import 'package:news_app/core/repos/news_repository.dart';
import 'package:news_app/featuers/home/models/news_article_model.dart';

class SearchProvider extends ChangeNotifier with SafeNotify {
  final BaseNewsRepositort newsRepository;
  SearchProvider(this.newsRepository);

  final TextEditingController textEditingController = TextEditingController();
  List<NewsArticleModel> newsEvryThingList = [];

  RequistStatusEnum getEvryThingStatuse = RequistStatusEnum.loading;
  String? errorMasage;

  void getEvryThing() async {
    try {
      newsEvryThingList = await newsRepository.getEverything(sarchWord: textEditingController.text);
      getEvryThingStatuse = RequistStatusEnum.loaded;
    } catch (e) {
      getEvryThingStatuse = RequistStatusEnum.error;
      errorMasage = "$e";
    }
    notify();
  }
}
