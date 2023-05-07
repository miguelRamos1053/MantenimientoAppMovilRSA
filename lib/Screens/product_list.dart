import 'package:estampados_app/Screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:estampados_app/Model/Cart_model.dart';
import 'package:estampados_app/Model/item_model.dart';
import 'package:estampados_app/dataBase/bd_helper.dart';
import 'package:estampados_app/Provider/cart_provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:estampados_app/arcore_flutter_plugin-master/example/lib/screens/augmented_images.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  DBHelper dbHerper = DBHelper();

  List<Item> products = [
    Item(
        name: 'Camiseta Negra',
        unit: 'Kg',
        price: 50000,
        image: 'assets/images/camisetaAkat.png'),
    Item(
        name: 'Camiseta Blanca',
        unit: 'Kg',
        price: 60000,
        image: 'assets/images/camisetaGato.png'),
    Item(
        name: 'Camiseta Blanca',
        unit: 'Doz',
        price: 40000,
        image: 'assets/images/camisetaGatoCorazones.png'),
    Item(
        name: 'Camiseta Blanca',
        unit: 'Kg',
        price: 100000,
        image: 'assets/images/camisetaNaruto.png'),
    Item(
        name: 'Camiseta Negra',
        unit: 'Kg',
        price: 75000,
        image: 'assets/images/camisetaNegraEstrella.png'),
    Item(
        name: 'Termos',
        unit: 'Kg',
        price: 70000,
        image: 'assets/images/termos.png'),
    Item(
        name: 'Termos Pareja',
        unit: 'Kg',
        price: 90000,
        image: 'assets/images/termosPareja.png'),
    Item(
        name: 'Chaqueta',
        unit: 'Kg',
        price: 180000,
        image: 'assets/images/chaquetaMi.png'),
    Item(
        name: 'Chaqueta',
        unit: 'Kg',
        price: 185000,
        image: 'assets/images/chaquetaCal.png'),
    Item(
        name: 'Chaqueta',
        unit: 'Kg',
        price: 120000,
        image: 'assets/images/chaquetaFlores.png'),
    Item(
        name: 'Chaqueta',
        unit: 'Kg',
        price: 190000,
        image: 'assets/images/chaquetaGat.png'),
    Item(
        name: 'Pocillo',
        unit: 'Kg',
        price: 20000,
        image: 'assets/images/pocilloHotel.png'),
    Item(
        name: 'Pocillo',
        unit: 'Kg',
        price: 19000,
        image: 'assets/images/pocilloMaestro.png'),
    Item(
        name: 'Pocillo',
        unit: 'Kg',
        price: 15000,
        image: 'assets/images/pocilloLove.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    void savedData(int index) {
      dbHerper
          .insert(
        Cart(
            id: index,
            productId: index.toString(),
            productName: products[index].name,
            initialPrice: products[index].price,
            productPrice: products[index].price,
            quantity: ValueNotifier(1),
            unitTag: products[index].unit,
            image: products[index].image),
      )
          .then((value) {
        cart.addTotalPrice(products[index].price.toDouble());
        cart.addCounter();
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lista de Productos'),
        leading: IconButton(
          icon: Icon(Icons.remove_red_eye_outlined),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AugmentedPage()));
          },
        ),
        actions: [
          badges.Badge(
            badgeContent: Consumer<CartProvider>(
              builder: (context, value, child) {
                return Text(
                  value.getCounter().toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                );
              },
            ),
            position: BadgePosition.topEnd(top: -3, end: -12),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blueGrey.shade100,
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image(
                    height: 80,
                    width: 80,
                    image: AssetImage(products[index].image.toString()),
                  ),
                  SizedBox(
                    width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 5),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          text: TextSpan(
                              // text: 'Name: ',
                              style: TextStyle(
                                  color: Colors.blueGrey.shade700,
                                  fontSize: 16.0),
                              children: [
                                TextSpan(
                                    text:
                                        '${products[index].name.toString()}\n',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        // RichText(
                        //   maxLines: 1,
                        //   text: TextSpan(
                        //       text: 'Unit: ',
                        //       style: TextStyle(
                        //           color: Colors.blueGrey.shade800,
                        //           fontSize: 16.0),
                        //       children: [
                        //         TextSpan(
                        //             text:
                        //                 '${products[index].unit.toString()}\n',
                        //             style: const TextStyle(
                        //                 fontWeight: FontWeight.bold)),
                        //       ]),
                        // ),
                        RichText(
                          maxLines: 1,
                          text: TextSpan(
                              // text: 'Price: ' r"$",
                              text: r'$',
                              style: TextStyle(
                                  color: Colors.blueGrey.shade800,
                                  fontSize: 16.0),
                              children: [
                                TextSpan(
                                    text:
                                        '${products[index].price.toString()}\n',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey.shade800),
                    onPressed: () {
                      savedData(index);
                    },
                    child: const Text('Añadir al Carrito'),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
