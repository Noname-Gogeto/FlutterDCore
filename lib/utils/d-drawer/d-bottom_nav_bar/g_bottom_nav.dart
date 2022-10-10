import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'bottom_navigation_bar_item.dart';

enum NavStyle {
  row,
  column,
}

/// This file is clone of [gNavBar package] with some changes form me
class DBottomNav extends StatefulWidget {
  const DBottomNav({
    Key? key,
    required this.tabs,
    this.selectedIndex = 0,
    this.onTabChange,
    this.gap = 5,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.activeColor = DColorType.buttonPrimaryColorActive,
    this.iconColor = DColorType.secondaryColor,
    this.rippleColor,
    this.hoverColor,
    this.backgroundColor = Colors.transparent,
    this.tabBackgroundColor = DColorType.componentButtonBackground,
    this.tabBorderRadius = 100.0,
    this.iconSize = 20,
    this.textStyle,
    this.curve = Curves.easeInCubic,
    this.tabMargin = EdgeInsets.zero,
    this.debug = false,
    this.duration = const Duration(milliseconds: 100),
    this.tabBorder,
    this.tabActiveBorder,
    this.tabShadow,
    this.tabActiveShadow,
    this.haptic = true,
    this.tabBackgroundGradient,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.tabStyle = NavStyle.row,
    this.textSize,
  }) : super(key: key);

  final List<DBottomNavigationItem> tabs;
  final int selectedIndex;
  final ValueChanged<int>? onTabChange;
  final double gap;
  final double tabBorderRadius;
  final double? iconSize;
  final Color? activeColor;
  final Color backgroundColor;
  final Color tabBackgroundColor;
  final Color? iconColor;
  final Color? rippleColor;
  final Color? hoverColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry tabMargin;
  final TextStyle? textStyle;
  final Duration duration;
  final Curve curve;
  final bool debug;
  final bool haptic;
  final Border? tabBorder;
  final Border? tabActiveBorder;
  final List<BoxShadow>? tabShadow;
  final List<BoxShadow>? tabActiveShadow;
  final Gradient? tabBackgroundGradient;
  final MainAxisAlignment mainAxisAlignment;
  final NavStyle? tabStyle;
  final double? textSize;

  @override
  State<DBottomNav> createState() => _DBottomNavState();
}

class _DBottomNavState extends State<DBottomNav> {
  late int selectedIndex;
  bool clickable = true;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  void didUpdateWidget(DBottomNav oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      selectedIndex = widget.selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.backgroundColor,
        child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            children: widget.tabs
                .map((tab) => DBottomNavigationItem(
                      textSize: widget.textSize,
                      tabStyle: widget.tabStyle,
                      key: tab.key,
                      border: tab.border ?? widget.tabBorder,
                      activeBorder: tab.activeBorder ?? widget.tabActiveBorder,
                      shadow: tab.shadow ?? widget.tabShadow,
                      activeShadow: tab.activeShadow ??
                          widget.tabActiveShadow ??
                          [
                            BoxShadow(
                              color: DColorType.themeColor.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: const Offset(0, 0), // changes position of shadow
                            ),
                          ],
                      borderRadius: tab.borderRadius ??
                          BorderRadius.all(
                            Radius.circular(widget.tabBorderRadius),
                          ),
                      debug: widget.debug,
                      margin: tab.margin ?? widget.tabMargin,
                      active: selectedIndex == widget.tabs.indexOf(tab),
                      gap: tab.gap ?? widget.gap,
                      iconActiveColor: tab.iconActiveColor ?? widget.activeColor,
                      iconColor: tab.iconColor ?? widget.iconColor,
                      iconSize: tab.iconSize ?? widget.iconSize,
                      textColor: tab.textColor ?? widget.activeColor,
                      rippleColor: tab.rippleColor ?? widget.rippleColor ?? DColorType.themeColor.withOpacity(0.3),
                      hoverColor: tab.hoverColor ?? widget.hoverColor ?? DColorType.themeColor.withOpacity(0.5),
                      padding: tab.padding ?? widget.padding,
                      textStyle: tab.textStyle ?? widget.textStyle,
                      text: tab.text,
                      icon: tab.icon,
                      haptic: widget.haptic,
                      leading: tab.leading,
                      curve: widget.curve,
                      backgroundGradient: tab.backgroundGradient ?? widget.tabBackgroundGradient,
                      backgroundColor: tab.backgroundColor ?? widget.tabBackgroundColor,
                      duration: widget.duration,
                      onPressed: () {
                        if (!clickable) return;
                        setState(() {
                          selectedIndex = widget.tabs.indexOf(tab);
                          clickable = false;
                        });

                        tab.onPressed?.call();

                        widget.onTabChange?.call(selectedIndex);

                        Future.delayed(widget.duration, () {
                          setState(() {
                            clickable = true;
                          });
                        });
                      },
                    ))
                .toList()));
  }
}
