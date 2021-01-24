import 'package:firebase_flutter_life/features/topics/presentation/widgets/topics_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcase.dart';
import 'package:showcaseview/showcase_widget.dart';

class TopicsScreen extends StatefulWidget {
  static const routeName = '/topic-screen';

  @override
  _TopicsScreenState createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  ScrollController _controller;
  bool appTitleVisible = true;
  final _bookKey = GlobalKey();
 
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context).startShowCase([_bookKey]));
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
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.greenAccent.withOpacity(0.4), BlendMode.darken),
          image: AssetImage('images/logo_screen_shot.png'),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: Container(),
            title: Showcase(
              key: _bookKey,
              overlayOpacity: 0.8,
              title: "Welcome to Life Lessons!",
              description:
                  'The most recent Book of Lessons will be shown here.\n Tap any lesson below to listen or record lessons!',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Pandemic",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800),
                ),
              ),
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
