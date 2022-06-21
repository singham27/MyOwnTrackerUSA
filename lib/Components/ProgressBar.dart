import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: new LinearPercentIndicator(
        // width: 100.0,
        lineHeight: 60,
        animation: true,
        animationDuration: 2500,
        percent: 0.1,
        center: Text("\$ 0.00 of \$224.00",
            style:  TextStylesProductSans.textStyles_18
                .apply(color: ColorStyle.white, )
        ),
        progressColor: ColorStyle.secondryColor,
        barRadius: Radius.circular(10),
      ),

    );
  }
}
