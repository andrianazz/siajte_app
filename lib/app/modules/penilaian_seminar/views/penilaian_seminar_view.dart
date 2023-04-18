import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/penilaian_seminar_controller.dart';

class PenilaianSeminarView extends GetView<PenilaianSeminarController> {
  const PenilaianSeminarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PenilaianSeminarView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PenilaianSeminarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
