import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Client;
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:newsapp/data/newsList/news_list_model.dart';
import 'package:newsapp/helper/network_error_handling.dart';

import 'api_interceptor_service.dart';


class ApiService {
  Client client = HttpClientWithInterceptor.build(interceptors: [
    ApiInterceptorService(),
  ]);

  Future<NewsListResponse> getNewsList(String categoryName) async {
    var response;
    try {
      response = await client.get('https://newsapi.org/v2/top-headlines?country=in&apiKey=8a3270cf65eb49da932ca43ec3db95aa&category=$categoryName');
      return NewsListResponse.fromJson(validateResponse(response));
    } on SocketException {
      throw Failure("Server not responding");
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        throw Failure("No Internet Connection");
      } else {
        throw Failure(
          e.toString(),
        );
      }
    }
  }

  }
