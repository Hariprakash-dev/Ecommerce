import 'dart:io';
import 'package:ecom/Provider/cart_provider.dart';
import 'package:ecom/Widgets/create_pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

class PdfGenerator {
  static Future<File> generate(BuildContext context) async {
    final pdf = pw.Document();
    final data = Provider.of<CartProvider>(context, listen: false);

    pdf.addPage(
      pw.MultiPage(
        build:
            (context) => [
              pw.Column(
                children: [
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [buildTitle(), buildTable()],
                  ),
                  pw.SizedBox(height: 20),
                  pw.Divider(),
                  pw.SizedBox(height: 20),
                  buildAddress(),
                  pw.SizedBox(height: 30),
                  buildTabledetails(data),
                  pw.SizedBox(height: 20),
                  pw.Divider(),
                  pw.SizedBox(height: 50),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [buildTableprice(data)],
                  ),
                ],
              ),
            ],
      ),
    );

    return SaveAndOpenDocument.savePdf(name: "Invoice", pdf: pdf);
  }

  static pw.Widget buildTitle() {
    return pw.Column(children: [
   
      pw.Text("Glow with Glowify")]);
  }

  static buildTable() {
    return pw.Column(
      mainAxisSize: pw.MainAxisSize.max,
      children: [
        pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.black),
            color: PdfColor.fromInt(0xFFE1F5FE),
          ),
          alignment: pw.Alignment.center,
          padding: const pw.EdgeInsets.only(
            left: 59,
            right: 59,
            top: 10,
            bottom: 10,
          ),
          child: pw.Text(
            "ORDERS#: 2746770",
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
        ),
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.black),
          children: [
            pw.TableRow(
              children: [
                pw.Container(
                  alignment: pw.Alignment.center,
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text(
                    "Date: 22/03/25",
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.Container(
                  alignment: pw.Alignment.center,
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text(
                    "Status: Completed",
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
      headerDecoration: pw.BoxDecoration(color: PdfColor.fromInt(0xFFE1F5FE)),

      data: [
        [
          "1",
          "22/03/25",
          "ORD1234",
          pw.Center(child: pw.Text("${provider.cartItemCount}")),

          "Delivered",
          "96.7",
          "NewYork, no37, plot76",
        ],
        [
          "1",
          "22/03/25",
          "ORD1234",
          pw.Center(child: pw.Text("${provider.cartItemCount}")),
          "Delivered",
          "96.7",
          "NewYork, no37, plot76",
        ],
        [
          "1",
          "22/03/25",
          "ORD1234",
          pw.Center(child: pw.Text("${provider.cartItemCount}")),
          "Delivered",
          "96.7",
          "NewYork, no37, plot76",
        ],
        [
          "1",
          "22/03/25",
          "ORD1234",
          pw.Center(child: pw.Text("${provider.cartItemCount}")),
          "Delivered",
          "96.7",
          "NewYork, no37, plot76",
        ],
        [
          "1",
          "22/03/25",
          "ORD1234",
          pw.Center(child: pw.Text("${provider.cartItemCount}")),
          "Delivered",
          "96.7",
          "NewYork, no37, plot76",
        ],
        [
          "1",
          "22/03/25",
          "ORD1234",
          pw.Center(child: pw.Text("${provider.cartItemCount}")),
          "Delivered",
          "96.7",
          "NewYork, no37, plot76",
        ],
        [
          "1",
          "22/03/25",
          "ORD1234",
          pw.Center(child: pw.Text("${provider.cartItemCount}")),
          "Delivered",
          "96.7",
          "NewYork, no37, plot76",
        ],
      ],
      headers: [
        "SI.No",
        "Date",
        "Order No",
        "No.of Items",
        "Status",
        "Total",
        "Address",
      ],
    );
  }

  static pw.Widget buildTableprice(CartProvider provider) {
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.black),
      columnWidths: {0: pw.FixedColumnWidth(150), 1: pw.FixedColumnWidth(150)},
      children: [
        pw.TableRow(
          children: [
            pw.Container(
              padding: pw.EdgeInsets.all(12),
              child: pw.Text("Sub Total"),
            ),
            pw.Container(
              padding: pw.EdgeInsets.all(12),
              child: pw.Text("${provider.totalproductprice}"),
            ),
          ],
        ),
        pw.TableRow(
          children: [
            pw.Container(
              padding: pw.EdgeInsets.all(12),
              child: pw.Text("Shipping"),
            ),
            pw.Container(padding: pw.EdgeInsets.all(12), child: pw.Text("60")),
          ],
        ),
        pw.TableRow(
          children: [
            pw.Container(padding: pw.EdgeInsets.all(12), child: pw.Text("Tax")),
            pw.Container(padding: pw.EdgeInsets.all(12), child: pw.Text("10")),
          ],
        ),
        pw.TableRow(
          children: [
            pw.Container(
              decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xFFE1F5FE)),
              padding: pw.EdgeInsets.all(12),
              child: pw.Text("Total"),
            ),
            pw.Container(
              decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xFFE1F5FE)),
              padding: pw.EdgeInsets.all(12),
              child: pw.Text("${provider.shippingdetails}"),
            ),
          ],
        ),
      ],
    );
  }

  static Future<pw.MemoryImage> loadAssetImage(String path) async {
    final ByteData data = await rootBundle.load(path);
    final Uint8List bytes = data.buffer.asUint8List();
    return pw.MemoryImage(bytes);
  }
}


// pw.TableHelper.fromTextArray(
     
//       columnWidths: {0: pw.FixedColumnWidth(150), 1: pw.FixedColumnWidth(150)},
//       headerAlignment: pw.Alignment.centerLeft,
//       data: [
//         ["Sub Total", "${provider.totalproductprice}"],
//         ["Shipping", "60"],
//         ["Tax", "10"],
//         ["Total", "${provider.shippingdetails}"],
//       ],
//     );