import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(250, 129, 18,100)),
      ),
      home: const MyHomePage(title: 'Counter app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 100;
  void _incrementCounter(int  num) {
    setState(() {
      _counter += num;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color.fromRGBO(250, 129, 18, 250),

        title: Text(widget.title),
      ),
      body: Container(
        color: Color.fromRGBO(250, 243, 225, 250),
        child: Center(
        
          child: Column(
        
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Current counter value:',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),),
              Text(
                '$_counter',
                style: const TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold
                ),
              ),
        
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () => _incrementCounter(-1), 
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(24),
                      backgroundColor: Color.fromRGBO(250, 129, 18,100),
                      elevation: 6
                    ),
                  child: const Text('-1', style: TextStyle(fontSize: 18, color: Colors.white),)),
                  SizedBox(width: 20),
                  ElevatedButton(onPressed: () => _incrementCounter(1), 
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(24),
                      backgroundColor: Color.fromRGBO(250, 129, 18,100),
                      elevation: 6
                    ),
                  child: const Text('+1', style: TextStyle(fontSize: 18, color: Colors.white),)),
          ],
          ),
          SizedBox(height: 40,),
          Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () => _incrementCounter(-10), 
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20
                      ),
                      backgroundColor: Color.fromRGBO(250, 243, 225,100),
                      elevation: 6
                    ),
                    
                  child: const Text('-10', style: TextStyle(fontSize: 18, color: Colors.black),)),
                  SizedBox(width: 40),
                  ElevatedButton(onPressed: () => _incrementCounter(10), 
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20
                      ),
                      backgroundColor: Color.fromRGBO(250, 243, 225,100),
                      elevation: 6
                    ),
                  child: const Text('+10', style: TextStyle(fontSize: 18, color: Colors.black),)),
          ],
          ),
            ],
          ),
        ),
      ),
    );
  }
}
