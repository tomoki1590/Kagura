import 'package:flutter/material.dart';
import 'package:sliver_appbar/screen/account/login.dart';
import 'package:sliver_appbar/utils/account.dart';
import 'package:sliver_appbar/utils/auth.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  Account myAccountPage = Authentication.myAccount!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.brown,
              height: 200,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        foregroundImage: NetworkImage(myAccountPage.imagePath),
                      ),
                      Text('名前:'),
                      Text(myAccountPage.name),
                    ],
                  ),
                  Row(
                    children: [Text('所属神楽団:'), Text(myAccountPage.kaguraGroup)],
                  ),
                ],
              ),
            ),
            const ListTile(
              title: Text(""),
            ),
            const ListTile(
              title: Text("data"),
            ),
            ElevatedButton(
                child: const Text("退会"),
                onPressed: () {
                  Authentication.logOut();
                  Navigator.pushReplacement(context,
                      (MaterialPageRoute(builder: (context) => Login())));
                }),
          ],
        ),
      ),
    );
  }
}
