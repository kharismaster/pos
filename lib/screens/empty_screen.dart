import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text("Halaman Rencana"),
      // ),
      body: Center(
        child: Text('Halaman Rencana'),
      ),
    );
  }
}
