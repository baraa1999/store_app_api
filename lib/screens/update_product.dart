import 'package:flutter/material.dart';

class UpdateProduct extends StatelessWidget {
  const UpdateProduct({super.key});
  static String id = 'update product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Product',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
