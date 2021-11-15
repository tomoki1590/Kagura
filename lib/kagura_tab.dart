import 'package:flutter/material.dart';

class KaguraTab extends StatefulWidget {
  const KaguraTab({Key? key}) : super(key: key);

  @override
  State<KaguraTab> createState() => _KaguraTabState();
}

class _KaguraTabState extends State<KaguraTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KAGURAPAGE"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Card(
              elevation: 4,
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  _kaguragroupe(),
                  _kaguraimage(),
                  _titleimage(),
                  _textimage(),
                ],
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  _kaguragroupe(),
                  _kaguraimage(),
                  _titleimage(),
                  _textimage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _kaguraimage() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Image.network(
            "https://pbs.twimg.com/media/Dt5OowNU0AAznML?format=jpg&name=large",
            width: 300,
            height: 300,
          ),
          Image.network(
            "https://pbs.twimg.com/media/DhO-r07U8AEMv8W.jpg",
            width: 300,
            height: 300,
          )
        ],
      ),
    );
  }

  Widget _titleimage() {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text(""),
              )
            ],
          )),
        ],
      ),
    );
  }

  Widget _textimage() {
    return Container(
      child: Column(
        children: [Text(" 神楽団紹介文")],
      ),
    );
  }

  Widget _kaguragroupe() {
    return Text("神楽団名");
  }
}
// Container(
// child: Column(
// children: [
// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: [
// Image.network(
// "https://pbs.twimg.com/media/Dt5OowNU0AAznML?format=jpg&name=large",
// width: 300,
// height: 300,
// ),
// Image.network(
// "https://pbs.twimg.com/media/DhO-r07U8AEMv8W.jpg",
// width: 300,
// height: 300,
// )
// ],
// ),
// ),
// Column(
// children: [Text("神楽団名")],
// )
// ],
// ),
// ),
