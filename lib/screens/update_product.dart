import 'package:estore/models/product_model.dart';
import 'package:estore/service/update_product.dart';
import 'package:estore/widgets/custom_button.dart';
import 'package:estore/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image;

  dynamic? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(children: [
          Image.asset(
            'assets/Niche service marketplace-rafiki.png',
            width: 180,
            height: 180,
          ),
          CustomTextField(
            hintText: "Product Name",
            onChanged: (data) {
              productName = data;
            },
          ),
          CustomTextField(
            hintText: "Description",
            onChanged: (data) {
              description = data;
            },
          ),
          CustomTextField(
            textInputType: TextInputType.number,
            hintText: "Price",
            onChanged: (data) {
              price = data;
            },
          ),
          CustomTextField(
            hintText: "Image",
            onChanged: (data) {
              image = data;
            },
          ),
          CustomButton(
            text: "Update",
            onTap: () async {
              isLoading = true;
              setState(() {});
              try {
                await updateProduct(product);
                print("Success");
              } on Exception catch (e) {
                print(e.toString());
              }
              isLoading = false;
              setState(() {});
            },
          ),
        ]),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        description: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
