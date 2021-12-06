import 'package:flutter/material.dart';
import 'package:sliver_appbar/kagura_tab.dart';
import 'package:sliver_appbar/serch_tab.dart';

import 'account_tab.dart';
import 'chat_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indexList = 0;
  static final List tab = [
    const KaguraTab(),
    const SerchTab(),
    const ChatTab(),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded), label: "検索"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "チャット"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: "アカウント"),
          ],
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
        ),
        /*CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blueAccent.withOpacity(0.3),
              floating: true,
              pinned: true,
              snap: false,
              expandedHeight: 180,
              toolbarHeight: 60,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text("geihoku"),
                  background: Container(
                    width: double.infinity,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 10.0,
                        maxWidth: 50.0,
                      ),
                      child: Image.network(
                        'https://www.hiroshima-kankou.com/image/rendering/feature_paragraph_image/865/trim.1180/2/1?v=b62e6b2d9231e0c0772d84271de5ce02441a8b22',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
            ),
          ],
        ),*/
      ),
    );
  }
}
