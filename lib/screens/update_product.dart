import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store_app_api/models/product_model.dart';
import 'package:store_app_api/widget/custom_button.dart';

import '../services/update_product.dart';
import '../widget/custom_text_field.dart';

class UpdateProductPage extends StatelessWidget {
  UpdateProductPage({super.key});
  static String id = 'update product';
  String? productName, desc, img, price;

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Product',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'description',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'Price',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    img = data;
                  },
                  hintText: 'image',
                ),
                const SizedBox(height: 50),
                CustomButon(
                  text: 'update',
                  onTap: () {
                    UpdateProductServices().updateProduct(
                        title: productName!,
                        price: price!,
                        description: desc!,
                        image: img!,
                        category: product.category);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
