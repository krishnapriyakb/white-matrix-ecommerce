import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PDFPreviewPage extends StatefulWidget {
  final Uint8List pdfBytes;

  PDFPreviewPage({required this.pdfBytes});

  @override
  _PDFPreviewPageState createState() => _PDFPreviewPageState();
}

class _PDFPreviewPageState extends State<PDFPreviewPage> {
  String? _localPath;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      // Create a temporary file to store the PDF
      final tempDir = await getTemporaryDirectory();
      final tempFile = File("${tempDir.path}/temp_invoice.pdf");

      // Write the PDF bytes to the file
      await tempFile.writeAsBytes(widget.pdfBytes);

      // Store the file path
      setState(() {
        _localPath = tempFile.path;
      });
    } catch (e) {
      print("Error loading PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Preview'),
      ),
      body: _localPath == null
          ? const Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: _localPath!,
            ),
    );
  }
}
