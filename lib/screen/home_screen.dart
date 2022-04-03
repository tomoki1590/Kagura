import 'package:flutter/material.dart';
import 'package:sliver_appbar/screen/homeScreenkind/kagura_tab.dart';
import 'package:sliver_appbar/screen/homeScreenkind/serch_tab.dart';
import 'package:sliver_appbar/screen/kagura_add.dart';

import 'homeScreenkind/account_tab.dart';
import 'homeScreenkind/chat/chat_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indexList = 0;
  static final List tab = [
    const KaguraTab(),
    KaguraAdd(),
    const SearchTab(),
    const ChatTab(['name']),
    const AccountTab()
  ];

  void _tappedList(int index) {
    setState(() {
      _indexList = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tab[_indexList],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _tappedList,
          currentIndex: _indexList,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "ホーム"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "追加"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded), label: "検索"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "チャット"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: "アカウント"),
          ],
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
        ),
      ),
    );
  }
}
