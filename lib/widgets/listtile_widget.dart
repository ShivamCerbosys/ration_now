import 'package:flutter/material.dart';
import 'package:ration_now/utils/utils.dart';

// Custom ListTile widget.
class ListTileWidget extends StatelessWidget {
  // Constructor with required icon and title parameters.
  const ListTileWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  // IconData and String for icon and title.
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    // Building a ListTile with custom visual density, icon, and title.
    return ListTile(
      visualDensity:
          const VisualDensity(vertical: -2.5), // Sets the visual density.
      leading: Icon(
        icon,
        color: AppColors.primaryRed,
      ), // Leading icon with color.
      title: Text(
        title,
        style: const TextStyle(color: AppColors.primaryGreen),
      ), // Text title with style.
      onTap: () {
        Navigator.pop(context); // Navigates back on tap.
      },
    );
  }
}
