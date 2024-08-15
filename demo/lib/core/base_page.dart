
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'menu_base.dart';


abstract class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});

  String getTitle(WidgetRef ref);

  @override
  ConsumerState<BasePage> createState() => _BasePageState();

  Widget child(BuildContext context, WidgetRef ref);
}

class _BasePageState extends ConsumerState<BasePage> with TickerProviderStateMixin {

  @override
  Widget build(
      BuildContext context,
      ) {

    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth <= 480;
    final bool isLargeScreen = screenWidth > 1024;
    return Scaffold(
      //drawer: const AgencyDrawer(),
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child:  Row(
          children: [
            (isSmallScreen) ? const SizedBox() : const MenuBarBase(),
            Expanded(
              child: Container(
                padding: isLargeScreen
                    ? const EdgeInsets.only(
                  left: 60,
                  top: 20,
                  right: 60,
                )
                    : const EdgeInsets.only(top: 12, right: 20, left: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.getTitle(ref) != ""
                        ? Text(

                      widget.getTitle(ref),
                      style: Theme.of(context).textTheme.titleLarge, // non-emoji characters
                      maxLines: 2,
                    )
                        : SizedBox.shrink(),
                    Expanded(child: widget.child(context, ref))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: isSmallScreen ? const MenuBarBase() : null,
    );
  }
}
