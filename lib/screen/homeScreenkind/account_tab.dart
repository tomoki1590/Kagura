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
              color: Colors.white,
              height: 200,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        foregroundImage: NetworkImage(myAccountPage.imagePath),
                      ),
                    ],
                  ),
                  SizedBox(
                      width: 200, height: 50, child: Text(myAccountPage.name)),
                ],
              ),
            ),
            const ListTile(
              title: Text("所属神楽団"),
            ),
            const ListTile(
              title: Text("data"),
            ),
            ElevatedButton(
                child: Text("退会"),
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
