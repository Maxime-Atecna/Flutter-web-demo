
import 'package:demo/core/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SkillPage extends BasePage {
  const SkillPage({super.key,});


  @override
  Widget child(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(getTitle(ref)),
    );
  }


  @override
  String getTitle(WidgetRef ref) {
    return "SKILL PAGE";
  }
}