import 'product.dart';

class ProductsRepository {
  static const _allProducts = <Product> [
    Product(
      category: Category.accessories,
      id: 0,
      isFeatured: true,
      name: '黄瓜🥒',
      price: 12
    ),
    Product(
      category: Category.accessories,
      id: 1,
      isFeatured: true,
      name: '西红柿🍅',
      price: 20
    ),
    Product(
      category: Category.accessories,
      id: 2,
      isFeatured: true,
      name: '西葫芦👿',
      price: 1232
    ),
    Product(
      category: Category.accessories,
      id: 2,
      isFeatured: true,
      name: '南瓜🎃',
      price: 1232
    ),
    Product(
      category: Category.accessories,
      id: 2,
      isFeatured: true,
      name: '西瓜🍉',
      price: 1232
    ),
    Product(
      category: Category.accessories,
      id: 2,
      isFeatured: true,
      name: '西葫芦👿',
      price: 1232
    ),
    Product(
      category: Category.accessories,
      id: 2,
      isFeatured: true,
      name: '西葫芦👿',
      price: 1232
    ),
    Product(
      category: Category.accessories,
      id: 2,
      isFeatured: true,
      name: '西葫芦👿',
      price: 1232
    ),
    Product(
      category: Category.accessories,
      id: 2,
      isFeatured: true,
      name: '西葫芦👿',
      price: 1232
    ),
    Product(
      category: Category.accessories,
      id: 2,
      isFeatured: true,
      name: '西葫芦👿',
      price: 1232
    ),
    Product(
      category: Category.accessories,
      id: 2,
      isFeatured: true,
      name: '西葫芦👿',
      price: 1232
    ),
    Product(
      category: Category.accessories,
      id: 2,
      isFeatured: true,
      name: '西葫芦👿',
      price: 1232
    ),
    Product(
      category: Category.accessories,
      id: 2,
      isFeatured: true,
      name: '西葫芦👿',
      price: 1232
    )
  ];

  static List<Product> loadProducts(Category category) {
    if(category == Category.all) {
      return _allProducts;
    } else {
      _allProducts.where((p) => p.category == category).toList();
    }
  }
}
