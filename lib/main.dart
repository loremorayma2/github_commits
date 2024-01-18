import 'package:flutter/material.dart';
import 'package:github_commits/UI/pages/commits.dart';
import 'package:github_commits/UI/pages/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageTransition(), 
    );
  }
}

class HomePageTransition extends StatefulWidget {
  @override
  _HomePageTransitionState createState() => _HomePageTransitionState();
}

class _HomePageTransitionState extends State<HomePageTransition> {
  @override
  void initState() {
    super.initState();
    _navigateToCommitsPageAfterDelay();
  }

  void _navigateToCommitsPageAfterDelay() async {
    await Future.delayed(Duration(seconds: 1)); 
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => CommitsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WelcomePage(); 
  }
}
