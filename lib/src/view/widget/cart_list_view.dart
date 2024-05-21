import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_style.dart';
import 'package:hungry_hund/core/app_extension.dart';
import 'package:hungry_hund/src/model/product.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
    required this.counterButton,
    required this.productItems,
  });

  final Widget Function(Product product) counterButton;
  final List<Product> productItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: productItems.length,
      itemBuilder: (_, index) {
        Product product = productItems[index];
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(product.images[0]),
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title.addOverFlow, style: h4Style),
                  const SizedBox(height: 5),
                  Text("\$${product.price}", style: h2Style),
                  const SizedBox(height: 5),
                ],
              ),
              // Spacer(),
              counterButton(product)
            ],
          ).fadeAnimation(0.4 * index),
        );
      },
      separatorBuilder: (_, __) {
        return const Padding(padding: EdgeInsets.only(bottom: 15));
      },
    );
  }
}
