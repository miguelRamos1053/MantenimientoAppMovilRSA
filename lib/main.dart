import 'package:flutter/material.dart';
import 'package:estampados_app/Provider/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:estampados_app/Screens/product_list.dart';
import 'home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'GeeksforGeeks',
          theme: ThemeData(primarySwatch: Colors.blue),
          darkTheme: ThemeData(primarySwatch: Colors.grey),
          color: Colors.amberAccent,
          supportedLocales: {const Locale('en', ' ')},
          debugShowCheckedModeBanner: false,
          home: const ProductList(),
          // home: Scaffold(appBar: AppBar(title: const Text('GeeksforGeeks')))
          // title: 'Flutter Demo',
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          // ),
          // home: const ProductList(),
        );
      }),
    );
  }
}
