import 'package:flutter/material.dart';

class DailyWaterDrawer extends StatelessWidget {
  const DailyWaterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Text(
              'Daily Water',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          ListTile(
            title: const Text("Home"),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          const Divider(height: 1),
          ListTile(
            title: const Text("App Theme"),
            onTap: () {
              Navigator.pushNamed(context, '/theme');
            },
          ),
          const Divider(height: 1),
          ListTile(
            title: const Text("Settings"),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          const Divider(height: 1)
        ],
      ),
    );
  }
}
