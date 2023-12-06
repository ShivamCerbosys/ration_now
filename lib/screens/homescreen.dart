import 'package:flutter/material.dart';
import 'package:ration_now/widgets/drawer_widget.dart'; // Custom drawer widget import.

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key}); // Constructor with optional key.

  @override
  State<HomeScreen> createState() => _HomeScreenState(); // State creation.
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Main build method for the HomeScreen.
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        
        // AppBar configuration.
        leading: Builder(
          // Builder used to provide context for Scaffold.of.
          builder: (BuildContext context) {
            return IconButton(
              // Menu icon button to open the drawer.
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
              // Opens the drawer.
            );
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/rashanow2.png', // Logo or image asset.
              height: 25, // Image height.
            ),
            const Text(
              'addresssss......', // Additional text, possibly an address.
              style:
                  TextStyle(fontSize: 14, color: Colors.grey), // Text styling.
            )
          ],
        ),
        actions: [
          // Action buttons on the AppBar.
          IconButton(
            onPressed: () {}, // Placeholder callback for location button.
            icon: const Icon(Icons.my_location_outlined),
          ),
          IconButton(
            onPressed: () {}, // Placeholder callback for notifications button.
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {}, // Placeholder callback for search button.
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          // padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for products, brands',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    // borderRadius: BorderRadius.only(
                    //   bottomLeft: Radius.circular(10),
                    //   topLeft: Radius.circular(10),
                    // ),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white, // White background for the TextField
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 48,
                      12), // Adjust padding to make space for the mic button
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right:
                        0), // Slight margin to align the button inside the TextField
                decoration: BoxDecoration(
                  color:
                      Colors.grey[200], // Slight grey background for mic button
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: () {
                    // Implement microphone action
                  },
                ),
              ),
            ],
          ),
        ) // Drawer widget defined in a separate file.
      ]),
    );
  }
}
