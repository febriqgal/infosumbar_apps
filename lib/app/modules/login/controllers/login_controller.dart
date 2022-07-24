import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:infosumbar/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailLoginC = TextEditingController();
  TextEditingController passLoginC = TextEditingController();
  TextEditingController emailDaftarC = TextEditingController();
  TextEditingController passDaftarC = TextEditingController();
  TextEditingController emailResetC = TextEditingController();

  login() async {
    if (emailLoginC.text.isEmpty || passLoginC.text.isEmpty) {
      Get.snackbar(
        '-',
        '-',
        titleText: const Center(
          child: Text(
            'Kesalahan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        messageText:
            const Center(child: Text('Email atau password tidak boleh kosong')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
        barBlur: 0.5,
      );
    } else {
      try {
        UserCredential myUser =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailLoginC.text,
          password: passLoginC.text,
        );
        if (myUser.user!.emailVerified) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar(
            '-',
            '-',
            titleText: const Center(
              child: Text(
                'Kesalahan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            messageText: const Center(
                child: Text(
                    'Email belum diverifikasi, silahkan cek email masuk atau dispam email.')),
            snackStyle: SnackStyle.GROUNDED,
            backgroundColor: Colors.white,
            barBlur: 0.5,
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar(
            '-',
            '-',
            titleText: const Center(
              child: Text(
                'Kesalahan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            messageText: const Center(child: Text('Email tidak terdaftar')),
            snackStyle: SnackStyle.GROUNDED,
            backgroundColor: Colors.white,
            barBlur: 0.5,
          );
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
            '-',
            '-',
            titleText: const Center(
              child: Text(
                'Kesalahan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            messageText:
                const Center(child: Text('Password yang dimasukan salah')),
            snackStyle: SnackStyle.GROUNDED,
            backgroundColor: Colors.white,
            barBlur: 0.5,
          );
        }
      } catch (e) {
        Get.snackbar(
          '-',
          '-',
          titleText: const Center(
            child: Text(
              'Kesalahan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          messageText: const Center(
              child: Text(
                  'Terjadi Kesalahan, silahkan diulang lagi atau hubungi admin')),
          snackStyle: SnackStyle.GROUNDED,
          backgroundColor: Colors.white,
        );
      }
    }
  }

  singup() async {
    if (emailDaftarC.text.isEmpty || passDaftarC.text.isEmpty) {
      Get.snackbar(
        '-',
        '-',
        titleText: const Center(
          child: Text(
            'Kesalahan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        messageText:
            const Center(child: Text('Email dan password tidak boleh kosong')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
        barBlur: 0.5,
      );
    }
    try {
      UserCredential myuser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailDaftarC.text,
        password: passDaftarC.text,
      );
      await myuser.user!.sendEmailVerification();
      Get.snackbar(
        '-',
        '-',
        titleText: const Center(
          child: Text(
            'Berhasil',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        messageText: Center(
            child: Text(
          'Kami sudah mengirimkan email verifikasi ke\n${emailDaftarC.text}, silahkan cek email\nmasuk atau dispam email.',
        )),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
        barBlur: 0.5,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          '-',
          '-',
          titleText: const Center(
            child: Text(
              'Kesalahan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          messageText: const Center(
              child: Text('Kata sandi yang diberikan terlalu lemah.')),
          snackStyle: SnackStyle.GROUNDED,
          backgroundColor: Colors.white,
          barBlur: 0.5,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          '-',
          '-',
          titleText: const Center(
            child: Text(
              'Kesalahan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          messageText: const Center(
              child: Text(
                  'Email sudah digunakan, silahkan daftar dengan email lain')),
          snackStyle: SnackStyle.GROUNDED,
          backgroundColor: Colors.white,
          barBlur: 0.5,
        );
      }
    } catch (e) {
      Get.snackbar(
        '-',
        '-',
        titleText: const Center(
          child: Text(
            'Kesalahan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        messageText: const Center(
            child: Text(
                'Tidak bisa login, silahkan coba lagi atau hubungi admin')),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.white,
        barBlur: 0.5,
      );
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
