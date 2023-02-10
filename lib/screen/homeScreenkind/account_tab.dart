import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sliver_appbar/screen/account/login.dart';
import 'package:sliver_appbar/screen/homeScreenkind/chat/settign/acccount_setting_page.dart';
import 'package:sliver_appbar/utils/account.dart';
import 'package:sliver_appbar/utils/auth.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  Account? myAccountPage = Authentication.myAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_box),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (builder) => const AccountSettingPage()));
            },
          ),
        ],
      ),
      body: Column(
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
                      foregroundImage: NetworkImage(myAccountPage?.imagePath ??
                          "https://cdns.iconmonstr.com/wp-content/releases/preview/2018/240/iconmonstr-user-male-thin.png"),
                    ),
                    Row(
                      children: [
                        const Text('名前:'),
                        Text(myAccountPage?.name ?? "test"),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('所属神楽団:'),
                    Text(myAccountPage?.kaguraGroup ?? "test")
                  ],
                ),
              ],
            ),
          ),
          const ListTile(
            title: Text("過去の投稿"),
          ),
          ElevatedButton(
              child: const Text("退会"),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    (MaterialPageRoute(builder: (context) => const Login())));
              }),
        ],
      ),
    );
  }
}
