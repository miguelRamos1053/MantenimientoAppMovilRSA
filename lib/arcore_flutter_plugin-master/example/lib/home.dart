import 'screens/augmented_images.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArCore Demo'),
        //surfaceTintColor: Colors.deepOrange,
        //foregroundColor: Colors.amber,
        //backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AugmentedPage()));
            },
            title: const Text('AugmentedPage'),
          )
        ],
      ),
    );
  }
}
