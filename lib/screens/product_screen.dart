import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/product.dart';

const List<Product> daftarProduk = [
  Product(id: 1, nama: 'Sepatu Lari', harga: 350000),
  Product(id: 2, nama: 'Kaos Polos', harga: 85000),
  Product(id: 3, nama: 'Celana Jeans', harga: 220000),
  Product(id: 4, nama: 'Topi Baseball', harga: 75000),
  Product(id: 5, nama: 'Tas Ransel', harga: 180000),
];

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk'),
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, _) => Badge(
              label: Text('${cart.jumlahItem}'),
              isLabelVisible: cart.jumlahItem > 0,
              child: const Icon(Icons.shopping_cart),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: daftarProduk.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final product = daftarProduk[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.inventory_2_outlined),
              title: Text(product.nama),
              subtitle: Text(
                'Rp ${product.harga.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}',
              ),
              trailing: FilledButton(
                onPressed: () => context.read<CartModel>().add(product),
                child: const Text('Tambah'),
              ),
            ),
          );
        },
      ),
    );
  }
}
