import 'package:FurnitureApp/contants/constants.dart';
import 'package:FurnitureApp/contants/size_config.dart';
import 'package:FurnitureApp/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightStyle = TextStyle(color: kTextColor.withOpacity(0.6));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
      height: defaultSize * 37.5,
      width: defaultSize * 15.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(product.category.toUpperCase(), style: lightStyle),
          SizedBox(
            height: defaultSize,
          ),
          Text(
            product.title,
            style: TextStyle(
                fontSize: defaultSize * 2.4,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.4),
          ),
          SizedBox(height: defaultSize * 2),
          Text("From", style: lightStyle),
          Text(
            "\$${product.price}",
            style: TextStyle(
                fontSize: defaultSize * 1.6,
                fontWeight: FontWeight.bold,
                height: 1.4),
          ),
          SizedBox(height: defaultSize * 2),
          Text("Available Colors", style: lightStyle),
          Row(
            children: [
              buildColorBox(
                defaultSize,
                color: Color(0xFF7BA275),
                isActive: true,
              ),
              buildColorBox(
                defaultSize,
                color: Color(0xFFD7D7D7),
              ),
              buildColorBox(
                defaultSize,
                color: kTextColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  Container buildColorBox(double defaultSize,
      {Color color, bool isActive = false}) {
    return Container(
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      padding: const EdgeInsets.all(5),
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: isActive ? SvgPicture.asset("assets/icons/check.svg") : SizedBox(),
    );
  }
}
