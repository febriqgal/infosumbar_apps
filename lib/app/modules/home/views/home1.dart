import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infosumbar/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class Home1 extends StatelessWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance
        .collection('berita')
        .orderBy('urutan', descending: true)
        .snapshots();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: collectionStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            List<DocumentSnapshot> semuaStory =
                snapshot.data?.docs as List<DocumentSnapshot>;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Image.asset(
                    'assets/infosumbar.png',
                    color: Colors.red,
                    width: 150,
                  ),
                  centerTitle: true,
                  pinned: false,
                  snap: false,
                  floating: true,
                ),
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
                                      highlightColor: const Color.fromARGB(
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
    );
  }
}
