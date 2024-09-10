import 'package:flutter/material.dart';
import 'package:white_matrix_ecommerce/helpers/cart_provider.dart';

class AddressSelectionModal extends StatefulWidget {
  const AddressSelectionModal({Key? key}) : super(key: key);

  @override
  _AddressSelectionModalState createState() => _AddressSelectionModalState();
}

class _AddressSelectionModalState extends State<AddressSelectionModal> {
  String? _selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Delivery Address',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text(
              'Apartment no:456,\n Lane xyz\n Ernakulam,Kerala',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            ),
            leading: Radio<String>(
              value: 'Apartment no:456,\n Lane xyz\n Ernakulam,Kerala',
              groupValue: _selectedAddress,
              onChanged: (String? value) {
                setState(() {
                  _selectedAddress = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'Apartment no:123,\n Lane abc\n Ernakulam,Kerala',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            ),
            leading: Radio<String>(
              value: 'Apartment no:123,\n Lane abc\n Ernakulam,Kerala',
              groupValue: _selectedAddress,
              onChanged: (String? value) {
                setState(() {
                  _selectedAddress = value;
                });
              },
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: _selectedAddress != null
                ? () {
                    Navigator.pop(context, _selectedAddress);
                  }
                : null,
            child: Text('Confirm Order'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}
