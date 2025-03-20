class Product {
  final String name;
  final String category;
  final String imagepath;
  final int rate;
  Product({
    required this.name,
    required this.category,
    required this.imagepath,
    required this.rate
  });
}

final List<Product> productList = [
  Product(name: "Frag", category: "Fragrance", imagepath: "Assets/pro4.webp",rate: 45),
  Product(name: "Frag", category: "Fragrance", imagepath: "Assets/pro4.webp",rate: 45),
  Product(name: "Cream", category: "Skincare", imagepath: "Assets/pro2.jpeg",rate: 45),
  Product(name: "Frag", category: "Fragrance", imagepath: "Assets/pro4.webp",rate: 45),
  Product(name: "Lipstick", category: "Makeup", imagepath: "Assets/pro3.jpeg",rate: 45),
  Product(name: "Cream", category: "Skincare", imagepath: "Assets/pro2.jpeg",rate: 45),
  Product(name: "Lipstick", category: "Makeup", imagepath: "Assets/pro3.jpeg",rate: 45),
  Product(name: "Cream", category: "Skincare", imagepath: "Assets/pro2.jpeg",rate: 45),
  Product(name: "Lipstick", category: "Makeup", imagepath: "Assets/pro3.jpeg",rate: 45),
  Product(name: "Shampoo", category: "Hair", imagepath: "Assets/pro1.jpeg",rate: 45),
];
