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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 150,
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        foregroundImage: NetworkImage(
                          "https://pbs.twimg.com/media/Dt5OowNU0AAznML?format=jpg&name=large",
                        ),
                      ),
                      Column(
                        children: [Text("username"), Text("userId")],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const ListTile(
              title: Text("kagura"),
            ),
            const ListTile(
              title: Text("退会"),
              onTap: null,
            ),
            const ListTile(
              title: Text("所属神楽団"),
            ),
            const ListTile(
              title: Text("data"),
            )
          ],
        ),
      ),
    );
  }
}
