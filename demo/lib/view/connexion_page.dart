
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConnexionPage extends ConsumerWidget {
  ConnexionPage({super.key});

  final GlobalKey<FormState> _keyForm = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      return Scaffold(
        body: SafeArea(
          child: _formContent(context, ref),
        ),
      );

  }

  Widget _formContent(BuildContext context, WidgetRef ref) {
    final spacer = SizedBox(height: 12,);
    return Form(
      key: _keyForm,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          spacer,
          Text(
            "Connexion",
            maxLines: 2,
          ),spacer,
          FilledButton(
            onPressed: () => _validForm(context, ref),
            child: Text(
              "Connexion",
            ),
          )
        ],
      ),
    );
  }

  Future<void> _validForm(BuildContext context, WidgetRef ref) async {

   context.go("/home");
  }
}
