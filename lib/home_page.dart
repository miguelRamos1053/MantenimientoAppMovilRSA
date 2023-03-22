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
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: 80,
                  width: 250,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
                      color:
                          Color.fromARGB(255, 177, 201, 235).withOpacity(0.6)),
                ),
              ]),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("lib/assets/nequi.png"),
                      radius: 50,
                    ),
                    SizedBox(width: 20),
                    CircleAvatar(
                      backgroundImage: AssetImage("lib/assets/daviplata.png"),
                      radius: 50,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                height: 280,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "¿Cómo pagar?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Realiza la consignación al número que se muestra abajo.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        height: 80,
                        width: 250,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "(318) 967 2312",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            color: Color.fromARGB(255, 177, 201, 235)
                                .withOpacity(0.6),
                            margin: EdgeInsets.only(top: 30)),
                      ),
                    ]),
                    SizedBox(height: 20),
                    Text(
                      "Tómale foto al comprobante y súbelo",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final image = await getImage();
                  setState(() {
                    image_to_upload = File(image!.path);
                  });
                },
                child: const Text(
                  "Cargar comprobante",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 88, 255, 91),
                  onPrimary: Colors.black,
                  minimumSize: Size(double.infinity,
                      50), // Establecer el ancho del botón en toda la pantalla y la altura en 50 píxeles
                ),
              ),
              image_to_upload != null
                  ? Image.file(image_to_upload!)
                  : Container(
                      margin: EdgeInsets.all(10),
                      height: 200,
                      width: double.infinity,
                      color: Colors.red),
            ],
          ),
        )),
        backgroundColor: Colors.lightBlue);
  }
}
