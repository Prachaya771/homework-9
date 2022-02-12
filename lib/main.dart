import 'package:flutter/material.dart';
import 'package:inclass_9/test_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  static const _size = 60.0;

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _input = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.purple.shade50,
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.5),
              blurRadius: 5.0,
              offset: const Offset(1.0, 1.0),
              spreadRadius: 5.0,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock_outlined,
                  size: 90.0,
                  color: Colors.grey,
                ),
                const SizedBox(width: 8.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Enter PIN to login',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < _input.length; i++)
                    Container(
                      width: 20.0,
                      height: 20.0,
                      margin: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        shape: BoxShape.circle,
                      ),
                    ),
                  for (var i = 0; i < 6-_input.length; i++)
                    Container(
                      width: 20.0,
                      height: 20.0,
                      margin: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildInkWell(1),
                    buildInkWell(2),
                    buildInkWell(3),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildInkWell(4),
                    buildInkWell(5),
                    buildInkWell(6),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildInkWell(7),
                    buildInkWell(8),
                    buildInkWell(9),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: HomePage._size,
                        height: HomePage._size,
                      ),
                    ),
                    buildInkWell(0),
                    buildInkWell(-1),
                  ],
                ),
              ],
            )

          ],
        ),
      ),
    );
  }


  Widget buildInkWell(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {

          if (num == -1) {
            setState(() {
              var len = _input.length;
              _input = _input.substring(0, len - 1);
            });
          } else {
            setState(() {
              if (_input.length <= 5) {
                _input = "$_input$num";
              }
            });
          }
          if (_input.length==6 && _input == "123456") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TestPage()));
          }
          else if(_input.length==6 && _input != "123456"){
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Incorrect PIN'),
                    content: const Text('Please try agian'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK')),
                    ],
                  );
                });
            _input = "";
          }
        },
        borderRadius: BorderRadius.circular(HomePage._size / 2),
        child: Container(
          decoration: (num == -1)
              ? null
              : BoxDecoration(
                  border: Border.all(width: 2.0),
                  shape: BoxShape.circle,
                ),
          alignment: Alignment.center,
          width: HomePage._size,
          height: HomePage._size,
          child: (num == -1) ? Icon(Icons.backspace_outlined) : Text("$num"),
        ),
      ),
    );
  }


}
