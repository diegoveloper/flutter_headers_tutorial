import 'package:flutter/material.dart';
import 'package:headers_tutorial/samples/my_appbar.dart';
import 'package:headers_tutorial/samples/my_challenge.dart';
import 'package:headers_tutorial/samples/my_custom_sliver_appbar.dart';
import 'package:headers_tutorial/samples/my_customappbar.dart';
import 'package:headers_tutorial/samples/my_sliver_appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'AppBar & SliverAppBar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const MyAppBar(),
                  ),
                );
              },
              child: const Text('My AppBar'),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const MyCustomAppBar(),
                  ),
                );
              },
              child: const Text('My Custom AppBar'),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const MySliverAppBar(),
                  ),
                );
              },
              child: const Text('My SliverAppBar'),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const MyCustomSliverAppBar(),
                  ),
                );
              },
              child: const Text('My Custom SliverAppBar'),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const MyAppBarChallenge(),
                  ),
                );
              },
              child: const Text('My AppBar Challenge'),
            ),
          ],
        ),
      ),
    );
  }
}
