import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BouncingSvgLoader extends StatefulWidget {
  final double size; // Allows setting the size of the loader
  final String svgAssetPath; // The path to the SVG asset

  const BouncingSvgLoader({
    Key? key,
    required this.svgAssetPath,
    this.size = 50.0,
  }) : super(key: key);

  @override
  _BouncingSvgLoaderState createState() => _BouncingSvgLoaderState();
}

class _BouncingSvgLoaderState extends State<BouncingSvgLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _bounceAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -10 * _bounceAnimation.value),
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          ),
        );
      },
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: SvgPicture.asset(widget.svgAssetPath),
      ),
    );
  }
}
