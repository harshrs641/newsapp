import 'package:newsapp/data/newsList/news_list_model.dart';
import 'package:newsapp/services/api_services.dart';

class NewsListRepository {
  ApiService api;
  NewsListRepository({this.api});
  Future<NewsListResponse> getNewsList(String categoryName) async {
    NewsListResponse response = await api.getNewsList(categoryName);
    return response;
  }
}
