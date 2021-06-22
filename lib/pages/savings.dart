import 'package:budget_ui/models/card_model.dart';
import 'package:budget_ui/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:budget_ui/constants/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SavingPage extends StatefulWidget {
  @override
  _SavingPageState createState() => _SavingPageState();
}

class _SavingPageState extends State<SavingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Savings', style: TextStyle(color: black)),
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
      ),
      body: Container(
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
                    'Dafa Putra',
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
                          top: 40,
                          child: Text(
                            'Pemasukan : Rp 2.000.000',
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: kWhiteColor),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          top: 80,
                          child: Text(
                            'Pengeluaran : Rp 700.000',
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: kWhiteColor),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          top: 120,
                          child: Text(
                            'Sisa : Rp 1.300.000',
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: kWhiteColor),
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
            // ListView.builder(
            //   itemCount: transaksiSavings.length,
            //   padding: EdgeInsets.only(left: 16, right: 16),
            //   shrinkWrap: true,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       height: 76,
            //       margin: EdgeInsets.only(bottom: 13),
            //       padding: EdgeInsets.fromLTRB(24, 12, 22, 12),
            //       decoration: BoxDecoration(
            //         color: kWhiteColor,
            //         borderRadius: BorderRadius.circular(15),
            //         boxShadow: [
            //           BoxShadow(
            //               color: kTenBlackColor,
            //               blurRadius: 10,
            //               spreadRadius: 5,
            //               offset: Offset(8.0, 8.0))
            //         ],
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Row(
            //             children: [
            //               Container(
            //                 height: 57,
            //                 width: 57,
            //                 decoration: BoxDecoration(
            //                   shape: BoxShape.circle,
            //                   image: DecorationImage(
            //                     image: AssetImage(transaksiSavings[index].icon),
            //                   ),
            //                 ),
            //               ),
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: <Widget>[
            //                   Text(
            //                     transaksiSavings[index].nama,
            //                     style: GoogleFonts.inter(
            //                         fontSize: 18,
            //                         fontWeight: FontWeight.w700,
            //                         color: kBlackColor),
            //                   ),
            //                 ],
            //               )
            //             ],
            //           ),
            //           Row(
            //             children: <Widget>[
            //               Text(
            //                 transaksiSavings[index].total,
            //                 style: GoogleFonts.inter(
            //                     fontSize: 15,
            //                     fontWeight: FontWeight.w700,
            //                     color: kBlueColor),
            //               )
            //             ],
            //           )
            //         ],
            //       ),
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
