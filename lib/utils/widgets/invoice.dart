import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:white_matrix_ecommerce/screens/pdf_view.dart';
import 'package:white_matrix_ecommerce/utils/formatters/formatter.dart';

class InvoiceGenerator {
  // Function to generate invoice as PDF bytes
  static Future<Uint8List> generateInvoiceBytes({
    required String deliveryAddress,
    required List<Map<String, dynamic>>
        items, // Example: [{'name': 'Product A', 'quantity': 2, 'price': 50}]
    required double totalAmount,
  }) async {
    final pdf = pw.Document();

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Invoice',
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 16),
              pw.Text('Delivery Address:',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text(deliveryAddress),
              pw.SizedBox(height: 10),
              pw.Text('Transaction ID:',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text("TRANS1234@abc"),
              pw.SizedBox(height: 16),
              pw.TableHelper.fromTextArray(
                border: pw.TableBorder.all(),
                headers: ['Product', 'Quantity', 'Price', 'Total'],
                data: items.map((item) {
                  final total = item['quantity'] * item['price'];
                  return [
                    item['name'],
                    item['quantity'].toString(),
                    '\$${item['price']}',
                    '\$${total}',
                  ];
                }).toList(),
              ),
              pw.SizedBox(height: 16),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Total Amount: \$${totalAmount}',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text(WFormatter.formatDate(DateTime.now()))
                  ])
            ],
          );
        },
      ),
    );

    // Return PDF file as bytes (without saving it)
    return pdf.save();
  }

  // Preview the generated PDF
  static void previewInvoice(BuildContext context, String deliveryAddress,
      List<Map<String, dynamic>> items, double totalAmount) async {
    try {
      // Generate the PDF as bytes
      Uint8List pdfBytes = await generateInvoiceBytes(
        deliveryAddress: deliveryAddress,
        items: items,
        totalAmount: totalAmount,
      );

      // Navigate to the preview page
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PDFPreviewPage(pdfBytes: pdfBytes),
        ),
      );
    } catch (e) {
      // Handle errors here
      print('Error generating PDF: $e');
    }
  }
}
