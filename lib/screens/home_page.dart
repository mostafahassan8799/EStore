import 'package:estore/models/product_model.dart';
import 'package:estore/service/get_all_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'New Trend',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.cartShopping,
                  color: Colors.black,
                ))
          ],
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(right: 12, left: 12, top: 90, bottom: 30),
          child: FutureBuilder<List<ProductModel>>(
              future: AllProductsService().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 100),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        product: products[index],
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }
}
