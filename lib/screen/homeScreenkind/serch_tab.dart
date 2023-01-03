import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("検索"),
        ),
        body: Center(
          child: Column(
            children: [
               const SizedBox(
                 width: 300,
                 child: TextField(
                   decoration: InputDecoration(hintText:'検索'),
                 ),
               ),
               ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.search), label: const Text('検索'))
            ],
          ),
        ));
  }
}
