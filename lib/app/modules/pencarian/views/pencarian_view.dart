import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pencarian_controller.dart';

class PencarianView extends GetView<PencarianController> {
  const PencarianView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Cari Berita',
            border: InputBorder.none,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'COMING SOON!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
