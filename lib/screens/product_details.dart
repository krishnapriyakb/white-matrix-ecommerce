import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_matrix_ecommerce/helpers/cart_provider.dart';
import 'package:white_matrix_ecommerce/helpers/product.dart';
import 'package:white_matrix_ecommerce/utils/widgets/address_bottomsheet.dart';
import 'package:white_matrix_ecommerce/utils/widgets/rating_bar.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  ProductDetails({required this.product});
  String? _selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Image.asset(
                    product.imageUrl,
                    fit: BoxFit.contain,
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Product Name",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          "\₹ ${product.price}",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .addItem(product);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 1),
                        content: Text('${product.name} added to cart!'),
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[100],
                          borderRadius: BorderRadius.circular(12)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () async {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.pink[100],
                          borderRadius: BorderRadius.circular(12)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(),
              const Row(
                children: [
                  Icon(
                    Icons.delivery_dining,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Free Delivery by 25 Sep, Sunday",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              const Row(
                children: [
                  Icon(
                    Icons.refresh_rounded,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "10 Days Return Policy",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              const Row(
                children: [
                  Icon(
                    Icons.currency_rupee,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Cash On Delivery Available",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Rating & Reviews",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const StarRating(rating: 4),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const Text(
                "Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                  "Loreum ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> _showAddressSelectionModal(BuildContext context) {
    return showModalBottomSheet<String>(
      context: context,
      builder: (context) {
        return const AddressSelectionModal();
      },
    );
  }
}
