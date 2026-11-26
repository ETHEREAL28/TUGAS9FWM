import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tugaspertemuan9/main.dart';
import 'package:tugaspertemuan9/models/cart_model.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CartModel(),
        child: const MyApp(),
      ),
    );
    expect(find.text('Produk'), findsWidgets);
  });
}
