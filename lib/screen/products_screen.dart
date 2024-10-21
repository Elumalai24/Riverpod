import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/product_provider.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final productsProvider = ref.watch(getProductsProvider);
    return Scaffold(
        appBar: AppBar(title: const Text("Riverpod Example")),
        body: productsProvider.when(
            data: (products) {
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      title: const Text("product.title"),
                      subtitle: Text('\$${product.price}'),
                      leading:
                          Image.network(product.image, width: 50, height: 50),
                    );
                  });
            },
            error: (error, strace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()));
  }
}
