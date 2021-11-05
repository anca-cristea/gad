
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home : HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? errorText;
  final TextEditingController controller = new TextEditingController();
  double? number = 0;
  double convers = 4.50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,
      title: Text("Currency convertor"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network('https://cdn.thetealmango.com/wp-content/uploads/2021/08/top-currencies-new.png',
             alignment: Alignment.center,
             matchTextDirection: false,
           ),
          Container(
            margin : EdgeInsetsDirectional.only(
                start: 16.0,
                end: 16.0,
            ),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText : "Suma de conversie in RON",
                hintText: "valoarea",
                errorText: errorText,
                suffix: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    controller.clear();
                  },
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<double>(
                hint: Text("Alege valuta"),
                value: convers,
                onChanged: (double? value) {
                  setState(() {
                    convers = value!;
                  });
                },
                items: <DropdownMenuItem<double>>[
                  DropdownMenuItem<double>(
                    value: 4.50,
                    child: Text('Euro'),
                  ),
                  DropdownMenuItem<double>(
                    value: 4.29,
                    child: Text('Dolar'),
                  ),
                  DropdownMenuItem<double>(
                    value: 5.78,
                    child: Text('Lira'),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    number = double.tryParse(controller.text);
                    if(number == null)
                      errorText = "Nu este numar";
                    else {
                      number = number! * convers;
                      errorText = null;
                    }
                  });
                },
                child: Text('Convert',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: Text("Suma in lei este ${number?.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

