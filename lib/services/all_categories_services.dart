import 'package:store_app_api/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/categories') as List;

    return data;
  }
}
