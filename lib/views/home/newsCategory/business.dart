import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/data/newsList/news_list_model.dart';
import 'package:newsapp/views/home/home_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class BusinessTabView extends StatefulWidget {
  @override
  _BusinessTabViewState createState() => _BusinessTabViewState();
}

class _BusinessTabViewState extends State<BusinessTabView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
          onModelReady: (model)=>model.getNewsList("business"),
          viewModelBuilder: ()=>HomeViewModel(newsListRepository: Provider.of(context)),
          builder:(context, model, child)=> Scaffold(
        body:model.isBusy
        ?LinearProgressIndicator()
        :ListView.builder(itemCount: model.newsListResponse.articles.length,
        physics: BouncingScrollPhysics(),
itemBuilder: (context, index)=>
          InkWell(onTap: ()=>model.navigateToDetailPage(model.newsListResponse.articles[index].url, model.newsListResponse.articles[index].title),
                  child: card( model.newsListResponse.articles[index]))          )
        
      ),
    );
  }
    Widget card(Article article){
return article.urlToImage==null
        ?Container()
        :Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))),
          elevation: 10,
          child: AspectRatio(
    aspectRatio: 1, 
    child: Column(
      children: [
        Expanded(child: Image.network(article.urlToImage, fit: BoxFit.cover,)), 
        ListTile(
            title: Text(article.title), 
            subtitle: Text(article.description, maxLines: 3,),), 
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Flexible(child: Text(article.author??"")),
              Text(DateFormat.yMMMd().format(article.publishedAt)),
            ],
          ),
        )],),),
);
  }
}