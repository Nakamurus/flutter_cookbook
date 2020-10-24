import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    initialRoute: RouteNames.first,
    routes: {
      RouteNames.first: (context) => FirstRoute(),
      RouteNames.second: (context) => SecondRoute(),
      RouteNames.third: (context) => ThirdRoute(),
    },
  ));
}

class RouteNames {
  static const String first = '/';
  static const String second = '/second';
  static const String third = '/third';
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute())
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Route'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.first);
              },
              child: Text('Go back!'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.third);
              },
              child: Text('Go to third!'))
          ],
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Route')
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go to home!'),
        ),
      ),
    );
  }
}