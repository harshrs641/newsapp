import 'package:flutter/material.dart';
import 'package:newsapp/views/home/newsCategory/business.dart';
import 'package:newsapp/views/home/newsCategory/entertainment.dart';
import 'package:newsapp/views/home/newsCategory/general.dart';
import 'package:newsapp/views/home/newsCategory/health.dart';
import 'package:newsapp/views/home/newsCategory/science.dart';
import 'package:newsapp/views/home/newsCategory/sports.dart';
import 'package:newsapp/views/home/newsCategory/technology.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 7,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Triveous News App"),
              centerTitle: true,
              bottom: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: Color(0X80FFFFFF),
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.white, width: 3.0),
                    ),
                  ),
                tabs: [
                  Tab(text: "Businnes",),
                  Tab(text:"Entertainment"),
                  Tab(text: "General",),
                  Tab(text:"Health"),
                  Tab(text: "Science",),
                  Tab(text: "Sports",),
                  Tab(text: "Technology",) ],),),
      body: TabBarView(children: [BusinessTabView(), EntertainmentTabView(), GeneralTabView(), HealthTabView(), ScienceTabView(), SportsTabView(), TechnologyTabView()]),
        
      ),
    );
  }
}