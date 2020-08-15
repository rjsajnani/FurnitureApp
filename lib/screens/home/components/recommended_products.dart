import 'package:FurnitureApp/contants/size_config.dart';
import 'package:FurnitureApp/models/Product.dart';
import 'package:FurnitureApp/screens/details/details.dart';
import 'package:FurnitureApp/screens/home/components/product_cart.dart';
import 'package:flutter/material.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({
    Key key,
    this.products,
  }) : super(key: key);

  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.693,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount:
              SizeConfig.orientation == Orientation.portrait ? 2 : 4,
        ),
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Details(product: products[index])));
          },
        ),
      ),
    );
  }
}
