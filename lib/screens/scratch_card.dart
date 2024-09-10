import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scratcher/scratcher.dart';
import 'package:white_matrix_ecommerce/helpers/cart_provider.dart';
import 'package:white_matrix_ecommerce/helpers/product.dart';
import 'package:white_matrix_ecommerce/utils/widgets/custom_bottom_bar.dart';

class ScratchCardScreen extends StatelessWidget {
  Product product = Product(
      imageUrl: "assets/images/product9.jpeg",
      name: "Scratch Card gift",
      brand: "Brand Q",
      price: 0.0);

  @override
  Widget build(BuildContext context) {
    _fnNavigateToHomePage() async {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => const CustomBottomBar(),
          settings: const RouteSettings(name: '/home'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "New Reward!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Scratcher(
              image: Image.asset("assets/images/confetti.jpg"),
              brushSize: 50,
              threshold:
                  30, // The percentage of the area to be scratched to complete the action
              color: Colors.deepPurple.shade100,
              onChange: (value) {
                // Progress value of scratching
                print('Scratch progress: $value%');
              },
              onThreshold: () {
                // Action to take when scratching threshold is met
                print('Revealed!');
              },
              child: Container(
                height: 400,
                width: 300,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Congratulations!',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          product.imageUrl,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text(
                        'You\'ve won a ₹0 item!',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addItem(product);
                          _fnNavigateToHomePage();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Item added to your cart!')),
                          );
                        },
                        child: const Text('Add to Cart'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
