import 'dart:async';

import 'package:flutter_template/page/tutorial/component/tutorial_appbar.dart';
import 'package:flutter_template/page/tutorial/component/tutorial_text_field.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/util/constant/text_style_constant.dart';
import 'package:flutter_template/util/constant/color_constant.dart';
import 'package:go_router/go_router.dart';

class TutorialPage4 extends StatefulWidget {
  const TutorialPage4({super.key});

  @override
  State<TutorialPage4> createState() => _TutorialPage4State();
}

class _TutorialPage4State extends State<TutorialPage4> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => count++);
      if (count > 2) {
        context.push('/tutorial/5');
        timer.cancel();
      }
      if (count > 4) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: const TutorialAppBar(topic: '季節', counter: 120),
          backgroundColor: ColorConstant.back,
          bottomSheet: TutorialBottomSheet(
            isFlash: false,
            index: 5,
            isEnd: false,
            isTypeWriter: false,
            role: '電脳体',
            onTap: () {},
          ),
          floatingActionButton: _ScrollButton(onTap: () {}),
          body: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'あなたは電脳体陣営\n人間陣営の質問から\nAIを守り切る',
                      textAlign: TextAlign.center,
                      textStyle: TextStyleConstant.normal16,
                    ),
                  ],
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ScrollButton extends StatelessWidget {
  const _ScrollButton({required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: ColorConstant.accent,
                boxShadow: [
                  BoxShadow(
                    color: ColorConstant.black0,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: const Icon(Icons.arrow_downward_sharp, size: 28),
            ),
          ),
        ],
      ),
    );
  }
}
