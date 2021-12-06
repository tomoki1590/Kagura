import 'package:flutter/material.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("youserName"),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text("kagura"),
          ),
          ListTile(
            title: Text("退会"),
            onTap: null,
          ),
          ListTile(
            title: Text("所属神楽団"),
          ),
          ListTile(
            title: Text("data"),
          )
        ],
      ),
    );
  }
}
