import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:petapp/app/features/login/controller/auth_controller.dart';
import 'package:petapp/app/features/login/view/login_page.dart';
import 'package:petapp/app/utils/translation/get_storage.dart';
import 'package:petapp/app/utils/translation/petapptranslation.dart';

import 'app/features/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final deviceInfoController = Get.put(DeviceInfoController());
    return GetBuilder<DeviceInfoController>(builder: (cont) {
      return GetMaterialApp(
        title: 'Pet App',
        theme: ThemeData(
            primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        locale: deviceInfoController.locale,
        translations: PetAppTranslations(),
        home: const SplashScreen(),
      );
    });
  }
}

class DeviceInfoController extends GetxController {
  Storage box = Storage();
  bool? status;
  Locale? get locale => box.getLocale();

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
