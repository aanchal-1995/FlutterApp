import 'package:awesome_app/utils/Constants.dart';
import 'package:flutter/material.dart';

// import '../change_name_card.dart';
import '../drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  var myText = "Change Me!!";
  var url = "http://jsonplaceholder.typicode.com/photos";
  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var res = await http.get(url);
    // print(res.body);
    data = jsonDecode(res.body);
    print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.green,
    //   child: Text("Hi Aanchal"),
    // );
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Hi Aanchal"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Constants.prefs.setBool("LoggedIn", false);
                Navigator.pushReplacementNamed(context, "/login");
              })
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: data != null
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(data[index]["title"]),
                        subtitle: Text("ID : ${data[index]["id"]}"),
                        leading: Image.network(data[index]["url"]),
                      ),
                    );
                  },
                  itemCount: data.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                )
          // child:
          //     ChangeNameCard(myText: myText, nameController: _nameController),

          ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Align(
    //     alignment: Alignment.bottomLeft,
    //     child: Container(
    //       color: Colors.black,
    //       width: 200,
    //       height: 400,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Container(
    //             padding: const EdgeInsets.all(10),
    //             height: 100,
    //             width: 100,
    //             color: Colors.blue,
    //           ),
    //           Container(
    //             padding: const EdgeInsets.all(10),
    //             height: 100,
    //             width: 100,
    //             color: Colors.yellow,
    //           ),
    //           Container(
    //             padding: const EdgeInsets.all(10),
    //             height: 100,
    //             width: 100,
    //             color: Colors.green,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ));
  }
}
