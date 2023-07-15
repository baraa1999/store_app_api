import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app_api/models/product_model.dart';
import 'package:store_app_api/widget/custom_button.dart';

import '../services/update_product.dart';
import '../widget/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, img, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                      isLoading = true;
                      setState(() {});
                      try {
                        updateProduct(product);
                        print('success');
                      } catch (e) {
                        isLoading = false;
                        print(e.toString());
                      }
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateProduct(ProductModel product) {
    UpdateProductServices().updateProduct(
        title: productName!,
        price: price!,
        description: desc!,
        image: img!,
        category: product.category);
    isLoading = false;
  }
}
