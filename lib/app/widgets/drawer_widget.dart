import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Menu 1'),
            onTap: () {
              // Action ketika menu 1 ditekan
            },
          ),
          ListTile(
            title: const Text('Menu 2'),
            onTap: () {
              // Action ketika menu 2 ditekan
            },
          ),
        ],
      ),
    );
  }
}
