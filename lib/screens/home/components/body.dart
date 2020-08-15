import 'package:FurnitureApp/components/title_widget.dart';
import 'package:FurnitureApp/contants/size_config.dart';
import 'package:FurnitureApp/screens/home/components/categories.dart';
import 'package:FurnitureApp/screens/home/components/recommended_products.dart';
import 'package:FurnitureApp/services/fetchCategories.dart';
import 'package:FurnitureApp/services/fetchProducts.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize * 2.0),
              child: TitleWidget(
                title: "Browse by Categories",
              ),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapShot) => snapShot.hasData
                  ? Categories(categories: snapShot.data)
                  : Center(
                      child: Image.asset('assets/ripple.gif'),
                    ),
            ),
            Divider(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2.0),
              child: TitleWidget(
                title: "Recommended for you",
              ),
            ),
            FutureBuilder(
                future: fetchProducts(),
                builder: (context, snapShot) {
                  return snapShot.hasData
                      ? RecommendedProducts(products: snapShot.data)
                      : Center(
                          child: Image.asset('assets/ripple.gif'),
                        );
                }),
          ],
        ),
      ),
    );
  }
}
