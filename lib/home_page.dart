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
          leading: new IconButton(
              onPressed: () {
                image_to_upload = null;
                setState(() {});
              },
              icon: new Icon(Icons.arrow_back_ios_new, color: Colors.black)),
          backgroundColor: Colors.lightBlue,
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: Container(
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: 60,
                    width: 250,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\$ 255.300",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        color: Color.fromARGB(255, 177, 201, 235)
                            .withOpacity(0.6)),
                  ),
                ]),
                image_to_upload != null
                    ? Flexible(flex: 1, child: Image.file(image_to_upload!))
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
                    child: const Text("Cargar comprobante")),
              ],
            ),
            color: Colors.lightBlue));
  }
}
