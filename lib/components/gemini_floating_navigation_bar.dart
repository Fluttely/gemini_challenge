import 'package:flutter/material.dart';

class GeminiFloatingNavigationBar extends StatelessWidget {
  final void Function(int?) onNavigate;
  final TabController floatingNavigationBarTabController;

  const GeminiFloatingNavigationBar({
    super.key,
    required this.onNavigate,
    required this.floatingNavigationBarTabController,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      snap: false,
      toolbarHeight: 96,
      surfaceTintColor: Colors.transparent,
      forceElevated: false,
      forceMaterialTransparency: false,
      titleSpacing: 0,
      title: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          borderRadius: BorderRadius.circular(32),
        ),
        child: SizedBox(
          width: 720,
          height: 32,
          child: Center(
            child: TabBar(
              dividerColor: Colors.transparent,
              controller: floatingNavigationBarTabController,
              indicatorPadding: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              dividerHeight: 0,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey.shade600,
              automaticIndicatorColorAdjustment: true,
              indicatorWeight: 1,
              indicatorSize: TabBarIndicatorSize.label,
              splashBorderRadius: BorderRadius.circular(6),
              onTap: onNavigate,
              tabs: const <Widget>[
                Tab(text: 'The Gemini era'),
                Tab(text: 'Capabilities'),
                Tab(text: 'Hands-on'),
                Tab(text: 'Safety'),
                Tab(text: 'Bard'),
                Tab(text: 'Build with Gemini'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
