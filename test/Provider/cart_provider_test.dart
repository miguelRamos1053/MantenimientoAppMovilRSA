import 'package:flutter_test/flutter_test.dart';
import 'package:estampados_app/Provider/cart_provider.dart';

void main() {
  testWidgets('El contador debe ser incrementado', (tester) async {
    final cartProvider = CartProvider();

    cartProvider.addCounter();

    expect(cartProvider.counter, 1);
  });
  testWidgets('El contador debe ser disminuido', (tester) async {
    final cartProvider = CartProvider();

    cartProvider.removeCounter();

    expect(cartProvider.counter, -1);
  });

  testWidgets('El totalPrice debe aumentar en 1000',
      (tester) async {
    final cartProvider = CartProvider();

    cartProvider.addTotalPrice(1000);

    expect(cartProvider.totalPrice, 1000);
  });

  testWidgets('El totalPrice debe disminuir en 1000',
      (tester) async {
    final cartProvider = CartProvider();

    cartProvider.removeTotalPrice(1000);

    expect(cartProvider.totalPrice, -1000);
  });
}
