import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gemini_challenge/components/gemini_app_bar.dart';
import 'package:gemini_challenge/components/gemini_floating_navigation_bar.dart';
import 'package:gemini_challenge/main.dart';
import 'package:gemini_challenge/pages/components/technologies_area_1.dart';
import 'package:gemini_challenge/pages/components/technologies_area_2.dart';
import 'package:gemini_challenge/pages/components/technologies_area_3.dart';
import 'package:gemini_challenge/pages/components/technologies_area_4.dart';

class TecnologiesPage extends StatefulWidget {
  const TecnologiesPage({
    super.key,
  });

  @override
  State<TecnologiesPage> createState() => _TecnologiesPageState();
}

class _TecnologiesPageState extends State<TecnologiesPage>
    with TickerProviderStateMixin {
  late List<GlobalKey> areaKeys;

  late final TabController appBarTabController;
  late final TabController floatingNavigationBarTabController;

  @override
  void initState() {
    appBarTabController = TabController(length: 4, vsync: this);
    appBarTabController.animateTo(1);
    floatingNavigationBarTabController = TabController(length: 6, vsync: this);
    areaKeys = [
      GlobalKeys.appBarKey,
      GlobalKeys.area2Key,
      GlobalKeys.area3Key,
      GlobalKeys.area4Key
    ];
    super.initState();
  }

  @override
  void dispose() {
    appBarTabController.dispose();
    floatingNavigationBarTabController.dispose();
    super.dispose();
  }

  Future<void> _scrollToKey(GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(context,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  void _checkVisibility(ScrollMetrics metrics) {
    final renderBox1 = GlobalKeys.appBarKey.currentContext?.findRenderObject()
        as RenderConstrainedBox;
    final renderBox2 = GlobalKeys.area2Key.currentContext?.findRenderObject()
        as RenderConstrainedBox;
    final renderBox3 = GlobalKeys.area3Key.currentContext?.findRenderObject()
        as RenderConstrainedBox;
    final renderBox4 = GlobalKeys.area4Key.currentContext?.findRenderObject()
        as RenderConstrainedBox;

    final position1 = renderBox1.localToGlobal(Offset.zero).dy;
    final position2 = renderBox2.localToGlobal(Offset.zero).dy * 2;
    final position3 = renderBox3.localToGlobal(Offset.zero).dy * 2;
    final position4 = renderBox4.localToGlobal(Offset.zero).dy * 2;

    if (metrics.pixels >= position1 && metrics.pixels <= position2) {
      floatingNavigationBarTabController.animateTo(0);
    } else if (metrics.pixels > position2 && metrics.pixels <= position3) {
      floatingNavigationBarTabController.animateTo(1);
    } else if (metrics.pixels > position3 && metrics.pixels <= position4) {
      floatingNavigationBarTabController.animateTo(2);
    } else if (metrics.pixels > position4) {
      floatingNavigationBarTabController.animateTo(3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            colors: [
              Color(0xff1f2433),
              Colors.black,
            ],
            radius: 0.8,
          ),
        ),
        child: NotificationListener(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              _checkVisibility(notification.metrics);
            }
            return true;
          },
          child: CustomScrollView(
            slivers: [
              GeminiAppBar(appBarTabController: appBarTabController),
              const TecnologiesArea1(),
              GeminiFloatingNavigationBar(
                floatingNavigationBarTabController:
                    floatingNavigationBarTabController,
                onNavigate: (index) {
                  if (index! < areaKeys.length) _scrollToKey(areaKeys[index]);
                },
              ),
              const TechnologiesArea2(),
              const TechnologiesArea3(),
              const TechnologiesArea4(),
            ],
          ),
        ),
      ),
    );
  }
}
