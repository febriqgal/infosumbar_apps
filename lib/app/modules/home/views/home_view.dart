import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infosumbar/app/modules/akun/views/akun_view.dart';
import 'package:infosumbar/app/modules/berita_utama/views/berita_utama_view.dart';
import 'package:infosumbar/app/modules/home/views/home1.dart';
import 'package:infosumbar/app/modules/video/views/video_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final user = FirebaseAuth.instance.currentUser;
  int _currentIndex = 0;
  final List<Widget> _pages = <Widget>[
    const Home1(),
    const BeritautamaView(),
    const VideoView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/home.svg',
                color: _currentIndex == 0 ? Colors.red : Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/news.svg',
                color: _currentIndex == 1 ? Colors.red : Colors.grey,
              ),
              label: 'Berita Utama',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/video.svg',
                color: _currentIndex == 2 ? Colors.red : Colors.grey,
              ),
              label: 'Video',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/person.svg',
                color: _currentIndex == 3 ? Colors.red : Colors.grey,
              ),
              label: 'Akun',
            ),
          ],
        ));
  }
}
