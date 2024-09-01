import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/gen/colors.gen.dart';

class BarWidget extends StatefulWidget {
  const BarWidget({
    required this.gain,
    required this.color,
    required this.maxGain,
    required this.text,
    super.key,
  });
  final double gain;
  final Color color;
  final String text;
  final double maxGain;

  @override
  State<BarWidget> createState() => _BarWidgetState();
}

class _BarWidgetState extends State<BarWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _heightAnimation = Tween<double>(begin: 0, end: (widget.gain / widget.maxGain) * 150).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _heightAnimation,
            builder: (context, child) => Container(
              width: 32,
              height: _heightAnimation.value,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: widget.color,
              ),
            ),
          ),
          Text(
            widget.text,
            style: context.appTheme.textTheme.bodySmall?.copyWith(
              fontSize: 10,
              color: ColorName.onBackground,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
