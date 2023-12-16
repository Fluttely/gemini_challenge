import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:gemini_challenge/theme/styles.dart';

Widget delayed({
  required Duration duration,
  required Widget child,
}) {
  return DelayedDisplay(
    delay: duration,
    slidingCurve: Curves.fastLinearToSlowEaseIn,
    child: child,
  );
}

class TecnologiesArea1 extends StatelessWidget {
  const TecnologiesArea1({super.key});
  final style = GeminiTextStyles.title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: MediaQuery.of(context).size.height - 200,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 128),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  delayed(
                      duration: const Duration(milliseconds: 500),
                      child: Text('Welcome ', style: style)),
                  delayed(
                      duration: const Duration(milliseconds: 600),
                      child: Text('to', style: style)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  delayed(
                      duration: const Duration(milliseconds: 700),
                      child: Text('the ', style: style)),
                  delayed(
                      duration: const Duration(milliseconds: 800),
                      child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                                colors: [
                                  Color(0xff4e87ee),
                                  Color(0xffe8d1bc),
                                  Color(0xffe8d1bc),
                                ],
                              ).createShader(bounds),
                          child: Text('Gemini ', style: style))),
                  delayed(
                      duration: const Duration(milliseconds: 900),
                      child: Text('era', style: style)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
