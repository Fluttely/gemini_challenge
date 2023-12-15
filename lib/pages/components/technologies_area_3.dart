import 'package:flutter/material.dart';
import 'package:gemini_challenge/main.dart';

class TechnologiesArea3 extends StatelessWidget {
  const TechnologiesArea3({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        key: GlobalKeys.area3Key,
        height: MediaQuery.of(context).size.height * 0.8,
        color: Colors.black,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'public/assets/images/video.png',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
