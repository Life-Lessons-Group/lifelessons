import 'package:firebase_flutter_life/core/size_config.dart';
import 'package:firebase_flutter_life/features/discover/presentation/widgets/archived_topics_list.dart';
import 'package:firebase_flutter_life/features/discover/presentation/widgets/discover_category_list.dart';
import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  ScrollController _controller;
  bool appTitleVisible = true;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        appTitleVisible = true;
      });
    }
  }

  _onStartScroll(ScrollMetrics metrics) {
    setState(() {
      appTitleVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: AnimatedOpacity(
          opacity: appTitleVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Text(
            "discover",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.lightGreen[200],
                Colors.lightBlue[600],
              ]),
        ),
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollStartNotification) {
              _onStartScroll(scrollNotification.metrics);
            }
          },
          child: ListView(
            scrollDirection: Axis.vertical,
            controller: _controller,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextField(
              //     cursorColor: Colors.black,
              //     cursorWidth: 1,
              //     decoration: InputDecoration(
              //       prefixIcon: Icon(
              //         Icons.search,
              //         color: Colors.black.withOpacity(0.4),
              //       ),
              //       hintText: "Search for Topics",
              //       hintStyle:
              //           TextStyle(color: Colors.black12.withOpacity(0.6)),
              //       filled: true,
              //       fillColor: Colors.black.withOpacity(0.1),
              //       border: OutlineInputBorder(
              //         borderRadius: const BorderRadius.all(
              //           Radius.circular(20),
              //         ),
              //         borderSide: BorderSide(color: Colors.transparent),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: const BorderRadius.all(
              //           Radius.circular(20),
              //         ),
              //         borderSide: BorderSide(color: Colors.transparent),
              //       ),
              //       errorBorder: InputBorder.none,
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: const BorderRadius.all(
              //           Radius.circular(20),
              //         ),
              //         borderSide: BorderSide(color: Colors.transparent),
              //       ),
              //       disabledBorder: InputBorder.none,
              //     ),
              //   ),
              // ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 30,
                width: SizeConfig.screenWidth,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Archived Books",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ArchivedTopicsList(),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 30,
                width: SizeConfig.screenWidth,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Topics by Category(Coming Soon)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              SizedBox(height: 10),
              DiscoverCategoryList(),
            ],
          ),
        ),
      ),
    );
  }
}
