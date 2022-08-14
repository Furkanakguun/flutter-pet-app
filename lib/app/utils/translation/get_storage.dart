import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Storage {
  static const LOCALE_COUNTRY = "localeCOUNTRY";
  static const LOCALE_LANGUAGE = "localeLANG";
  GetStorage localGetStorage = GetStorage();
  Locale? getLocale() {
    Locale? localeD;
    String localeCOUNTRY = localGetStorage.read(LOCALE_COUNTRY) ?? "";
    String localeLANGUAGE = localGetStorage.read(LOCALE_LANGUAGE) ?? "";

    if (localeCOUNTRY != "" && localeLANGUAGE != "") {
      localeD = Locale(localeLANGUAGE, localeCOUNTRY);
    } else {
      localeD = Get.deviceLocale;
    }
    return localeD;
  }

  // set and update device locale
  setLocale(Locale? locale) {
    localGetStorage.write(LOCALE_COUNTRY, locale!.countryCode);
    localGetStorage.write(LOCALE_LANGUAGE, locale.languageCode);
    Get.updateLocale(locale);
    return;
  }
}
