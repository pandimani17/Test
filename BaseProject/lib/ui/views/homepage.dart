import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/localization/localisation.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      home: MyHomePage(
          title: DemoLocalizations.of(context).getText('headerTitle')),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {}
}
