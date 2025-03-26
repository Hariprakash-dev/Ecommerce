import 'dart:io';
import 'package:ecom/Models/orders.dart';
import 'package:ecom/Provider/cart_provider.dart';
import 'package:ecom/Widgets/create_pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

class PdfGenerator {
  final PdfTableBuilder pdfTableBuilder = PdfTableBuilder();

  Future<File> generate(BuildContext context) async {
    final pdf = pw.Document();
    final data = Provider.of<CartProvider>(context, listen: false);
    final logo = pw.MemoryImage(
      (await rootBundle.load("Assets/g.png")).buffer.asUint8List(),
    );

    List<Orders> orders = [
      orderdetails("1"),
      orderdetails("2"),
      orderdetails("3"),
      orderdetails("4"),
      orderdetails("5"),
      orderdetails("6"),
      orderdetails("7"),
      orderdetails("8"),
      orderdetails("9"),
      orderdetails("10"),
    ];

    pdf.addPage(
      pw.MultiPage(
        header:
            (context) => pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Image(
                      alignment: pw.Alignment.topLeft,
                      logo,
                      fit: pw.BoxFit.contain,
                      width: 100,
                    ),
                    buildTitle(),
                  ],
                ),
                pw.Column(children: [buildTable()]),
              ],
            ),
        footer: (context) {
          return pw.Column(
            children: [
              pw.Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose.",
              ),
              pw.Divider(),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,

                children: [
                  pw.Text('for further queries contact:'),
                  pw.SizedBox(width: 8),
                  pw.UrlLink(
                    destination: 'abc@gmail.com',
                    child: pw.Text(
                      'abc@gmail.com',
                      style: pw.TextStyle(
                        color: PdfColors.blue,
                        decoration: pw.TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },

        build:
            (context) => [
              pw.Column(
                children: [
                  pw.SizedBox(height: 10),
                  pw.Divider(),
                  pw.SizedBox(height: 10),
                  buildAddress(),
                  pw.SizedBox(height: 10),

                  pw.SizedBox(height: 10),

                  pdfTableBuilder.buildOrderTable(orders),
                  pw.SizedBox(height: 30),
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

  Orders orderdetails(String serialno) {
    return Orders(
      serialNo: serialno,
      date: "22/03/25",
      orderNo: "ORD1234",
      items: "1",
      status: "Delivered",
      total: "AED 96.7",
      address: "NewYork, no37, plot76",
    );
  }

  static pw.Widget buildTitle() {
    return pw.Column(
      children: [
        pw.Padding(
          padding: pw.EdgeInsets.all(8),
          child: pw.Text("Glow with Glowify"),
        ),
      ],
    );
  }

  static buildTable() {
    return pw.Column(
      mainAxisSize: pw.MainAxisSize.max,
      children: [
        pw.Container(
          height: 30,
          width: 280,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.black),
            color: PdfColor.fromHex("#F2FDF7"),
          ),
          alignment: pw.Alignment.center,

          child: pw.Text(
            "ORDERS#: 2746770",
            style: pw.TextStyle(
              fontSize: 12,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.black,
            ),
          ),
        ),
        pw.Table(
          columnWidths: {
            0: pw.FixedColumnWidth(140),
            1: pw.FixedColumnWidth(140),
          },
          border: pw.TableBorder.all(color: PdfColors.black),
          children: [
            pw.TableRow(
              children: [
                pw.Container(
                  padding: const pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                  child: pw.Text(
                    "Date\n22/03/25",
                    textAlign: pw.TextAlign.start,
                    style: pw.TextStyle(fontSize: 12, color: PdfColors.black),
                  ),
                ),
                pw.Container(
                  padding: const pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                  child: pw.Text(
                    "Status\nCompleted",
                    textAlign: pw.TextAlign.start,
                    style: pw.TextStyle(fontSize: 12, color: PdfColors.black),
                  ),
                ),
              ],
            ),
            pw.TableRow(
              children: [
                pw.Container(
                  padding: const pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                  child: pw.Text(
                    "Customer #\n220325123",
                    textAlign: pw.TextAlign.start,
                    style: pw.TextStyle(fontSize: 12, color: PdfColors.black),
                  ),
                ),
                pw.Container(
                  padding: const pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                  child: pw.Text(
                    "Purchase Order\nNA",
                    style: pw.TextStyle(fontSize: 12, color: PdfColors.black),
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
      mainAxisSize: pw.MainAxisSize.max,
      crossAxisAlignment: pw.CrossAxisAlignment.start,

      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "BILL TO:",
              style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.black,
              ),
            ),
            pw.Text(
              "John Doe",
              style: pw.TextStyle(fontSize: 12, color: PdfColors.black),
            ),
            pw.Text(
              "Mass purus",
              style: pw.TextStyle(fontSize: 12, color: PdfColors.black),
            ),
            pw.Text(
              "775 Rolling Mill Road",
              style: pw.TextStyle(fontSize: 12, color: PdfColors.black),
            ),
            pw.Text(
              "Cheham Pa 19012",
              style: pw.TextStyle(fontSize: 12, color: PdfColors.black),
            ),
          ],
        ),
        pw.SizedBox(width: 150),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "SHIP TO:",
              style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.black,
              ),
            ),
            pw.Text(
              "John Doe",
              style: pw.TextStyle(fontSize: 12, color: PdfColors.black),
            ),
            pw.Text(
              "Mass purus",
              style: pw.TextStyle(fontSize: 12, color: PdfColors.black),
            ),
            pw.Text(
              "775 Rolling Mill Road",
              style: pw.TextStyle(fontSize: 12, color: PdfColors.black),
            ),
            pw.Text(
              "Cheham Pa 19012",
              style: pw.TextStyle(fontSize: 12, color: PdfColors.black),
            ),
          ],
        ),
      ],
    );
  }

  static pw.Widget buildTableprice(CartProvider provider) {
    return pw.Table(
      border: pw.TableBorder(
        top: pw.BorderSide(width: 2, color: PdfColors.black),
        bottom: pw.BorderSide(width: 2, color: PdfColors.black),
      ),

      columnWidths: {0: pw.FixedColumnWidth(150), 1: pw.FixedColumnWidth(150)},
      children: [
        pw.TableRow(
          children: [
            pw.Container(
              height: 25,
              alignment: pw.Alignment.centerRight,
              decoration: pw.BoxDecoration(
                color: PdfColor.fromHex("#F2FDF7"),
                border: pw.Border.all(color: PdfColors.black),
              ),
              padding: pw.EdgeInsets.only(right: 5),
              child: pw.Text(
                "SUBTOTAL",
                style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight: pw.FontWeight.normal,
                  color: PdfColors.black,
                ),
              ),
            ),
            pw.Container(
              height: 25,
              decoration: pw.BoxDecoration(
                color: PdfColor.fromHex("#F2FDF7"),
                border: pw.Border.all(color: PdfColors.black),
              ),

              child: pw.Center(
                child: pw.Text(
                  "AED ${provider.totalproductprice}",
                  textAlign: pw.TextAlign.end,
                  style: pw.TextStyle(fontSize: 10, color: PdfColors.black),
                ),
              ),
            ),
          ],
        ),
        pw.TableRow(
          children: [
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.black),
              ),
              alignment: pw.Alignment.centerRight,
              height: 25,
              padding: pw.EdgeInsets.only(right: 5),
              child: pw.Text(
                "SHIPPING",
                textAlign: pw.TextAlign.end,
                style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight: pw.FontWeight.normal,
                  color: PdfColors.black,
                ),
              ),
            ),
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.black),
              ),
              height: 25,

              child: pw.Center(
                child: pw.Text(
                  "AED 60.0",
                  textAlign: pw.TextAlign.end,
                  style: pw.TextStyle(fontSize: 10, color: PdfColors.black),
                ),
              ),
            ),
          ],
        ),
        pw.TableRow(
          children: [
            pw.Container(
              alignment: pw.Alignment.centerRight,
              height: 25,
              padding: pw.EdgeInsets.only(right: 5),
              decoration: pw.BoxDecoration(
                color: PdfColor.fromHex("#F2FDF7"),
                border: pw.Border.all(color: PdfColors.black),
              ),
              child: pw.Text(
                "TAX",
                textAlign: pw.TextAlign.end,
                style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight: pw.FontWeight.normal,
                  color: PdfColors.black,
                ),
              ),
            ),
            pw.Container(
              height: 25,
              decoration: pw.BoxDecoration(
                color: PdfColor.fromHex("#F2FDF7"),
                border: pw.Border.all(color: PdfColors.black),
              ),

              child: pw.Center(
                child: pw.Text(
                  "AED 10.0",
                  textAlign: pw.TextAlign.end,
                  style: pw.TextStyle(fontSize: 10, color: PdfColors.black),
                ),
              ),
            ),
          ],
        ),
        pw.TableRow(
          children: [
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.black),
              ),
              alignment: pw.Alignment.centerRight,
              height: 25,
              padding: pw.EdgeInsets.only(right: 5),
              child: pw.Text(
                "TOTAL",
                textAlign: pw.TextAlign.end,
                style: pw.TextStyle(
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.black,
                ),
              ),
            ),
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.black),
              ),
              height: 25,

              child: pw.Center(
                child: pw.Text(
                  "AED 10.0",
                  textAlign: pw.TextAlign.end,
                  style: pw.TextStyle(
                    fontSize: 12,
                    color: PdfColors.black,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
