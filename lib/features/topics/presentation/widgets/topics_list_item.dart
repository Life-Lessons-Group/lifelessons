import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_flutter_life/UI/screens/record_screens/test_record_screen.dart';
import 'package:firebase_flutter_life/core/AppColors.dart';
import 'package:firebase_flutter_life/features/topics/presentation/pages/selected_topic.dart';

import 'package:flutter/material.dart';

class TopicsListItem extends StatelessWidget {
  final String title;

  const TopicsListItem({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                                title,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 125,
                                  height: 40,
                                  child: RaisedButton(
                                    onPressed: () {
                                      var learnRoute = MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SelectedTopicScreen(topic: title),
                                      );
                                      Navigator.of(context).push(learnRoute);
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
                                        child: AutoSizeText(
                                          "Learn",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          maxFontSize: 18,
                                          minFontSize: 12,
                                          maxLines: 1,
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
                                      var contributeRoute = MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            TestRecord(topic: title),
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
                                    child: AutoSizeText(
                                      "Contribute",
                                      style: TextStyle(
                                        color: AppColors.accessoryColor,
                                      ),
                                      maxFontSize: 18,
                                      minFontSize: 12,
                                      maxLines: 1,
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
          title: AutoSizeText(
            title,
            style: TextStyle(
                color: Colors.white, fontFamily: "Montserrat"),
            maxFontSize: 18,
            minFontSize: 12,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
