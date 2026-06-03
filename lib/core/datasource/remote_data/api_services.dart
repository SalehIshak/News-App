import 'dart:convert';

import 'package:http/http.dart' as http show get, Response;
import 'package:news_app/core/datasource/remote_data/api_config.dart';

////// نقوم بتظبيت الرابط الأساسي بحيث يحتوي على الرابط الاساسي + الأند بوينت + براميترز مع العلم انه سيتم استقبال الاندبوينت والبارامز عند اسدعء الدالة

/// بدلا من عمل سنجلتون يفضل عمل ابستراكت كلاس لان لدينا أكثر من كلاس اي بي اي سيرفس
//// MAKE IT SENGLETON CLASS
////////////////////////////////
// ApiService._();
// static final ApiService _apiService = ApiService._();
// factory ApiService() => _apiService;
/////////////////////////////////

abstract class BaseApiService {
  Future<dynamic> get(String endPoint, Map<String, dynamic>? params);
}

class ApiService extends BaseApiService {
  @override
  Future<dynamic> get(String endPoint, Map<String, dynamic>? params) async {
    final url = Uri.http(ApiConfig.baseUrl, "v2/$endPoint", {"apiKey": ApiConfig.apiKey, ...?params});
    try {
      final http.Response responce = await http.get(url);

      return jsonDecode(responce.body) as Map<String, dynamic>;
    } catch (e) {
      throw Exception(" Failed To Load Data $e");
    }
  }
}

///FOR TEST I CAN DELETE
class ApiServiceFromFirebase extends BaseApiService {
  @override
  Future<dynamic> get(String endPoint, Map<String, dynamic>? params) async {
    final url = Uri.http(ApiConfig.baseUrl, "v2/$endPoint", {"apiKey": ApiConfig.apiKey, ...?params});

    try {
      final http.Response responce = await http.get(url);

      return jsonDecode(responce.body) as Map<String, dynamic>;
    } catch (e) {
      throw Exception(" Failed To Load Data $e");
    }
  }
}
