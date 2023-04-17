import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class HttpsClient {
  /// 单例
  static final HttpsClient _instance = HttpsClient._internal();
  static HttpsClient get instance => _instance;
  Dio? _dio;

  /// 工厂构造函数
  factory HttpsClient() {
    return _instance;
  }

  /// 构造函数私有化，防止被误创建
  HttpsClient._internal() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: 'https://api.wmdb.tv/api/v1/top',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: 'application/json; charset=utf-8',
        responseType: ResponseType.json,
      );
      _dio = Dio(options);
      // Cookie管理
      CookieJar cookieJar = CookieJar();
      _dio!.interceptors.add(CookieManager(cookieJar));
    }
  }

  Future get(apiUrl, {Map<String, dynamic>? data}) async {
    try {
      var res = await _dio!.get(apiUrl, queryParameters: data);
      print('''
=============apiUrl=================
${res.realUri}
''');
      return res;
    } catch (e) {
      print('请求超时');
      return null;
    }
  }

  Future post(String apiUrl, {Map<String, dynamic>? data}) async {
    try {
      print('''
=============apiUrl=================
$apiUrl
''');
      var res = await _dio!.post(apiUrl, data: data);
      return res;
    } catch (e) {
      print('请求超时');
      return null;
    }
  }
}
