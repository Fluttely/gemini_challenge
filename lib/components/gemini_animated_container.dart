import 'package:flutter/material.dart';

class GeminiAnimatedContainer extends StatefulWidget {
  final String label;
  final double beginRotation;
  final double endRotation;
  final double beginSize;
  final double endSize;
  final double beginBorderRadius;
  final double endBorderRadius;

  const GeminiAnimatedContainer({
    super.key,
    required this.label,
    required this.beginRotation,
    required this.endRotation,
    required this.beginSize,
    required this.endSize,
    required this.beginBorderRadius,
    required this.endBorderRadius,
  });

  @override
  State<GeminiAnimatedContainer> createState() =>
      _GeminiAnimatedContainerState();
}

class _GeminiAnimatedContainerState extends State<GeminiAnimatedContainer>
    with SingleTickerProviderStateMixin {
  bool selected = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(PointerEvent details) {
    setState(() {
      selected = true;
    });
    _controller.forward();
  }

  void _onExit(PointerEvent details) {
    setState(() {
      selected = false;
    });
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: Stack(
        children: [
          Center(
            child: RotationTransition(
              turns: Tween(begin: widget.beginRotation, end: widget.endRotation)
                  .animate(_controller),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: const [
                      Color(0xff4e87ee),
                      Color(0xffe8d1bc),
                      Color(0xffe8d1bc),
                    ],
                    begin:
                        selected ? Alignment.bottomLeft : Alignment.centerLeft,
                    end: selected ? Alignment.topRight : Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(selected
                      ? widget.endBorderRadius + 5
                      : widget.beginBorderRadius + 5),
                ),
                child: AnimatedContainer(
                  margin: const EdgeInsets.all(5),
                  width: selected ? widget.endSize : widget.beginSize,
                  height: selected ? widget.endSize : widget.beginSize,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(selected
                        ? widget.endBorderRadius
                        : widget.beginBorderRadius),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              widget.label,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
