import 'package:news_app/core/datasource/remote_data/api_config.dart';
import 'package:news_app/core/datasource/remote_data/api_services.dart';
import 'package:news_app/featuers/home/models/news_article_model.dart';

///// يقوم بتجهيز الروابط طبقا للأندبويت بحيث يتم استدعاء دالة الرابط الاساسي من السرفسس وارسال لها الاندبوينت والبارامز

abstract class BaseNewsRepositort {
  Future<List<NewsArticleModel>> getTopHeadLine({String? sellectedCategory = "general"});
  Future<List<NewsArticleModel>> getEverything({String? sarchWord = "bitcoin"});
}

class NewsRepository extends BaseNewsRepositort {
  final BaseApiService apiServices;
  NewsRepository(this.apiServices);
  ////// GET TOP HEAD LINE END POINT
  ///
  @override
  Future<List<NewsArticleModel>> getTopHeadLine({String? sellectedCategory = "general"}) async {
    Map<String, dynamic> result = await apiServices.get(ApiConfig.topHeadline, {"category": sellectedCategory, "country": "us"});
    return (result["articles"] as List).map((e) => NewsArticleModel.fromjson(e)).toList();
  }

  //// GET EVRYTHING END POINT
  @override
  Future<List<NewsArticleModel>> getEverything({String? sarchWord = "bitcoin"}) async {
    Map<String, dynamic> result = await apiServices.get(ApiConfig.evryThing, {"q": sarchWord});
    return (result["articles"] as List).map((e) => NewsArticleModel.fromjson(e)).toList();
  }
}

/// FOR TESTING I CAN DELETE IT
// class NewsRepositoryMock extends BaseNewsRepositort {
//   BaseApiService apiServices;
//   NewsRepositoryMock(this.apiServices);
//   ////// GET TOP HEAD LINE END POINT
//   @override
//   Future<List<NewsArticleModel>> getTopHeadLine({String? sellectedCategory = "general"}) async {
//     Map<String, dynamic> result = await apiServices.get(ApiConfig.topHeadline, {"category": sellectedCategory, "country": "us"});
//     return (result["articles"] as List).map((e) => NewsArticleModel.fromjson(e)).toList();
//   }
//   //// GET EVRYTHING END POINT
//   @override
//   Future<List<NewsArticleModel>> getEverything({String? sarchWord}) async {
//     Map<String, dynamic> result = await apiServices.get(ApiConfig.evryThing, {"q": "bitcoin"});
//     return (result["articles"] as List).map((e) => NewsArticleModel.fromjson(e)).toList();
//   }
// }
