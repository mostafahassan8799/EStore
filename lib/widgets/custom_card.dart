import 'package:estore/models/product_model.dart';
import 'package:estore/screens/update_product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.product});
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0,
                    offset: Offset(10, 10))
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.substring(0, 12),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${product.price.toString()}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.solidHeart,
                                color: Colors.red,
                              ))
                        ],
                      )
                    ]),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: -300,
            child: Image.network(product.image),
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
  }
}
