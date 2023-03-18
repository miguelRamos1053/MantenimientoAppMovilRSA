import 'dart:io';

import 'package:estampados_app/services/select_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? image_to_upload;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Column(
          children: [
            image_to_upload != null
                ? Image.file(image_to_upload!)
                : Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: double.infinity,
                    color: Colors.red),
            ElevatedButton(
                onPressed: () async {
                  final image = await getImage();
                  setState(() {
                    image_to_upload = File(image!.path);
                  });
                },
                child: const Text("Seleccionar imagen")),
            ElevatedButton(onPressed: () {}, child: const Text("Subir imagen"))
          ],
        ));
  }
}
