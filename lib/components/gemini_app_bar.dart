import 'package:flutter/material.dart';
import 'package:gemini_challenge/main.dart';

class GeminiAppBar extends StatelessWidget {
  final TabController appBarTabController;
  const GeminiAppBar({
    super.key,
    required this.appBarTabController,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: false,
      snap: true,
      toolbarHeight: 64,
      surfaceTintColor: Colors.black,
      elevation: 10,
      forceElevated: false,
      forceMaterialTransparency: false,
      titleSpacing: 0,
      title: SizedBox(
        key: GlobalKeys.appBarKey,
        height: 64,
        child: Row(
          children: [
            const SizedBox(width: 16),
            Text(
              'Google',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'DeepMind',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: 32),
            SizedBox(
              width: 400,
              height: 64,
              child: TabBar(
                dividerColor: Colors.transparent,
                controller: appBarTabController,
                indicatorPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                dividerHeight: 0,
                labelColor: Colors.white,
                automaticIndicatorColorAdjustment: true,
                indicatorWeight: 1,
                indicatorSize: TabBarIndicatorSize.label,
                splashBorderRadius: BorderRadius.circular(6),
                tabs: const <Widget>[
                  Tab(text: 'About'),
                  Tab(text: 'Tecnologies'),
                  Tab(text: 'Impact'),
                  Tab(text: 'Discover'),
                ],
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.search,
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
