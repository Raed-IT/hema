import 'package:get/get.dart';

import 'en.dart';
import 'ar.dart';

class TranslationApp extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {"en": en, "ar": ar};
}
