import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:webviewflutter/Webapge4.dart';
import 'package:webviewflutter/Webpage3.dart';
import 'package:webviewflutter/Wepage2.dart';
import 'package:webviewflutter/webpage.dart';

import 'Webpage5.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  int _counter = 0;
  List<Widget> mypage=[
    WebPage('https://maroismasso.com/staff-news'),
    WebPage2('https://maroismasso.com/achats/solde-staff'),
    WebPage3('https://maroismasso.com/wp-admin/admin.php?page=latepoint'),
    WebPage4('https://maroismasso.com/staff-connexion/'),
    WebPage5('https://maroismasso.com/questions/sujet/staff/'),


  ];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Maroismasso"))),
      body: mypage[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.list_alt_outlined),
          title: Text('News'),
          activeColor: Colors.blue,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.card_giftcard),
          title: Text('Gift Cards'),
          activeColor: Colors.blue,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          title: Text('Calendar'),
          activeColor: Colors.blue,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.note_add_outlined),
          title: Text(
            'Docs',
          ),
          activeColor: Colors.blue,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.question_answer_outlined),
          title: Text('FAQ\'s'),
          activeColor: Colors.blue,
          textAlign: TextAlign.center,
        ),
      ],
    ),
    );
  }
}
