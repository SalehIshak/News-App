import 'package:flutter/material.dart';
import 'package:news_app/core/enums/requist_status_enum.dart';
import 'package:news_app/core/mixins/safe_notiy_mixin.dart';
import 'package:news_app/featuers/home/models/news_article_model.dart';
import 'package:news_app/core/repos/news_repository.dart';

class HomeProvider extends ChangeNotifier with SafeNotify {
  final BaseNewsRepositort newsRepository; ////// INISTANCE FOR newsRepository USING BaseNewsRepositort AS A PARANT

  HomeProvider(this.newsRepository) {
    getEverything();
    getTopHeadLine();
  }

  /// FOR DISPOSE
  //// INISTANECS
  //// بدلا من عمل انستانس كامل نقوم بعمله بهذا الشكل ونحقنه في الكونستراكتور كما في الأعلي ونضع اسم الكلاس في ال تشنج نوتيفاير في المين
  /// final NewsRepository newsRepository = NewsRepository();

  //// VARS
  List<NewsArticleModel> newsEverythingList = [];
  List<NewsArticleModel> newsTopHeadLinesList = [];
  String? errorMessage;
  String? sellectedCategory;

  ///// CHECK STATUS VARS
  RequistStatusEnum everyThingStatuse = RequistStatusEnum.loading;
  RequistStatusEnum topHeadLineStatuse = RequistStatusEnum.loading;

  //// Get GETTOPHEADLINE METHOD
  void getTopHeadLine({String? category}) async {
    try {
      topHeadLineStatuse = RequistStatusEnum.loading;
      newsTopHeadLinesList = await newsRepository.getTopHeadLine(sellectedCategory: category);
      topHeadLineStatuse = RequistStatusEnum.loaded;
    } catch (e) {
      topHeadLineStatuse = RequistStatusEnum.error;
      errorMessage = e.toString();
    }

    notify();
  }

  //// Get GETEVRYTHING METHOD
  void getEverything() async {
    try {
      everyThingStatuse = RequistStatusEnum.loading;
      newsEverythingList = await newsRepository.getEverything();
      everyThingStatuse = RequistStatusEnum.loaded;
    } catch (e) {
      everyThingStatuse = RequistStatusEnum.error;
      errorMessage = e.toString();
    }

    notify();
  }

  //////  UPDATE SELLECTED CATEGORY  //////
  void updateSellectedCategorys(String category) {
    sellectedCategory = category;
    getTopHeadLine(category: category);
    notify();
  }
}


/*
بعد الانتهاء من البروفايدر بالكامل الكود اشتغل بشكل سليم لكن فيه مشكلة ممكن تحصل لو الانترنت ضعيف وهي
 في حالة الدخول الى صفحة الهوم والخروج منها بسرعة قبل ما الداتا تيجي وتتعرض هيديني اكسبشن لان الداتا لما رجعت
 لقيتك خرجت من الصفحة اللى المفترض هتتعرض فيها والحل اني اعمل دسبوس للصفحة في حالة الخروج منها واعمل تشك على نوتيفايلسنر 
 وبدل ما اضيف الكود هنا مباشرة عملت له مكسن خاص بيه علشان لو هستخدمه في أي بروفايدر تاني وحطيت فيه الكود وجيت هنا استخدمت المكسن عادي 
 
*/