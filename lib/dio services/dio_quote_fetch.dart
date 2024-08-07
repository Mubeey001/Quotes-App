import 'package:dio/dio.dart';
import 'package:quote_app/model/contant.dart';

class DioQuoteFetch {
  final Dio _dio = Dio();

  Future<Response> getQuotes() async {
    try {
      final response = await _dio.get(Constant.fullurl);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
