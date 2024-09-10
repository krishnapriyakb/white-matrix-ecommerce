import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_matrix_ecommerce/helpers/cart_provider.dart';
import 'package:white_matrix_ecommerce/utils/widgets/address_bottomsheet.dart';
import 'package:white_matrix_ecommerce/utils/widgets/invoice.dart';

class CartPage extends StatelessWidget {
  String? _selectedAddress;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: cartProvider.items.length == 0
          ? Center(
              child: const Text(
                "Your Cart is Empty",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      var cartItem = cartProvider.items.values.toList()[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpansionTile(
                          collapsedBackgroundColor: Colors.white,
                          collapsedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          leading: Image.asset(
                            cartItem.product.imageUrl,
                          ),
                          title: const Text(
                            "Loreum Ipsum",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItem.product.brand,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 16),
                              ),
                              Text(
                                'Qty: ${cartItem.quantity}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '\₹${cartItem.product.price * cartItem.quantity}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              IconButton(
                                  onPressed: () {
                                    cartProvider.removeSingleItem(
                                        cartItem.product.name);
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\₹${cartProvider.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(50, 40),
                              backgroundColor: Colors.deepPurple[100]),
                          onPressed: () async {
                            _selectedAddress =
                                await _showAddressSelectionModal(context);
                            if (_selectedAddress != null) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content:
                                        Image.asset("assets/images/sucess.png"),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            cartProvider.clearCart();
                                          },
                                          child: const Text(
                                            "Cancel",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          )),
                                      TextButton(
                                        child: Text(
                                          "View Invoices",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        onPressed: () {
                                          InvoiceGenerator.previewInvoice(
                                            context,
                                            _selectedAddress!,
                                            cartProvider.items.values
                                                .map((item) {
                                              return {
                                                'name': item.product.name,
                                                'quantity': item.quantity,
                                                'price': item.product.price,
                                              };
                                            }).toList(),
                                            cartProvider.totalAmount,
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: const Text(
                            'Checkout',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Future<String?> _showAddressSelectionModal(BuildContext context) {
    return showModalBottomSheet<String>(
      context: context,
      builder: (context) {
        return AddressSelectionModal();
      },
    );
  }

  void showOrderPlacedDialog(BuildContext context) {}
}
