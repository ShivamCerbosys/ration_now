import 'package:flutter/material.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(31),
      height: 350,
      width: double.maxFinite,
      child: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://offers.getsimpl.com/wp-content/uploads/2023/06/ZomatodelLP.jpeg',
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text: "New"
                const Text(
                  'New',
                  style: TextStyle(
                    fontSize: 42,
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Get 35% off',
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: MaterialButton(
                    onPressed: () {
                      // Handle button click
                    },
                    color: Colors.transparent,
                    splashColor: Colors.white.withOpacity(0.9),
                    child: const Text(
                      'ADD PROMO',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.yellowAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
