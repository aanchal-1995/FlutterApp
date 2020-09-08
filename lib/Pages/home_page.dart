import 'package:flutter/material.dart';

import '../change_name_card.dart';
import '../drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  var myText = "Change Me!!";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Card(
            child:
                ChangeNameCard(myText: myText, nameController: _nameController),
          ),
        ),
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
