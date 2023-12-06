import 'package:flutter/material.dart';

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
        color: Colors.red[800],
      ), // Leading icon with color.
      title: Text(
        title,
        style: TextStyle(color: Colors.green[800]),
      ), // Text title with style.
      onTap: () {
        Navigator.pop(context); // Navigates back on tap.
      },
    );
  }
}
