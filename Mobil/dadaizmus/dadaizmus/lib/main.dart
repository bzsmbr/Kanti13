import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dadaizmus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Dadaizmus '),
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('CSENDESEN ALSZIK',
            
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            const Text('áprilisi dadaista álmok',
            
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: const Text('''
                Csendesen alszik a táj a csősz
                egyedül csüngök egy reccsenő faágon
                ha végtelen hegynek mész hát légy erős
                mindenáron
                mert te alattam leszel ha ott hörgök fenn...
              ''',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15,),
                ),
            ),
          ],
        ),
      )
    );
  }
}
