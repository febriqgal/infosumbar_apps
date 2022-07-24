import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengaturan_controller.dart';

class PengaturanView extends GetView<PengaturanController> {
  const PengaturanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PengaturanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PengaturanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
