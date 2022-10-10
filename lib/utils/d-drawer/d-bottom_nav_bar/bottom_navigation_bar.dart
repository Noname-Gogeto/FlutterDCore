// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:dcore/utils/d-dialog/unfinished_features_dialog.dart';
import 'package:dcore/utils/d-license/license.dart';

import '../../../constants/colors.dart';
import 'bottom_navigation_bar_item.dart';
import 'g_bottom_nav.dart';

class DBottomNavigationBar extends StatelessWidget {
  final Color? rippleColor;
  final Color? hoverColor;
  final double? iconSize;
  final Color? activeColor;
  final double? gap;
  final double? tabBorderRadius;
  final EdgeInsetsGeometry? padding;
  final Duration? duration;
  final Color? tabBackgroundColor;
  final Color? iconColor;
  final NavStyle? tabStyle;
  final List<BoxShadow>? tabActiveShadow;

  final List<DBottomNavigationItem> tabs;

  const DBottomNavigationBar({
    Key? key,
    this.rippleColor,
    this.hoverColor,
    this.iconSize,
    this.activeColor = DColorType.buttonPrimaryColorActive,
    this.gap = 5,
    this.tabBorderRadius = 100.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.duration = const Duration(milliseconds: 100),
    this.tabBackgroundColor = DColorType.componentButtonBackground,
    this.iconColor,
    this.tabStyle,
    required this.tabs,
    this.tabActiveShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: DBottomNav(
            rippleColor: rippleColor,
            hoverColor: hoverColor,
            gap: gap!,
            activeColor: activeColor,
            iconSize: iconSize,
            padding: padding!,
            duration: duration!,
            tabBackgroundColor: tabBackgroundColor!,
            iconColor: iconColor,
            tabBorderRadius: tabBorderRadius!,
            tabStyle: tabStyle,
            tabActiveShadow: tabActiveShadow,

            tabs: [
              DBottomNavigationItem(
                icon: FontAwesomeIcons.house,
                text: 'Home',
                onPressed: () {
                  showDunfinishedFeaturesDialog(context);
                },
              ),
              DBottomNavigationItem(
                icon: FontAwesomeIcons.solidHeart,
                text: 'Likes',
                onPressed: () {
                  showLicensePage(
                    context: context,
                    applicationName: 'DCore',
                    applicationIcon: Image.asset(
                      "lib/assets/images/main-icon.png",
                      height: 50,
                      width: 50,
                    ),
                    applicationVersion: '1.0.0',
                    applicationLegalese: '© 2021 DCore',
                    useRootNavigator: true,
                  );
                },
              ),
              DBottomNavigationItem(
                icon: FontAwesomeIcons.magnifyingGlass,
                text: 'Search',
                onPressed: () {
                  showDLicense(context);
                },
              ),
              const DBottomNavigationItem(
                icon: FontAwesomeIcons.solidUser,
                text: 'Profile',
              ),
            ],
            // selectedIndex: _selectedIndex,
            // onTabChange: (index) {
            //   setState(() {
            //     _selectedIndex = index;
            //   });
            // },
          ),
        ),
      ),
    );
  }
}
