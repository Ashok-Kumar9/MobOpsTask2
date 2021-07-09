import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_app_task_b/listView.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color appColor = Color(0xff209b47);

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double height = MediaQuery.of(context).size.height -
        (padding.top + padding.bottom) -
        kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: appColor,
        title: Center(child: Text('Scrollable List')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: Image(
                            image: AssetImage(Listview.orgImageList[index]),
                          ),
                          radius: 50.0,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                Listview.organisationList[index],
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                Listview.orgDescription[0],
                                style: TextStyle(fontSize: 13.5),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.facebook,
                                        color: appColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.email,
                                        color: appColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.web,
                                        color: appColor,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      // side: BorderSide(color: appColor, width: 2.0),
                      borderRadius: BorderRadius.circular(10)),
                );
              },
              itemCount: Listview.organisationList.length,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: appColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              padding: EdgeInsets.all(20.0),
              height: height,
              child: Center(
                child: Text(
                  'Organizations in IITM',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
