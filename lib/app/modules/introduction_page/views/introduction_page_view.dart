import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infosumbar/app/modules/login/views/login_view.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_page_controller.dart';

class IntroductionPageView extends GetView<IntroductionPageController> {
  const IntroductionPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionSlider(
      selectedDotColor: Colors.red,
      skip: const Text("Lewati"),
      next: const Text("Lanjut"),
      done: const Text("Login"),
      onDone: const LoginView(),
      items: [
        IntroductionSliderItem(
          image: LottieBuilder.asset(
            'assets/intro1.json',
            width: 250,
          ),
          title: 'Berita Terupdate',
          description:
              "Dapatkan selalu berita terbaru,\ndimanapun digenggamanmu.",
        ),
        IntroductionSliderItem(
          image: LottieBuilder.asset(
            'assets/intro2.json',
            height: 250,
          ),
          title: "Berita Daerah",
          description: "Berita terbaru dari berbagai daerah disumbar",
        ),
        IntroductionSliderItem(
          image: Image.asset(
            'assets/infosumbar.png',
            height: 200,
            color: Colors.red,
          ),
          title: "",
          description: "",
        ),
      ],
    ));
  }
}
