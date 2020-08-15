import 'package:FurnitureApp/components/title_widget.dart';
import 'package:FurnitureApp/contants/constants.dart';
import 'package:FurnitureApp/contants/size_config.dart';
import 'package:FurnitureApp/models/Product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: defaultSize * 14.5,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/spinner.gif",
                    image: product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSize),
                child: TitleWidget(
                  title: product.title,
                ),
              ),
              SizedBox(
                height: defaultSize / 2,
              ),
              Text("\$ ${product.price}"),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
