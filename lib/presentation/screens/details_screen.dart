import 'package:flutter/material.dart';
import 'package:movie_mania/presentation/widgets/exit_dialog_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("Details screen"),
      ),
    );
  }
}
