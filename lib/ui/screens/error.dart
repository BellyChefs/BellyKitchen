import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final Object? e;
  final StackTrace? stackTrace;

  const ErrorScreen({Key? key, this.e, this.stackTrace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
