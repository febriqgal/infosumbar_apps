import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/detailberita_controller.dart';

class DetailberitaView extends GetView<DetailberitaController> {
  const DetailberitaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<DocumentSnapshot<Object?>>(
      future: controller.getBerita1(Get.arguments),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String?, dynamic> dataaa =
              snapshot.data?.data() as Map<String?, dynamic>;
          return SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          color: Colors.grey,
                          width: Get.width,
                          height: 300,
                          child: ZoomOverlay(
                            minScale: 0.5, // Optional
                            maxScale: 3.0, // Optional
                            twoTouchOnly: true, //(
                            child: Image.network(
                              dataaa['gambar'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 280,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Container(
                              height: 50,
                              width: Get.width,
                              color: Colors.grey[50],
                              child: Column(
                                children: [
                                  const SizedBox(height: 5),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      height: 7,
                                      width: 100,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              '${dataaa['judul']}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: ClipOval(
                                      child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image.network(
                                          '${dataaa['photopenulis']}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${dataaa['namapenulis']}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '${dataaa['tanggal']}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              '${dataaa['isi']}',
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  iconTheme: const IconThemeData(color: Colors.white),
                )
              ],
            ),
          );
        } else {
          return Center(
            child: LottieBuilder.asset('assets/loading.json'),
          );
        }
      },
    ));
  }
}
