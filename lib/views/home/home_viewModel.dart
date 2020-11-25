import 'package:flutter/foundation.dart';
import 'package:newsapp/data/newsList/news_list_model.dart';
import 'package:newsapp/data/newsList/news_list_repository.dart';
import 'package:newsapp/di/locator.dart';
import 'package:newsapp/helper/network_error_handling.dart';
import 'package:newsapp/routes/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  SnackbarService _snackbarService = locator<SnackbarService>();
  NavigationService _navigationService = locator<NavigationService>();

  NewsListRepository newsListRepository;
  HomeViewModel({@required this.newsListRepository});

  NewsListResponse _newsListResponse;
  NewsListResponse get newsListResponse => _newsListResponse;

  getNewsList(String categoryName) async {
    setBusy(true);

    try {
      await newsListRepository
          .getNewsList(categoryName)
          .then((value) => _onGetNewsListRespons(value, null));
    } on Failure catch (e) {
      _onGetNewsListRespons(null, e);
    }

    setBusy(false);
  }

  _onGetNewsListRespons(NewsListResponse listResponse, Failure error) {
    if (error != null)
      _snackbarService.showSnackbar(message: error.message);
    else
      _newsListResponse = listResponse;
  }

  navigateToDetailPage(String url, String title) async {
    await _navigationService.navigateTo(Routes.webView,
        arguments: WebViewArguments(url: url, appbarTitle: title));
  }
}
