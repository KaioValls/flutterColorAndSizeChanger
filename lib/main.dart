import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double sizeIcon = 300;
  double red =0;
  double green =0;
  double blue =0;

  int redText =0;
  int greenText =0;
  int blueText =0;

  void addRed(value){
    setState(() {
      red = value;
      redText = red.toInt();
    });
  }

  void addGreen(value){
    setState(() {
      green = value;
      greenText = green.toInt();
    });
  }

  void addBlue(value){
    setState(() {
      blue = value;
      blueText = blue.toInt();
    });
  }

  double validateSize(double size){
    if(size < 50 ){
      return size = 50;
    }else if(size >500){
      return size = 500;
    }
    return size;
  } 

  void decrement(){
    sizeIcon -=50;
    setState(() {
      sizeIcon = validateSize(sizeIcon);
    });
  }
  void increment(){
    sizeIcon +=50;
    setState(() {
      sizeIcon = validateSize(sizeIcon);
    });
  }

  void sizeS(){
    setState(() {
      sizeIcon = 50;
    });
  }

  void sizeM(){
    setState(() {
      sizeIcon = 300;
    });
  }

  void sizeL(){
    setState(() {
      sizeIcon = 500;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter State'),
          actions: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: decrement,
            ),
            IconButton(
              icon: const Text('S'),
              onPressed: sizeS,
            ),
            IconButton(
              icon: const Text('M'),
              onPressed: sizeM,
            ),
            IconButton(
              icon: const Text('L'),
              onPressed: sizeL,
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: increment,
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Icon(
                  Icons.lock_clock,
                  size: sizeIcon,
                  color: Color.fromRGBO(red.toInt() , green.toInt() , blue.toInt(), 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Slider(
                      activeColor: Colors.red,
                      value: red,
                      min: 0,
                      max: 255,
                      onChanged: (value) {
                          addRed(value);
                      },
                    ),
                  ),
                  Text(
                    '$redText',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Slider(
                      activeColor: Colors.green,
                      value: green,
                      min: 0,
                      max: 255,
                      onChanged: (value) {
                        addGreen(value);
                      },
                    ),
                  ),
                  Text(
                    '$greenText',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Slider(
                      activeColor: Colors.blue,
                      value: blue,
                      min: 0,
                      max: 255,
                      onChanged: (value) {
                        addBlue(value);
                      },
                    ),
                  ),
                  Text(
                    '$blueText',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}