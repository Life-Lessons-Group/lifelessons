import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_flutter_life/UI/screens/record_screens/test_record_screen.dart';
import 'package:firebase_flutter_life/core/AppColors.dart';
import 'package:firebase_flutter_life/features/timeline/data/models/topic.dart';
import 'package:firebase_flutter_life/features/timeline/presentation/pages/topic_selected_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topics = Provider.of<List<Topic>>(context);
    print(topics.length);
    return ListView.builder(
      itemCount: topics.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.blueGrey,
            child: ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0)), //this right here
                        child: Container(
                          height: 200,
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                child: Center(
                                  child: AutoSizeText(
                                    topics[index].title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: <Color>[
                                      AppColors.gradientGreen,
                                      AppColors.gradientBlue,
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 125,
                                      height: 40,
                                      child: RaisedButton(
                                        onPressed: () {
                                          var learnRoute = MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                TopicSelectedScreen(
                                                    topic: topics[index].title),
                                          );
                                          Navigator.of(context)
                                              .push(learnRoute);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(80.0)),
                                        padding: EdgeInsets.all(0.0),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  AppColors.gradientGreen,
                                                  AppColors.gradientBlue
                                                ],
                                                begin: Alignment.bottomLeft,
                                                end: Alignment.topRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.25,
                                                minHeight: 50.0),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Learn",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 125,
                                      height: 40,
                                      child: RaisedButton(
                                        color: Colors.white,
                                        onPressed: () {
                                          var contributeRoute =
                                              MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                TestRecord(
                                                    topic: topics[index].title),
                                          );
                                          Navigator.of(context)
                                              .push(contributeRoute);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(80.0),
                                            side: BorderSide(
                                                color: AppColors.accessoryColor,
                                                width: 2,
                                                style: BorderStyle.solid)),
                                        child: Text(
                                          "Contribute",
                                          style: TextStyle(
                                            color: AppColors.accessoryColor,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ),
                      );
                    });
              },
              title: Text(
                topics[index].title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: "Montserrat"),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
