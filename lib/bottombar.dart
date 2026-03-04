import 'package:flutter/material.dart';
import 'package:imtihon2/home_screen.dart';
import 'package:imtihon2/inbox.dart';
import 'package:imtihon2/me.dart';
import 'package:imtihon2/play_screen.dart';
import 'package:imtihon2/taver.dart';

class saloooooom extends StatefulWidget {
  const saloooooom({super.key});

  @override
  State<saloooooom> createState() => _saloooooomState();
}
class _saloooooomState extends State<saloooooom> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    PlayScreen(),
    Inbox(),
    Taver(),
    Me(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.games_outlined, size: 35),
            label: "Games",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline_outlined, size: 35),
            label: "Play",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gif, size: 35),
            label: "GIF",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rice_bowl, size: 35),
            label: "Tavern",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, size: 35),
            label: "Me",
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(color: Colors.white),
        onTap: _onItemTapped,
      ),
    );
  }
}
