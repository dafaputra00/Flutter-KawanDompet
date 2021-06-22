import 'package:budget_ui/boxes.dart';
import 'package:budget_ui/models/card_model.dart';
import 'package:budget_ui/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:budget_ui/constants/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:budget_ui/models/transaksi.dart';
import 'package:intl/intl.dart';
import 'package:budget_ui/pages/dialog/Saving_dialog.dart';

class SavingPage extends StatefulWidget {
  @override
  _SavingPageState createState() => _SavingPageState();
}

class _SavingPageState extends State<SavingPage> {
  //handel indicator

  @override
  void dispose() {
    Hive.box('TransaksiSavings').close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Savings', style: TextStyle(color: black)),
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
      ),
      body: ValueListenableBuilder<Box<transaksiSavings>>(
          valueListenable: SavingsBox.getTransactions().listenable(),
          builder: (context, box, _) {
            final transactions = box.values.toList().cast<transaksiSavings>();

            return buildContent(transactions);
          }),
    );
  }

  Widget buildContent(List<transaksiSavings> TransaksiSavings) {
    final netExpense = TransaksiSavings.fold<double>(
      0,
      (previousValue, transaction) => transaction.isExpense!
          ? previousValue - transaction.amount!
          : previousValue + transaction.amount!,
    );
    final newExpenseString = '\$${netExpense.toStringAsFixed(2)}';
    final color = netExpense > 0 ? Colors.green : Colors.red;

    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hello!',
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: kBlackColor),
                ),
                Text(
                  '[NAMA]',
                  style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor),
                )
              ],
            ),
          ),
          //card - pakai chart lebih bagus
          Container(
            height: 199,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16, right: 6),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 199,
                  width: 344,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Color(cards[index].cardBackground!)),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child:
                            SvgPicture.asset(cards[index].cardElementBottom!),
                      ),
                      Positioned(
                        left: 30,
                        top: 80,
                        child: Text(
                          'Dana : $newExpenseString',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: color),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Transaction
          Padding(
            padding: EdgeInsets.fromLTRB(16, 29, 10, 13),
            child: Text(
              'Transaksi',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: kBlackColor,
              ),
            ),
          ),

          ListView.builder(
            itemCount: TransaksiSavings.length,
            padding: EdgeInsets.only(left: 16, right: 16),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final transaction = TransaksiSavings[index];

              return buildTransaction(context, transaction);
            },
          ),

          TextButton.icon(
            icon: Icon(Icons.add),
            label: Text('Tambah Transaksi'),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => SavingDialog(
                onClickedDone: addTransaction,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTransaction(
    BuildContext context,
    transaksiSavings transaction,
  ) {
    final color = transaction.isExpense ? Colors.red : Colors.green;
    final date = DateFormat.yMMMd().format(transaction.createdDate);
    final amount = '\Rp' + transaction.amount.toStringAsFixed(2);

    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          transaction.name,
          maxLines: 2,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(date),
        trailing: Text(
          amount,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        children: [
          buildButtons(context, transaction),
        ],
      ),
    );
  }

  // Container(
  //   height: 76,
  //   margin: EdgeInsets.only(bottom: 13),
  //   padding: EdgeInsets.fromLTRB(24, 12, 22, 12),
  //   decoration: BoxDecoration(
  //     color: kWhiteColor,
  //     borderRadius: BorderRadius.circular(15),
  //     boxShadow: [
  //       BoxShadow(
  //           color: kTenBlackColor,
  //           blurRadius: 10,
  //           spreadRadius: 5,
  //           offset: Offset(8.0, 8.0))
  //     ],
  //   ),
  //   child: Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Row(
  //         children: [
  //           Text(date),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               Text(
  //                 transaction.name,
  //                 style: GoogleFonts.inter(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.w700,
  //                     color: kBlackColor),
  //               ),
  //             ],
  //           )
  //         ],
  //       ),
  //       Row(
  //         children: <Widget>[
  //           Text(
  //             amount,
  //             style: GoogleFonts.inter(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w700,
  //                 color: kBlueColor),
  //           )
  //         ],
  //       ),
  //     ],
  //   ),
  // );

  //   Card(
  //     color: Colors.white,
  //     child: ExpansionTile(
  //       tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
  //       title: Text(
  //         transaction.name,
  //         maxLines: 2,
  //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  //       ),
  //       subtitle: Text(date),
  //       trailing: Text(
  //         amount,
  //         style: TextStyle(
  //             color: color, fontWeight: FontWeight.bold, fontSize: 16),
  //       ),
  //       children: [
  //         buildButtons(context, transaction),
  //       ],
  //     ),
  //   );
  // }

  Widget buildButtons(BuildContext context, transaksiSavings transaction) =>
      Row(
        children: [
          Expanded(
            child: TextButton.icon(
              label: Text('Edit'),
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SavingDialog(
                    transaction: transaction,
                    onClickedDone: (name, amount, isExpense) =>
                        editTransaction(transaction, name, amount, isExpense),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton.icon(
              label: Text('Delete'),
              icon: Icon(Icons.delete),
              onPressed: () => deleteTransaction(transaction),
            ),
          )
        ],
      );

  Future addTransaction(String name, double amount, bool isExpense) async {
    final transaction = transaksiSavings()
      ..name = name
      ..createdDate = DateTime.now()
      ..amount = amount
      ..isExpense = isExpense;

    final box = SavingsBox.getTransactions();
    box.add(transaction);
    //box.put('mykey', transaction);

    // final mybox = Boxes.getTransactions();
    // final myTransaction = mybox.get('key');
    // mybox.values;
    // mybox.keys;
  }

  void editTransaction(
    transaksiSavings transaction,
    String name,
    double amount,
    bool isExpense,
  ) {
    transaction.name = name;
    transaction.amount = amount;
    transaction.isExpense = isExpense;

    // final box = Boxes.getTransactions();
    // box.put(transaction.key, transaction);

    transaction.save();
  }

  void deleteTransaction(transaksiSavings transaction) {
    // final box = Boxes.getTransactions();
    // box.delete(transaction.key);

    transaction.delete();
    //setState(() => transactions.remove(transaction));
  }
}
















// import 'package:budget_ui/models/card_model.dart';
// import 'package:budget_ui/themes/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:budget_ui/constants/color_constant.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class SavingPage extends StatefulWidget {
//   @override
//   _SavingPageState createState() => _SavingPageState();
// }

// class _SavingPageState extends State<SavingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Savings', style: TextStyle(color: black)),
//         backgroundColor: Colors.grey[100],
//         elevation: 0.0,
//       ),
//       body: Container(
//         child: ListView(
//           physics: ClampingScrollPhysics(),
//           children: [
//             SizedBox(height: 10),
//             Padding(
//               padding: EdgeInsets.only(left: 16, bottom: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'Hello!',
//                     style: GoogleFonts.inter(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w500,
//                         color: kBlackColor),
//                   ),
//                   Text(
//                     'Dafa Putra',
//                     style: GoogleFonts.inter(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700,
//                         color: kBlackColor),
//                   )
//                 ],
//               ),
//             ),
//             //card - pakai chart lebih bagus
//             Container(
//               height: 199,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 padding: EdgeInsets.only(left: 16, right: 6),
//                 itemCount: cards.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     margin: EdgeInsets.only(right: 10),
//                     height: 199,
//                     width: 344,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(28),
//                         color: Color(cards[index].cardBackground!)),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           bottom: 0,
//                           right: 0,
//                           child:
//                               SvgPicture.asset(cards[index].cardElementBottom!),
//                         ),
//                         Positioned(
//                           left: 30,
//                           top: 40,
//                           child: Text(
//                             'Pemasukan : Rp 2.000.000',
//                             style: GoogleFonts.inter(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                                 color: kWhiteColor),
//                           ),
//                         ),
//                         Positioned(
//                           left: 30,
//                           top: 80,
//                           child: Text(
//                             'Pengeluaran : Rp 700.000',
//                             style: GoogleFonts.inter(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                                 color: kWhiteColor),
//                           ),
//                         ),
//                         Positioned(
//                           left: 30,
//                           top: 120,
//                           child: Text(
//                             'Sisa : Rp 1.300.000',
//                             style: GoogleFonts.inter(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                                 color: kWhiteColor),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Transaction
//             Padding(
//               padding: EdgeInsets.fromLTRB(16, 29, 10, 13),
//               child: Text(
//                 'Transaksi',
//                 style: GoogleFonts.inter(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700,
//                   color: kBlackColor,
//                 ),
//               ),
//             ),
//             // ListView.builder(
//             //   itemCount: transaksiSavings.length,
//             //   padding: EdgeInsets.only(left: 16, right: 16),
//             //   shrinkWrap: true,
//             //   itemBuilder: (context, index) {
//             //     return Container(
//             //       height: 76,
//             //       margin: EdgeInsets.only(bottom: 13),
//             //       padding: EdgeInsets.fromLTRB(24, 12, 22, 12),
//             //       decoration: BoxDecoration(
//             //         color: kWhiteColor,
//             //         borderRadius: BorderRadius.circular(15),
//             //         boxShadow: [
//             //           BoxShadow(
//             //               color: kTenBlackColor,
//             //               blurRadius: 10,
//             //               spreadRadius: 5,
//             //               offset: Offset(8.0, 8.0))
//             //         ],
//             //       ),
//             //       child: Row(
//             //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //         children: [
//             //           Row(
//             //             children: [
//             //               Container(
//             //                 height: 57,
//             //                 width: 57,
//             //                 decoration: BoxDecoration(
//             //                   shape: BoxShape.circle,
//             //                   image: DecorationImage(
//             //                     image: AssetImage(transaksiSavings[index].icon),
//             //                   ),
//             //                 ),
//             //               ),
//             //               Column(
//             //                 crossAxisAlignment: CrossAxisAlignment.start,
//             //                 mainAxisAlignment: MainAxisAlignment.center,
//             //                 children: <Widget>[
//             //                   Text(
//             //                     transaksiSavings[index].nama,
//             //                     style: GoogleFonts.inter(
//             //                         fontSize: 18,
//             //                         fontWeight: FontWeight.w700,
//             //                         color: kBlackColor),
//             //                   ),
//             //                 ],
//             //               )
//             //             ],
//             //           ),
//             //           Row(
//             //             children: <Widget>[
//             //               Text(
//             //                 transaksiSavings[index].total,
//             //                 style: GoogleFonts.inter(
//             //                     fontSize: 15,
//             //                     fontWeight: FontWeight.w700,
//             //                     color: kBlueColor),
//             //               )
//             //             ],
//             //           )
//             //         ],
//             //       ),
//             //     );
//             //   },
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
