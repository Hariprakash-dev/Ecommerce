import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("PDF Viewer"),),
      backgroundColor: Colors.white,
      body: SfPdfViewer.asset("Assets/PDF/payment.pdf"),
    );
  }
}