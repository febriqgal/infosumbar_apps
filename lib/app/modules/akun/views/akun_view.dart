import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:infosumbar/app/routes/app_pages.dart';

import '../controllers/akun_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final googleUser = GoogleSignIn();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          ClipOval(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: Image.network(
                user!.photoURL.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Febriqgal Purnama'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 0.1,
                  offset: Offset(0, 9),
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    'assets/person.svg',
                    color: Colors.red,
                  ),
                  title: const Text('Edit Profile'),
                  trailing: SvgPicture.asset(
                    'assets/arrowright.svg',
                    color: Colors.red,
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    'assets/person.svg',
                    color: Colors.red,
                  ),
                  title: const Text('Berita Saya'),
                  trailing: SvgPicture.asset(
                    'assets/arrowright.svg',
                    color: Colors.red,
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    'assets/person.svg',
                    color: Colors.red,
                  ),
                  title: const Text('Video Saya'),
                  trailing: SvgPicture.asset(
                    'assets/arrowright.svg',
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 0.1,
                  offset: Offset(0, 9),
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    'assets/person.svg',
                    color: Colors.red,
                  ),
                  title: const Text('Edit Profile'),
                  trailing: SvgPicture.asset(
                    'assets/arrowright.svg',
                    color: Colors.red,
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    'assets/person.svg',
                    color: Colors.red,
                  ),
                  title: const Text('Berita Saya'),
                  trailing: SvgPicture.asset(
                    'assets/arrowright.svg',
                    color: Colors.red,
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    'assets/person.svg',
                    color: Colors.red,
                  ),
                  title: const Text('Video Saya'),
                  trailing: SvgPicture.asset(
                    'assets/arrowright.svg',
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 0.1,
                  offset: Offset(0, 9),
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            child: ListTile(
              onTap: () async {
                await googleUser.signOut();
                await FirebaseAuth.instance.signOut();
                Get.offAllNamed(Routes.LOGIN);
              },
              title: const Center(
                child: Text(
                  'Keluar',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
