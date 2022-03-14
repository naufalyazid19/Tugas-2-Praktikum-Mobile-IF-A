import 'package:flutter/material.dart';

import 'about_page.dart';
import 'login_page.dart';

class MainPage extends StatefulWidget{
  final String username;
  const MainPage({Key? key, required this.username}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.description, color: Colors.white), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AboutPage(username: widget.username);
            }));
          },),
          IconButton(icon: new Icon(Icons.logout, color: Colors.white), onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), (route) => false,
            );
          },),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Selamat Datang ${widget.username}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              "\nTekan tombol \"+\" untuk mulai menghitung\n",
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}