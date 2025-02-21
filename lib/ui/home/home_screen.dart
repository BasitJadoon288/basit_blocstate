import 'package:flutter/material.dart';

import '../cart/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Product 1', price: 29.99, imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/025/181/412/small/picture-a-captivating-scene-of-a-tranquil-lake-at-sunset-ai-generative-photo.jpg', rating: 4.5, discount: 10),
    Product(name: 'Product 2', price: 49.99, imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/039/545/117/small/ai-generated-beautiful-rose-flowers-with-butterflies-flying-on-them-video.jpg', rating: 4.0, discount: 5),
    Product(name: 'Product 3', price: 19.99, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvsCKzzYjPgyGodDPPWHKo4FoXMriKDLHK6Jz359BFpkc8l03dY5Zt8gpGM7ZeY2kquI0&usqp=CAU', rating: 3.5, discount: 0),
    Product(name: 'Product 4', price: 99.99, imageUrl: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/01/bd/a3/see-two-for-the-price.jpg?w=900&h=500&s=1', rating: 5.0, discount: 20),
    Product(name: 'Product 5', price: 59.99, imageUrl: 'https://media.wired.com/photos/598e35fb99d76447c4eb1f28/master/pass/phonepicutres-TA.jpg', rating: 4.2, discount: 15),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Row(
          children: [
            Icon(Icons.storefront, size: 30, color: Colors.white,),
            SizedBox(width: 8),
            Text('Daraz Clone', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context) => CartScreen()));
            },
          ),
        ],
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;
  final double rating;
  final int discount;

  Product({required this.name, required this.price, required this.imageUrl, required this.rating, required this.discount});
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement product detail navigation
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple.shade200, Colors.deepPurple.shade500],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(product.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: product.discount > 0
                              ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Text(
                              '-${product.discount}%',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          )
                              : SizedBox(),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                      Text(' ${product.rating}', style: TextStyle(fontSize: 14, color: Colors.white)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                  child: Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 8),
                  child: Container(
                    width: 120, // Adjust width for a better fit
                    height: 40, // Adjust height for better proportions
                    child: ElevatedButton(
                      onPressed: () {
                        // Simulate adding to cart
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${product.name} added to cart', style: TextStyle(fontSize: 12))),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.deepPurple, fontSize: 14),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
