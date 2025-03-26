import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

class Orders {
  final String serialNo;
  final String date;
  final String orderNo;
  final String items;
  final String status;
  final String total;
  final String address;

  Orders({
    required this.serialNo,
    required this.date,
    required this.orderNo,
    required this.items,
    required this.status,
    required this.total,
    required this.address,
  });
}

class PdfTableBuilder {
pw.Widget buildOrderTable(List<Orders> orders) {
  return pw.Table(
    border: pw.TableBorder(
        top: pw.BorderSide(width: 2, color: PdfColors.black),
        bottom: pw.BorderSide(width: 2, color: PdfColors.black),
      ),
    columnWidths: {
      0: pw.FixedColumnWidth(40),
      1: pw.FixedColumnWidth(60),
      2: pw.FixedColumnWidth(70),
      3: pw.FixedColumnWidth(80),
      4: pw.FixedColumnWidth(60),
      5: pw.FixedColumnWidth(60),
      6: pw.FixedColumnWidth(120),
    },
    children: [
      buildHeaderRow(),
      
       ...List.generate(orders.length, (index) => buildTableRow(orders[index], index)), 
       
    ],
  );
}


pw.TableRow buildHeaderRow() {
  return pw.TableRow(
   
    children: [
      buildheaderCell("SI.NO"),
      buildheaderCell("DATE"),
      buildheaderCell("ORDER NO"),
      buildheaderCell("NO.OF.ITEMS"),
      buildheaderCell("STATUS"),
      buildheaderCell("TOTAL"),
      buildheaderCell("ADDRESS"),
    ],
  );
}


pw.TableRow buildTableRow(Orders order,int index) {
   final oddrow = index % 2 == 0; 
  final rowColor = oddrow ? null : PdfColor.fromHex("#F2FDF7");
  return pw.TableRow(
     decoration: pw.BoxDecoration(color: rowColor),
    children: [
      buildrowCell(order.serialNo),
      buildrowCell(order.date),
      buildrowCell(order.orderNo),
      buildrowCell(order.items),
      buildrowCell(order.status),
      buildrowCell(order.total),
      buildrowCell(order.address),
    ],
  );
}


pw.Widget buildrowCell(String text) {
  return pw.Container(
    padding: pw.EdgeInsets.all(5),
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColors.black),
    ),
    child: pw.Text(
      text,
      textAlign: pw.TextAlign.center,
      style: pw.TextStyle(
        fontSize: 10,
        fontWeight:  pw.FontWeight.normal,
        color: PdfColors.black,
      ),
    ),
  );
}

pw.Widget buildheaderCell(String text) {
  return pw.Container(
    padding: pw.EdgeInsets.all(5),
    
    child: pw.Text(
      text,
      textAlign: pw.TextAlign.center,
      style: pw.TextStyle(
        fontSize: 10,
        fontWeight: pw.FontWeight.normal,
        color: PdfColors.black,
      ),
    ),
  );
}


}
