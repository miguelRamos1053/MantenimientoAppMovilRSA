
import 'package:flutter/material.dart';
import 'package:estampados_app/Model/item_model.dart';





class DataRepository {
 late BuildContext? context;

  DataRepository( {context});
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

 get getProducts {
  return products;
 }

}