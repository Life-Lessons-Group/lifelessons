import 'package:firebase_flutter_life/features/topics/presentation/widgets/topics_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TopicsScreen extends StatefulWidget {
  static const routeName = '/topic-screen';

  @override
  _TopicsScreenState createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: <Color>[
            Colors.lightGreen[200],
            Colors.lightBlue[600],
          ],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: Container(),
            title: Text(
              "life lessons",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: TopicsList(
            book: "Pandemic",
          )),
    );
  }
}
