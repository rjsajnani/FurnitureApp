import 'package:FurnitureApp/contants/constants.dart';
import 'package:FurnitureApp/contants/size_config.dart';
import 'package:FurnitureApp/models/Product.dart';
import 'package:FurnitureApp/screens/details/components/product_description.dart';
import 'package:FurnitureApp/screens/details/components/product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsBody extends StatelessWidget {
  final Product product;
  const DetailsBody({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight - AppBar().preferredSize.height,
          child: Stack(
            children: [
              ProductInfo(product: product),
              Positioned(
                top: defaultSize * 37.5,
                left: 0,
                right: 0,
                child: ProductDescription(
                  product: product,
                  press: () {},
                ),
              ),
              Positioned(
                top: defaultSize * 9.5,
                right: -defaultSize * 4.5,
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                    width: defaultSize * 36.8,
                    height: defaultSize * 36.4,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
