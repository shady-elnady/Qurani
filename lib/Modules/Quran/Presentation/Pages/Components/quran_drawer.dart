import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../App/Assets/icons_path.dart';

class QuranDrawer extends StatelessWidget {
  const QuranDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Image.asset(
                  IconsPath.quran,
                  height: 80,
                ),
                const Text(
                  'Al Quran',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text(
              'Settings',
            ),
            // onTap: () {
            //   Navigator.pop(context);
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => const Settings()));
            // },
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
            ),
            title: const Text(
              'Share',
            ),
            onTap: () {
              Share.share('''*Quran app*\n
u can develop it from my github github.com/itsherifahmed ''');
              Navigator.pop(context);
            },
          ),
          const ListTile(
            leading: Icon(
              Icons.rate_review,
            ),
            title: Text(
              'Rate',
            ),
            // onTap: () async {
            //   if (!await launchUrl(quranAppurl,
            //       mode: LaunchMode.externalApplication)) {
            //     throw 'Could not launch $quranAppurl';
            //   }
            // },
          ),
        ],
      ),
    );
  }
}
