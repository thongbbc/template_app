import 'package:flutter/material.dart';

// ignore: must_be_immutable
class KeyboardAvoidingView extends StatelessWidget {
  KeyboardAvoidingView({@required this.child});
  Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: child),
    );
  }
}
