import 'package:flutter/material.dart';

class LoginDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Login'),
          )
        ],
      ),
    );
  }
}
