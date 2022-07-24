import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infosumbar/app/modules/berita_utama/controllers/berita_utama_controller.dart';
import 'package:infosumbar/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class BeritautamaView extends GetView<BeritaUtamaController> {
  const BeritautamaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BeritaUtamaController());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Berita Utama',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.red,
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Padang',
              ),
              Tab(
                text: 'Pesisir Selatan',
              ),
              Tab(
                text: 'Padang Panjang',
              ),
              Tab(
                text: 'Bukit Tinggi',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Padang
            StreamBuilder<QuerySnapshot>(
              stream: controller.collectionStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  List<DocumentSnapshot> semuaStory =
                      snapshot.data?.docs as List<DocumentSnapshot>;
                  return CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return ListTile(
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
                                        : Shimmer.fromColors(
                                            direction: ShimmerDirection.ltr,
                                            baseColor: const Color.fromARGB(
                                                255, 238, 238, 238),
                                            highlightColor:
                                                const Color.fromARGB(
                                                    255, 221, 217, 217),
                                            child: Container(
                                              color: Colors.white,
                                            ),
                                          );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: LottieBuilder.asset(
                                          'assets/erorimage.json'),
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
                        }, childCount: semuaStory.length),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            // Pesisir Selatan
            ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            width: Get.width,
                            height: 200,
                            child: Image.network(
                              'https://picsum.photos/id/${237 + index}/200/300',
                              loadingBuilder: (context, child, progress) {
                                return progress == null
                                    ? child
                                    : Shimmer.fromColors(
                                        direction: ShimmerDirection.ltr,
                                        baseColor: const Color.fromARGB(
                                            255, 238, 238, 238),
                                        highlightColor: const Color.fromARGB(
                                            255, 221, 217, 217),
                                        child: Container(
                                          color: Colors.white,
                                        ),
                                      );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LottieBuilder.asset(
                                      'assets/erorimage.json',
                                      height: 75,
                                      frameRate: FrameRate.max,
                                    ),
                                    const Text('Gambar tidak ditemukan🙁'),
                                  ],
                                );
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Text('Sumber ke ${index + 1}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Text(
                          'Judul Berita ke ${index + 1}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Text(
                          'Tanggal ke ${index + 1}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                itemCount: 20),
            // Padang Panjang
            ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            width: Get.width,
                            height: 200,
                            child: Image.network(
                              'https://picsum.photos/id/${237 + index}/200/300',
                              loadingBuilder: (context, child, progress) {
                                return progress == null
                                    ? child
                                    : Shimmer.fromColors(
                                        direction: ShimmerDirection.ltr,
                                        baseColor: const Color.fromARGB(
                                            255, 238, 238, 238),
                                        highlightColor: const Color.fromARGB(
                                            255, 221, 217, 217),
                                        child: Container(
                                          color: Colors.white,
                                        ),
                                      );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LottieBuilder.asset(
                                      'assets/erorimage.json',
                                      height: 75,
                                      frameRate: FrameRate.max,
                                    ),
                                    const Text('Gambar tidak ditemukan🙁'),
                                  ],
                                );
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Text('Sumber ke ${index + 1}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Text(
                          'Judul Berita ke ${index + 1}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Text(
                          'Tanggal ke ${index + 1}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                itemCount: 20),
            // Bukit Tinggi
            ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            width: Get.width,
                            height: 200,
                            child: Image.network(
                              'https://picsum.photos/id/${237 + index}/200/300',
                              loadingBuilder: (context, child, progress) {
                                return progress == null
                                    ? child
                                    : Shimmer.fromColors(
                                        direction: ShimmerDirection.ltr,
                                        baseColor: const Color.fromARGB(
                                            255, 238, 238, 238),
                                        highlightColor: const Color.fromARGB(
                                            255, 221, 217, 217),
                                        child: Container(
                                          color: Colors.white,
                                        ),
                                      );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LottieBuilder.asset(
                                      'assets/erorimage.json',
                                      height: 75,
                                      frameRate: FrameRate.max,
                                    ),
                                    const Text('Gambar tidak ditemukan🙁'),
                                  ],
                                );
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Text('Sumber ke ${index + 1}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Text(
                          'Judul Berita ke ${index + 1}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Text(
                          'Tanggal ke ${index + 1}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                itemCount: 20),
          ],
        ),
      ),
    );
  }
}
