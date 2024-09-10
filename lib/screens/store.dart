import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:white_matrix_ecommerce/helpers/cart_provider.dart';
import 'package:white_matrix_ecommerce/helpers/product.dart';
import 'package:white_matrix_ecommerce/screens/product_details.dart';
import 'package:white_matrix_ecommerce/utils/constants/product_data.dart';
import 'package:white_matrix_ecommerce/utils/widgets/custom_appbar.dart';

class ScreenStore extends StatelessWidget {
  late final List<Product> popularProducts = List.generate(
    ProductData.imageUrls.length,
    (index) => Product(
      imageUrl: ProductData.imageUrls[index],
      name: ProductData.productNames[index],
      brand: ProductData.brandNames[index],
      price: ProductData.prices[index],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              // leading: Image.asset(
              //   "assets/images/teresa_logo_white.png",
              // ),
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag,
                    size: 30,
                  )),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.white38,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.white38,
                      ),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: "Search for a product",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Search by Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 16),
            _buildCategorySlider(),
            SizedBox(height: 16),
            _buildOffersSlider(),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Popular Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                // style: Theme.of(context)
                //     .textTheme
                //     .headline6!
                //     .copyWith(fontSize: 20),
              ),
            ),
            const SizedBox(height: 16),
            _buildPopularProductsGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 50,
        autoPlay: false,
        viewportFraction: 0.4,
      ),
      items: ['Dress', 'Skirts', 'Saree', 'Jewellery', 'Cosmetics', 'Footwear']
          .map((category) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/category_bg.jpeg")),
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildOffersSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        aspectRatio: 8 / 9,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: [
        'assets/images/offer banner1.jpg',
        'assets/images/offer banner 2.jpeg',
        'assets/images/offer banner 3.jpeg'
      ].map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildPopularProductsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 8,
        childAspectRatio: 0.5,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: popularProducts.length,
      itemBuilder: (context, index) {
        return _buildProductCard(popularProducts[index], context);
      },
    );
  }

  Widget _buildProductCard(Product product, BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                ProductDetails(product: product)));
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Image.asset(
                        height: MediaQuery.of(context).size.height * .30,
                        product.imageUrl,
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.black,
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.heart,
                        size: 15,
                      ),
                      onPressed: () {
                        // Add to Wishlist logic here
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 50,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.black,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_shopping_cart_rounded,
                        size: 15,
                      ),
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .addItem(product);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text('${product.name} added to cart!'),
                        ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            product.brand,
            style: const TextStyle(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Lorem Ipsum is a placeholder",
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w200),
          ),
          Text("₹${product.price}")
        ],
      ),
    );
    // return Card(
    //   elevation: 4,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   color: Colors.blue,
    //   // color: Theme.of(context).cardColor,
    //   child: Stack(
    //     children: [
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           AspectRatio(
    //             aspectRatio: 1.2,
    //             child: Stack(
    //               children: [
    //                 ClipRRect(
    //                   borderRadius: BorderRadius.only(
    //                       topLeft: Radius.circular(12),
    //                       topRight: Radius.circular(12)),
    //                   child: Image.asset(
    //                     product.imageUrl,
    //                   ),
    //                 ),
    // Positioned(
    //   top: 8,
    //   right: 8,
    //   child: IconButton(
    //     icon: Icon(FontAwesomeIcons.heart),
    //     onPressed: () {
    //       // Add to Wishlist logic here
    //     },
    //   ),
    // ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text(
    //               product.name,
    //               style: const TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.white,
    //               ),
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //             child: Text(
    //               product.brand,
    //               style: TextStyle(color: Colors.grey[400]),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //             child: Text(
    //               '\$${product.price}',
    //               style: TextStyle(
    //                   fontWeight: FontWeight.bold, color: Colors.pinkAccent),
    //             ),
    //           ),
    //           // Spacer(),
    //           // Padding(
    //           //   padding: const EdgeInsets.all(8.0),
    //           //   child: SizedBox(
    //           //     width: double.infinity,
    //           //     child: ElevatedButton(
    //           //       onPressed: () {
    //           //         // Add to Cart logic here
    //           //       },
    //           //       child: Text('Add to Cart'),
    //           //     ),
    //           //   ),
    //           // ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
