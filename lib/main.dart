import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
  static const customColor = 0xFF11101e;
  static const containerBox = 0xFF191933;
}

class _TodoState extends State<Todo> {
  List<dynamic> lst = [];
  var output = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
              color: Color(0xFF191933),
              height: 50,
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              child: ListTile(
                title: Text(
                  "${lst[index]}",
                  style: TextStyle(color: Color(0xFFdfe0e5)),
                ),
                trailing: Container(
                    width: 80,
                    child: Row(
                      children: [
                        Container(
                          child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Add Item',
                                      ),
                                      content: TextField(
                                        onChanged: (value) {
                                          output = value;
                                        },
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              setState(() {
                                                lst.replaceRange(
                                                    index, index + 1, {output});
                                              });
                                            },
                                            child: Text("Edit Item"))
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.blue,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  lst.removeAt(index);
                                });
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        )
                      ],
                    )),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Add Item',
                  ),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            lst.add(output);
                          });
                        },
                        child: Text("Add"))
                  ],
                );
              },
            );
          },
          child: Text(
            "add",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          scaffoldBackgroundColor: const Color(0xFF11101e),
        ),
        home: Scaffold(
            appBar: AppBar(
                title: Center(
              child: Text("TodoApp"),
            )),
            body: Todo()));
  }
}
