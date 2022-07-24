import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infosumbar/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';

import '../controllers/beritasaya_controller.dart';

class BeritasayaView extends GetView<BeritasayaController> {
  const BeritasayaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Saya'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.collectionStream,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (context, index) {
              if (snapshot.connectionState == ConnectionState.active) {
                List<DocumentSnapshot> semuaStory =
                    snapshot.data?.docs as List<DocumentSnapshot>;
                return ListTile(
                  onLongPress: () {
                    Get.toNamed(Routes.EDIT_BERITA,
                        arguments: semuaStory[index].id);
                  },
                  onTap: () {
                    Get.toNamed(Routes.DETAILBERITA,
                        arguments: semuaStory[index].id);
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SizedBox(
                      width: 100,
                      child: Image.network(
                        '${(semuaStory[index].data() as Map<String, dynamic>)['gambar']}',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          return progress == null
                              ? child
                              : Center(
                                  child: LottieBuilder.asset(
                                      'assets/loading.json'),
                                );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: LottieBuilder.asset('assets/erorimage.json'),
                          );
                        },
                      ),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${(semuaStory[index].data() as Map<String, dynamic>)['judul']}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${(semuaStory[index].data() as Map<String, dynamic>)['sumber']}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                      '${(semuaStory[index].data() as Map<String, dynamic>)['tanggal']}'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
