

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuBarBase extends StatelessWidget {
  const MenuBarBase({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {

      final screenWidth = MediaQuery.of(context).size.width;
      final bool isSmallScreen = screenWidth <= 480;

      return Container(
        width: isSmallScreen ? null : 76,
        height: isSmallScreen ? 64 : null,
        color: Theme.of(context).primaryColor,
        child: isSmallScreen
            ? Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: returnWidgetList(context),
        ))
            : Padding(padding: const EdgeInsets.symmetric(vertical: 36), child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: returnWidgetList(context),
        )),
      );
    });
  }

  List<Widget> returnWidgetList(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth <= 480;

    return [
      if (isSmallScreen) const SizedBox() else Padding(padding: const EdgeInsets.only(bottom: 8), child: CircleAvatar(
        radius: 20,
        child: Text("SID"),
      )),
      const MenuIconCore(
        "/home",
        Icons.home_outlined,
        tooltip: "home",
      ),
      const MenuIconCore(
        "/home/skills",
        Icons.search_outlined,
        tooltip: "skills",
      ),

      const MenuIconCore(
        "/admin",
        Icons.admin_panel_settings_outlined,
        tooltip: "Administration",
      ),
      const Spacer(),
      isSmallScreen
          ? Padding(padding: const EdgeInsets.only(bottom: 8), child: CircleAvatar(
    radius: 20,
    child: Text("SID"),
    )) : SizedBox.shrink()

    ];
  }
}

class MenuIconCore extends StatelessWidget {
  const MenuIconCore(this.routeName, this.icon, {this.tooltip, super.key});

  final String routeName;
  final String? tooltip;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),

      child: IconButton(
        iconSize: 24,
        splashColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          context.go(routeName);
        },
        isSelected: GoRouterState.of(context).uri.toString() == routeName,
        enableFeedback: true,
        style: IconButton.styleFrom(
          focusColor: colors.onSurfaceVariant.withOpacity(0.12),
          highlightColor: colors.onSurface.withOpacity(0.12),
        ).copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white.withOpacity(0.4);
            }
            if (states.contains(WidgetState.hovered)) {
              return Colors.white.withOpacity(0.2);
            }
            return Colors.transparent;
          }),
        ),
        tooltip: tooltip ?? routeName,
        icon: Icon(icon),
      ),
    );
  }
}
