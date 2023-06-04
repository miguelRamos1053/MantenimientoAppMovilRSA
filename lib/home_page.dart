import 'dart:io';

import 'services/select_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imageToUpload;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                imageToUpload = null;
                setState(() {});
              },
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 80,
                width: 250,
                child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    color: const Color.fromARGB(255, 177, 201, 235)
                        .withOpacity(0.6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '\$ 255.300',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ),
            ]),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage('lib/assets/nequi.png'),
                    radius: 50,
                  ),
                  SizedBox(width: 20),
                  CircleAvatar(
                    backgroundImage: AssetImage('lib/assets/daviplata.png'),
                    radius: 50,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 280,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '¿Cómo pagar?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Realiza la consignación al número que se muestra abajo.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                      height: 80,
                      width: 250,
                      child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          color: const Color.fromARGB(255, 177, 201, 235)
                              .withOpacity(0.6),
                          margin: const EdgeInsets.only(top: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '(318) 967 2312',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ),
                  ]),
                  const SizedBox(height: 20),
                  const Text(
                    'Tómale foto al comprobante y súbelo',
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
                  imageToUpload = File(image!.path);
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: const Color.fromARGB(255, 88, 255, 91),
                minimumSize: const Size(double.infinity,
                    50), // Establecer el ancho del botón en toda la pantalla y la altura en 50 píxeles
              ),
              child: const Text(
                'Cargar comprobante',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            imageToUpload != null
                ? Image.file(imageToUpload!)
                : Container(
                    margin: const EdgeInsets.all(10),
                    height: 200,
                    width: double.infinity,
                    color: Colors.red),
          ],
        )),
        backgroundColor: Colors.lightBlue);
  }
}
