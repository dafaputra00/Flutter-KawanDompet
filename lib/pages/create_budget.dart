import 'package:budget_ui/constants/color_constant.dart';
import 'package:budget_ui/constants/text_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBudgetPage extends StatefulWidget {
  @override
  _CreateBudgetPageState createState() => _CreateBudgetPageState();
}

class _CreateBudgetPageState extends State<CreateBudgetPage> {
  RangeValues values = RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    final double min = 0.0;
    final double max = 100.0;

    return Form(
      child: SliderTheme(
        data: SliderThemeData(
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
          trackHeight: 3,
        ),
        child: Column(
          children: [
            Text(
              'Masukan Income',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: kBlackColor,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Income'),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Needs : Wants : Savings',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: kBlackColor,
              ),
            ),
            RangeSlider(
              values: values,
              min: min,
              max: max,
              inactiveColor: Colors.blueAccent,
              divisions: 10,
              labels: RangeLabels(
                values.start.round().toString(),
                values.end.round().toString(),
              ),
              onChanged: (values) => setState(() => this.values = values),
            ),
            Container(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('0'),
                  Text('25'),
                  Text('50'),
                  Text('75'),
                  Text('100'),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextButton.icon(
              label: Text('Save'),
              icon: Icon(Icons.save),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blueAccent,
                onSurface: Colors.grey,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
