import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> products = [
    Product(name: 'Product 1', price: 29.99, imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/025/181/412/small/picture-a-captivating-scene-of-a-tranquil-lake-at-sunset-ai-generative-photo.jpg', rating: 4.5, discount: 10),
    Product(name: 'Product 2', price: 49.99, imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/039/545/117/small/ai-generated-beautiful-rose-flowers-with-butterflies-flying-on-them-video.jpg', rating: 4.0, discount: 5),
    Product(name: 'Product 3', price: 19.99, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvsCKzzYjPgyGodDPPWHKo4FoXMriKDLHK6Jz359BFpkc8l03dY5Zt8gpGM7ZeY2kquI0&usqp=CAU', rating: 3.5, discount: 0),
    Product(name: 'Product 4', price: 99.99, imageUrl: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/01/bd/a3/see-two-for-the-price.jpg?w=900&h=500&s=1', rating: 5.0, discount: 20),
    Product(name: 'Product 5', price: 59.99, imageUrl: 'https://media.wired.com/photos/598e35fb99d76447c4eb1f28/master/pass/phonepicutres-TA.jpg', rating: 4.2, discount: 15),
    Product(name: 'Product 6', price: 29.99, imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/025/181/412/small/picture-a-captivating-scene-of-a-tranquil-lake-at-sunset-ai-generative-photo.jpg', rating: 4.5, discount: 10),
    Product(name: 'Product 7', price: 49.99, imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/039/545/117/small/ai-generated-beautiful-rose-flowers-with-butterflies-flying-on-them-video.jpg', rating: 4.0, discount: 5),
    Product(name: 'Product 8', price: 19.99, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvsCKzzYjPgyGodDPPWHKo4FoXMriKDLHK6Jz359BFpkc8l03dY5Zt8gpGM7ZeY2kquI0&usqp=CAU', rating: 3.5, discount: 0),
    Product(name: 'Product 9', price: 99.99, imageUrl: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/01/bd/a3/see-two-for-the-price.jpg?w=900&h=500&s=1', rating: 5.0, discount: 20),
    Product(name: 'Product 10', price: 59.99, imageUrl: 'https://media.wired.com/photos/598e35fb99d76447c4eb1f28/master/pass/phonepicutres-TA.jpg', rating: 4.2, discount: 15),
  ];

  List<Product> cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Row(
          children: [
            Icon(Icons.storefront, size: 30, color: Colors.white),
            SizedBox(width: 8),
            Text('Daraz Clone', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cart: cart),
                ),
              );
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
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _ProductCard(
              product: products[index],
              onAddToCart: () {
                setState(() {
                  cart.add(products[index]);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${products[index].name} added to cart')),
                );
              },
            );
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
  final VoidCallback onAddToCart;

  const _ProductCard({required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to product detail screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                      Text(' ${product.rating}', style: const TextStyle(fontSize: 14, color: Colors.white)),
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
                  child: SizedBox(
                    width: 120,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: onAddToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
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

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double discountedPrice = product.price - (product.price * product.discount / 100);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.imageUrl,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow, size: 18),
                Text(
                  ' ${product.rating}',
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (product.discount > 0) ...[
              Text(
                'Discount: ${product.discount}%',
                style: const TextStyle(fontSize: 16, color: Colors.red),
              ),
              const SizedBox(height: 8),
            ],
            Text(
              'Original Price: \$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, color: Colors.black54, decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(height: 8),
            Text(
              'Price after Discount: \$${discountedPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 16),
            Text(
              'Description:',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              'This is a placeholder description of the product. It can include details such as features, materials, dimensions, and usage instructions.',
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // Add to cart functionality can go here.
            //     },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.deepPurple,
            //       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //     ),
            //     child: const Text('Add to Cart', style: TextStyle(fontSize: 18, color: Colors.white)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


class CartScreen extends StatelessWidget {
  final List<Product> cart;

  const CartScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final product = cart[index];
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    leading: Image.network(product.imageUrl, width: 50, fit: BoxFit.cover),
                    title: Text(product.name),
                    subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                    trailing: const Icon(Icons.delete, color: Colors.red),
                  );
                },
              ),
            ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutScreen(cartProducts: cart),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple, // Change this to your desired color
        ),
      child: const Text('Proceed to Checkout', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutScreen extends StatefulWidget {
  final List<Product> cartProducts;

  const CheckoutScreen({super.key, required this.cartProducts});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    double totalAmount = widget.cartProducts.fold(0, (sum, product) => sum + product.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Items in your cart:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartProducts.length,
                itemBuilder: (context, index) {
                  final product = widget.cartProducts[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    leading: Image.network(product.imageUrl, width: 50, fit: BoxFit.cover),
                    title: Text(product.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                    trailing: const Icon(Icons.delete, color: Colors.red),
                    onTap: () {
                      // Optionally, you can add a handler for a tap on the list tile.
                    },
                    onLongPress: () {
                      // Remove the product from the cart when the delete icon is pressed
                      setState(() {
                        widget.cartProducts.removeAt(index); // Removes the product at the current index
                      });
                    },
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Total: \$${totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order placed successfully!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Proceed to Checkout', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
