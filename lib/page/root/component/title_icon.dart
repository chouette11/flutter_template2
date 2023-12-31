import 'package:flutter/material.dart';
import 'package:flutter_template/util/constant/text_style_constant.dart';

class TitleIcon extends StatelessWidget {
  const TitleIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            const SizedBox(height: 48),
            Image.asset('assets/images/title_icon.png', height: 252),
          ],
        ),
        const Text(
          'AI人狼',
          style: TextStyleConstant.bold60,
        )
      ],
    );
  }
}
