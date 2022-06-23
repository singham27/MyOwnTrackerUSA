import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';

class ProgressBarCustom extends StatelessWidget {
  const ProgressBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: new LinearPercentIndicator(
        // width: 100.0,
        lineHeight: 60,
        animation: true,
        animationDuration: 2500,
        percent: 0.5,
        center: Text("\$ 112.0 of \$224.00",
            style:  TextStylesProductSans.textStyles_18
                .apply(color: ColorStyle.white, )
        ),
        progressColor: ColorStyle.secondryColor,
        barRadius: Radius.circular(10),
      ),

    );
  }
}
