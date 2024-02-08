import 'package:dio/dio.dart';


class ApiService {
  final Dio dio = Dio();

  Future<Response> post({
    required String url,
    required String token,
    required  body,
    Map<String, dynamic>? headers,
  }) async {
    var response = await dio.post(
      url,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers:headers?? {'Authorization': 'Bearer $token'},
      ),
      data: body,
    );
    return response;
  }
}
