import 'package:flutter/material.dart';
import 'package:gemini_challenge/main.dart';
import 'package:gemini_challenge/theme/styles.dart';

class TechnologiesArea2 extends StatelessWidget {
  const TechnologiesArea2({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        key: GlobalKeys.area2Key,
        height: MediaQuery.of(context).size.height - 100,
        color: Colors.black,
        padding: const EdgeInsets.fromLTRB(0, 128, 0, 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const SizedBox.shrink(),
            Text(
              'Gemini is built from the ground up for\nmultimodality — reasoning seamlessly\nacross text, images, video, audio, and code.',
              textAlign: TextAlign.center,
              style: GeminiTextStyles.bodyMedium.copyWith(
                fontSize: 64,
              ),
            ),
            Column(
              children: [
                Text(
                  'The Gemini era',
                  textAlign: TextAlign.center,
                  style: GeminiTextStyles.bodyMedium.copyWith(
                    fontSize: 80,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Gemini represents a significant leap forward in how AI can help improve our\ndaily lives.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 24),
                FloatingActionButton.extended(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {},
                  label: const Text(
                    'Read the blog post',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
