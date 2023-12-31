class ProductModel {
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String image;
  final RatingModel rate;
  final String category;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.rate,
      required this.category});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        category: jsonData['category'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        rate: RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final double rate;
  final int count;
  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
