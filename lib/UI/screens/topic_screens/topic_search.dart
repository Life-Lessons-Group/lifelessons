import 'package:firebase_flutter_life/UI/screens/topic_screens/topic_selected_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



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
                      padding: EdgeInsets.all(15.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.blueGrey,
                        child: ListTile(
                          onTap: () {
                            var learnRoute = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TopicSelectedScreen(topic: items[index]),
                            );
                            Navigator.of(context).push(learnRoute);
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
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white70),
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Archived Lessons"),
                      onPressed: () {
                        Navigator.pushNamed(context, "/archived");
                      },
                    ),
                    Icon(Icons.arrow_forward),
                  ],
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
