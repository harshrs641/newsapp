import 'package:newsapp/data/newsList/news_list_repository.dart';
import 'package:newsapp/services/api_services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: ApiService()),

];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<ApiService, NewsListRepository>(
    update: (context, api, newsListRepository) => NewsListRepository(api: api),
  ),
 
];

List<SingleChildWidget> uiConsumableProviders = [

];
