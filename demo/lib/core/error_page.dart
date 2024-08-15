
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    this.error,
    this.isNetwork = false,
    this.stack,
  });

  final String? error;
  final bool isNetwork;
  final StackTrace? stack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isNetwork
          ? null
          : AppBar(
              title: Text("404 not found"),
            ),
      body: Center(
        child: isNetwork
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(error ?? ""),
                  Text(stack.toString()),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(error ?? ""),
                  TextButton(
                    onPressed: () => GoRouter.of(context).push("/home"),
                    child: const Text("Back to Home"),
                  ),
                ],
              ),
      ),
    );
  }
}
