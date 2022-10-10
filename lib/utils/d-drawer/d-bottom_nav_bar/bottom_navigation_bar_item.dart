/// This file is clone of [gNavBar package] with some changes form me

import 'package:dcore/constants/colors.dart';
import 'package:dcore/constants/display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show HapticFeedback;

import 'g_bottom_nav.dart';
import 'g_nav_button.dart';

class DBottomNavigationItem extends StatefulWidget {
  final bool? active;
  final bool? debug;
  final bool? haptic;
  final double? gap;
  final Color? iconColor;
  final Color? rippleColor;
  final Color? hoverColor;
  final Color? iconActiveColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final double? iconSize;
  final Function? onPressed;
  final String text;
  final IconData icon;
  final Color? backgroundColor;
  final Duration? duration;
  final Curve? curve;
  final Gradient? backgroundGradient;
  final Widget? leading;
  final BorderRadius? borderRadius;
  final Border? border;
  final Border? activeBorder;
  final List<BoxShadow>? shadow;
  final List<BoxShadow>? activeShadow;
  final String? semanticLabel;
  final NavStyle? tabStyle;
  final double? textSize;

  const DBottomNavigationItem({
    Key? key,
    this.active,
    this.haptic,
    this.backgroundColor,
    required this.icon,
    required this.text,
    this.iconColor,
    this.rippleColor,
    this.hoverColor,
    this.iconActiveColor,
    this.textColor,
    this.padding,
    this.margin,
    this.duration,
    this.debug,
    this.gap,
    this.curve,
    this.textStyle,
    this.iconSize = 16,
    this.leading,
    this.onPressed,
    this.backgroundGradient,
    this.borderRadius,
    this.border,
    this.activeBorder,
    this.shadow,
    this.activeShadow,
    this.semanticLabel,
    this.tabStyle,
    this.textSize,
  }) : super(key: key);

  @override
  State<DBottomNavigationItem> createState() => _DBottomNavigationItemState();
}

class _DBottomNavigationItemState extends State<DBottomNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticLabel ?? widget.text,
      child: DNavButton(
        textSize: widget.textSize,
        tabStyle: widget.tabStyle ?? NavStyle.row,
        borderRadius: widget.borderRadius,
        border: widget.border,
        activeBorder: widget.activeBorder,
        shadow: widget.shadow,
        activeShadow: widget.activeShadow,
        debug: widget.debug,
        duration: widget.duration,
        iconSize: widget.iconSize,
        active: widget.active,
        onPressed: () {
          if (widget.haptic!) HapticFeedback.selectionClick();
          widget.onPressed?.call();
        },
        padding: widget.padding,
        margin: widget.margin,
        gap: widget.gap,
        color: widget.backgroundColor,
        rippleColor: widget.rippleColor,
        hoverColor: widget.hoverColor,
        gradient: widget.backgroundGradient,
        curve: widget.curve,
        leading: widget.leading,
        iconActiveColor: widget.iconActiveColor,
        iconColor: widget.iconColor,
        icon: widget.icon,
        text: Text(
          widget.text,
          style: widget.textStyle ??
              TextStyle(
                fontSize: getFontSize(fontSizeType: DTextType.defaultText),
                fontWeight:
                    getFontWeight(fontWeightType: DTextType.defaultText),
                color: DColorType.buttonPrimaryColorActive,
              ),
        ),
      ),
    );
  }
}
