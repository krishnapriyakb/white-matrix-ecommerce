import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:white_matrix_ecommerce/utils/widgets/logout_alert.dart';
import 'package:white_matrix_ecommerce/utils/widgets/test_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Hero(
                  tag: 'userImage',
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      'assets/images/user.png',
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome,',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Samuel L Jackson',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'UID1232',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListTileButton(
              text: 'Edit Profile',
              icon: Icons.edit,
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const Testpage1(),
                  ),
                );
              },
            ),
            ListTileButton(
              text: 'Manage Address',
              icon: Icons.house_rounded,
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const Testpage1(),
                  ),
                );
              },
            ),
            ListTileButton(
              text: 'Change Password',
              icon: Icons.password,
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const Testpage1(),
                  ),
                );
              },
            ),
            ListTileButton(
              text: 'My Orders',
              icon: Icons.shopping_bag_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const Testpage1(),
                  ),
                );
              },
            ),
            ListTileButton(
              text: 'Payment History',
              icon: Icons.payment,
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const Testpage1(),
                  ),
                );
              },
            ),
            ListTileButton(
              text: 'Help',
              icon: Icons.help,
              onTap: () {},
            ),
            ListTileButton(
              text: 'Faq',
              icon: Icons.question_mark_outlined,
              onTap: () {},
            ),
            ListTileButton(
              text: 'Logout',
              icon: Icons.logout,
              onTap: () {
                showDialog(
                  barrierColor: Colors.black.withOpacity(0.8),
                  context: context,
                  builder: (context) => const LogoutAlert(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final Function onTap;

  const ListTileButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  State<ListTileButton> createState() => _ListTileButtonState();
}

class _ListTileButtonState extends State<ListTileButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () {
          widget.onTap();
        },
        dense: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        tileColor: Colors.grey.shade900,
        title: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        trailing: Icon(
          widget.icon,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
