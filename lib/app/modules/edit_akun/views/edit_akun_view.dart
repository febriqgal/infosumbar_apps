import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_akun_controller.dart';

class EditAkunView extends GetView<EditAkunController> {
  const EditAkunView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Akun'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Get.bottomSheet(
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Colors.white,
                    height: Get.height * 0.3,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8),
                          const Text(
                            'Ubah Nama',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          BounceInLeft(
                            delay: const Duration(milliseconds: 400),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: controller.ubahNamaC,
                                autocorrect: false,
                                style: const TextStyle(color: Colors.grey),
                                cursorColor: Colors.red,
                                decoration: InputDecoration(
                                  prefixIconColor: Colors.grey,
                                  prefixIcon: const Icon(
                                    Icons.key,
                                    color: Colors.grey,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  hintText: 'Ubah Nama',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () async {
                              await controller
                                  .ubahNama(controller.ubahNamaC.text);
                            },
                            child: const Text('Simpan'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            title: const Text('Ubah Nama'),
          ),
          ListTile(
            onTap: () {
              Get.bottomSheet(
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Colors.white,
                    height: Get.height * 0.3,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8),
                          const Text(
                            'Ubah Password',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          BounceInLeft(
                            delay: const Duration(milliseconds: 400),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: controller.passwordBaruC,
                                obscureText: true,
                                autocorrect: false,
                                style: const TextStyle(color: Colors.grey),
                                cursorColor: Colors.red,
                                decoration: InputDecoration(
                                  prefixIconColor: Colors.grey,
                                  prefixIcon: const Icon(
                                    Icons.key,
                                    color: Colors.grey,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  hintText: 'Password',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              controller
                                  .ubahPassword(controller.passwordBaruC.text);
                            },
                            child: const Text('Simpan'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            title: const Text('Ubah Password'),
          ),
          ListTile(
            onTap: () {
              Get.bottomSheet(
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Colors.white,
                    height: Get.height * 0.3,
                    child: Center(
                      child: Column(
                        children: [
                          BounceInLeft(
                            delay: const Duration(milliseconds: 400),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                controller.pickFotoProfile();
                              },
                              icon: const Icon(Icons.camera_alt),
                              label: const Text('Pilih Foto'),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                controller.ubahFotoProfile();
                              },
                              child: const Text('Simpan')),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            title: const Text('Ubah Foto Profile'),
          ),
        ],
      ),
    );
  }
}
