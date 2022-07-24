import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get/get.dart';
import 'package:infosumbar/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LottieBuilder.asset(
              'assets/login3.json',
              frameRate: FrameRate.max,
              height: 400,
            ),
            BounceInLeft(
              delay: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailLoginC,
                  autocorrect: false,
                  cursorColor: Colors.red,
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintText: 'Email',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            //LOGIN PASSWORD
            BounceInLeft(
              delay: const Duration(milliseconds: 400),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: controller.passLoginC,
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
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            //LUPA PASSWORD
            BounceInLeft(
              delay: const Duration(milliseconds: 300),
              child: GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      child: Container(
                        height: Get.height * 0.5,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              'Reset Password',
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 20),
                            BounceInLeft(
                              delay: const Duration(milliseconds: 500),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: controller.emailResetC,
                                  autocorrect: false,
                                  cursorColor: Colors.red,
                                  style: const TextStyle(color: Colors.grey),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    hintText: 'Email',
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            BounceInLeft(
                              delay: const Duration(milliseconds: 400),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(Get.width, 20),
                                    primary: Colors.red,
                                  ),
                                  onPressed: () async {
                                    bool result =
                                        await InternetConnectionChecker()
                                            .hasConnection;
                                    if (result == true) {
                                    } else {
                                      Get.snackbar(
                                        '-',
                                        '-',
                                        titleText: const Center(
                                          child: Text(
                                            '😴',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        messageText: const Center(
                                            child: Text(
                                                'Tidak ada koneksi internet')),
                                        snackStyle: SnackStyle.GROUNDED,
                                        backgroundColor: Colors.white,
                                        barBlur: 0.5,
                                      );
                                    }
                                  },
                                  child: const Text('Kirim',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      'Lupa Password?',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //LOGIN BUTTON
            BounceInLeft(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    onPrimary: Colors.white,
                    fixedSize: Size(Get.width, 40),
                    primary: Color(Colors.red.value),
                  ),
                  onPressed: () async {
                    bool result =
                        await InternetConnectionChecker().hasConnection;
                    if (result == true) {
                      await controller.login();
                    } else {
                      Get.snackbar(
                        '-',
                        '-',
                        titleText: const Center(
                          child: Text(
                            '😴',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        messageText: const Center(
                            child: Text('Tidak ada koneksi internet')),
                        snackStyle: SnackStyle.GROUNDED,
                        backgroundColor: Colors.white,
                        barBlur: 0.5,
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            //REGISTER BUTTON
            BounceInLeft(
              delay: const Duration(milliseconds: 200),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onSurface: Colors.red,
                    onPrimary: Colors.red,
                    surfaceTintColor: Colors.red,
                    shadowColor: Colors.white,
                    elevation: 0,
                    fixedSize: Size(Get.width, 40),
                    side: const BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  onPressed: () {
                    Get.bottomSheet(
                      isScrollControlled: true,
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        child: Container(
                          height: Get.height * 0.5,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Membuat Akun',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              //Daftar Email
                              BounceInLeft(
                                delay: const Duration(milliseconds: 500),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: controller.emailDaftarC,
                                    autocorrect: false,
                                    cursorColor: Colors.red,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      hintText: 'Email',
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              //Daftar Password
                              BounceInLeft(
                                delay: const Duration(milliseconds: 400),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: controller.passDaftarC,
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      hintText: 'Password',
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              BounceInLeft(
                                delay: const Duration(milliseconds: 300),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      onPrimary: Colors.white,
                                      fixedSize: Size(Get.width, 40),
                                      primary: Color(Colors.red.value),
                                    ),
                                    onPressed: () async {
                                      bool result =
                                          await InternetConnectionChecker()
                                              .hasConnection;
                                      if (result == true) {
                                        controller.singup();
                                      } else {
                                        Get.snackbar(
                                          '-',
                                          '-',
                                          titleText: const Center(
                                            child: Text(
                                              '😴',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          messageText: const Center(
                                              child: Text(
                                                  'Tidak ada koneksi internet')),
                                          snackStyle: SnackStyle.GROUNDED,
                                          backgroundColor: Colors.white,
                                          barBlur: 0.5,
                                        );
                                      }
                                    },
                                    child: const Text(
                                      'Daftar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Belum punya akun? Daftar',
                    style: TextStyle(color: Color(Colors.red.value)),
                  ),
                ),
              ),
            ),
            //login with google
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            const Center(
              child: Text(
                'Atau',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 10),
            BounceInLeft(
              delay: const Duration(milliseconds: 200),
              child: GestureDetector(
                onTap: () async {
                  Get.dialog(
                    Center(
                      child: LottieBuilder.asset('assets/loading.json',
                          frameRate: FrameRate.max),
                    ),
                  );
                  await controller.signInWithGoogle();
                  Get.offAllNamed(Routes.HOME);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/google.svg',
                        height: 20,
                      ),
                      const Text(
                        '  Login dengan Google',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
