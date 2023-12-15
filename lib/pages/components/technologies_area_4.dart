import 'package:flutter/material.dart';
import 'package:gemini_challenge/components/gemini_animated_container.dart';
import 'package:gemini_challenge/main.dart';
import 'package:gemini_challenge/theme/styles.dart';

class TechnologiesArea4 extends StatelessWidget {
  const TechnologiesArea4({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        key: GlobalKeys.area4Key,
        height: MediaQuery.of(context).size.height * 0.8,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gemini comes in three sizes',
              style: GeminiTextStyles.bodyMedium.copyWith(
                fontSize: 64,
              ),
            ),
            const SizedBox(height: 128),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Tile(
                  animatedContainer: GeminiAnimatedContainer(
                    label: 'Ultra',
                    beginRotation: 0,
                    endRotation: 0.125,
                    beginSize: 200,
                    endSize: 160,
                    beginBorderRadius: 100,
                    endBorderRadius: 32,
                  ),
                  description:
                      'Our most capable\nand largest model for highly-\ncomplex tasks.',
                ),
                SizedBox(width: 64),
                _Tile(
                  animatedContainer: GeminiAnimatedContainer(
                    label: 'Pro',
                    beginRotation: 0,
                    endRotation: 0.125,
                    beginSize: 150,
                    endSize: 140,
                    beginBorderRadius: 32,
                    endBorderRadius: 52,
                  ),
                  description:
                      'Our best model for\nscaling across a wide range of\ntasks.',
                ),
                SizedBox(width: 64),
                _Tile(
                  animatedContainer: GeminiAnimatedContainer(
                    label: 'Nano',
                    beginRotation: 0.125,
                    endRotation: 0.250,
                    beginSize: 110,
                    endSize: 120,
                    beginBorderRadius: 32,
                    endBorderRadius: 60,
                  ),
                  description: 'Our most efficient model\nfor on-device tasks.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String description;
  final Widget animatedContainer;

  const _Tile({
    required this.description,
    required this.animatedContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 320,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 220,
            width: 220,
            child: Center(
              child: animatedContainer,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 18,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
