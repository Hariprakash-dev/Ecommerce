import 'dart:io';
import 'package:ecom/Provider/cart_provider.dart';
import 'package:ecom/Widgets/create_pdf.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

class PdfGenerator {
  static Future<File> generate(BuildContext context) async {
    final pdf = pw.Document();
    final data = Provider.of<CartProvider>(context, listen: false); 

    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Column(
            children: [
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [buildTitle(), buildTable()],
              ),
              pw.Divider(),
              buildAddress(),
              pw.SizedBox(height: 30),
              buildTabledetails(data), 
              pw.SizedBox(height: 50),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [buildTableprice(data)],
              )
            ],
          ),
        ],
      ),
    );

    return SaveAndOpenDocument.savePdf(name: "Invoice", pdf: pdf);
  }

  static pw.Widget buildTitle() {
    return pw.Column(children: [pw.Text("Glowify\nGlow with Glowify")]);
  }

  static pw.Table buildTable() {
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.black),
      children: [
        pw.TableRow(children: [
          pw.Container(
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(8),
            child: pw.Text(
              "ORDERS#: 2746770",
              style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
            ),
          ),
        ]),
        pw.TableRow(children: [
          pw.Container(
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(8),
            child: pw.Text(
              "Date\n22/03/25",
              style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Container(
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(8),
            child: pw.Text(
              "Status\nCompleted",
              style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
            ),
          ),
        ])
      ],
    );
  }

  static pw.Widget buildAddress() {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("BILL TO"),
            pw.Text("John Doe"),
            pw.Text("Mass purus"),
            pw.Text("775 Rolling Mill Road"),
            pw.Text("Cheham Pa 19012"),
          ],
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("SHIP TO"),
            pw.Text("John Doe"),
            pw.Text("Mass purus"),
            pw.Text("775 Rolling Mill Road"),
            pw.Text("Cheham Pa 19012"),
          ],
        ),
      ],
    );
  }

  static pw.Widget buildTabledetails(CartProvider provider) {
    return pw.TableHelper.fromTextArray(
      data: [
        ["1", "22/03/25", "ORD1234", "${provider.cartItemCount}", "Delivered", "96.7", "NewYork, no37, plot76"]
      ],
      headers: ["SI.No", "Date", "Order No", "No.of Items", "Status", "Total", "Address"],
    );
  }

  static pw.Widget buildTableprice(CartProvider provider) {
    return pw.TableHelper.fromTextArray(
      data: [
        ["SUBTOTAL", "${provider.totalproductprice}"],
        ["SHIPPING", "60"],
        ["TAX", "10"],
        ["TOTAL", "${provider.shippingdetails}"],
      ],
    );
  }
}

