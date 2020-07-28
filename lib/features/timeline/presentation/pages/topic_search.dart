import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_flutter_life/UI/screens/record_screens/record_begin_screen.dart';
import 'package:firebase_flutter_life/UI/screens/record_screens/test_record_screen.dart';
import 'package:firebase_flutter_life/core/AppColors.dart';
import 'package:firebase_flutter_life/features/timeline/presentation/pages/topic_selected_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TopicSearch extends StatefulWidget {
  @override
  _TopicSearchState createState() => _TopicSearchState();
}

class _TopicSearchState extends State<TopicSearch> {
  List<String> items = List<String>();
  TextEditingController controller = new TextEditingController();
  String filter;

  @override
  initState() {
    super.initState();
    items.add("How to Move On");
    items.add("Road to Happiness");
    items.add("Wrestling with GOD");
    items.add("Making a Dream a Reality");
    items.add("When Your Best Is Not Enough");
    items.add("How to Trust Again");
    items.add("So You Want A Career in Film");
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
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
                                        borderRadius: BorderRadius.circular(
                                            20.0)), //this right here
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
                                                items[index],
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
                                                      var learnRoute =
                                                          MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            TopicSelectedScreen(
                                                                topic: items[
                                                                    index]),
                                                      );
                                                      Navigator.of(context)
                                                          .push(learnRoute);
                                                    },
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        80.0)),
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    child: Ink(
                                                      decoration: BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              AppColors
                                                                  .gradientGreen,
                                                              AppColors
                                                                  .gradientBlue
                                                            ],
                                                            begin: Alignment
                                                                .bottomLeft,
                                                            end: Alignment
                                                                .topRight,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.0)),
                                                      child: Container(
                                                        constraints: BoxConstraints(
                                                            maxWidth: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                1.25,
                                                            minHeight: 50.0),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "Learn",
                                                          textAlign:
                                                              TextAlign.center,
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
                                                        builder: (BuildContext
                                                                context) =>
                                                            TestRecord(
                                                                topic: items[
                                                                    index]),
                                                      );
                                                      Navigator.of(context)
                                                          .push(
                                                              contributeRoute);
                                                    },
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                80.0),
                                                        side: BorderSide(
                                                            color: AppColors
                                                                .accessoryColor,
                                                            width: 2,
                                                            style: BorderStyle
                                                                .solid)),
                                                    child: Text(
                                                      "Contribute",
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .accessoryColor,
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
                            items[index],
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
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => (Navigator.pushNamed(context, "/archived")),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white70),
                  width: 250,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Archived Lessons"),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

//  TextField(
//                 controller: editingController,
//                 decoration: InputDecoration(
//                     labelText: "Discover Topics",
//                     hintText: "Search",
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25.0)))),
//               );
