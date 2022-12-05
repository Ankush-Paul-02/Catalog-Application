import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://scontent.fccu3-1.fna.fbcdn.net/v/t39.30808-6/280691432_170176138781953_6070110550444192038_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=j1VNBB6ttmQAX8sqcJv&_nc_ht=scontent.fccu3-1.fna&oh=00_AfDmMaL0DlWBrX6jCKZFAPRfuJdoagc8GCBVAfpuh5MG7Q&oe=636A4756";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                ),
                accountName: const Text(
                  "Ankush Paul",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                accountEmail: const Text(
                  "flutterwithankush@gmail.com",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                // currentAccountPicture: Image.network(imageUrl),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Product",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email me",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
