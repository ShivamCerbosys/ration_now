import 'package:flutter/material.dart';
import 'package:ration_now/utils/utils.dart';
import 'package:ration_now/widgets/listtile_widget.dart'; // Import custom ListTile widget.

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // The Drawer widget provides a slide-in menu.
      child: ListView(
        // ListView to hold all the items in the drawer.
        children: <Widget>[
          Padding(
            // Padding for the top section of the drawer.
            padding: const EdgeInsets.all(16.0),
            child: Row(
              // Row to layout images horizontally.
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/rashannow.png', // First image/logo.
                  height: 40,
                  width: 40,
                ),
                Image.asset(
                  'assets/images/rashanow2.png', // Second image/logo.
                  height: 40,
                  width: 150,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10, // Spacing between top images and next item.
          ),
          Padding(
            // Padding for the user name ListTile.
            padding: EdgeInsets.zero,
            child: ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              leading: const Text(
                'Kristen Stewert', // User name display.
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context); // Closes the drawer on tap.
              },
            ),
          ),
          ListTile(
            // ListTile for displaying user contact number.
            visualDensity: const VisualDensity(vertical: -4),
            leading: const Text(
              '888-444-6009', // User contact display.
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.pop(context); // Closes the drawer on tap.
            },
          ),
          // Custom ListTile widgets for various drawer options.
          const ListTileWidget(
            icon: Icons.home,
            title: AppLabels.homeText,
          ),
          const ListTileWidget(
            icon: Icons.shopping_cart,
            title: AppLabels.orderText,
          ),
          const ListTileWidget(
            icon: Icons.location_on,
            title: AppLabels.addressText,
          ),
          const ListTileWidget(
            icon: Icons.settings,
            title: AppLabels.settingText,
          ),
          const ListTileWidget(
            icon: Icons.share,
            title: AppLabels.shareText,
          ),
          const ListTileWidget(
            icon: Icons.info,
            title: AppLabels.aboutText,
          ),
          const ListTileWidget(
            icon: Icons.power_settings_new_outlined,
            title: AppLabels.logoutText,
          ),
          const Divider(
            // Divider to visually separate content sections.
            height: 3,
            color: AppColors.neutralBlack,
          ),
          const ListTile(
            // ListTile for the 'Language' label.
            visualDensity: VisualDensity(vertical: -4),
            title: Text(
              AppLabels.languageText, // Language display.
              style: TextStyle(color: AppColors.neutralGrey, fontSize: 18),
            ),
          ),
          const ListTileWidget(
            icon: Icons.g_translate,
            title: AppLabels.hindiText,
          ), // ListTile for language selection.
        ],
      ),
    );
  }
}
