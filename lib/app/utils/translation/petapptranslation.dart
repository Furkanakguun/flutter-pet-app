import 'package:get/route_manager.dart';

class PetAppTranslations extends Translations {
  static const hello = "hello";
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en": {
          hello: "Hello",
        },
        "tr": {
          hello: "Merhaba",
        }
      };
}
