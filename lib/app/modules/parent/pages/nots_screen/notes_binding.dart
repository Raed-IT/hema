import 'package:get/get.dart';
import 'package:school/app/global/data/providers/notes_provider.dart';

import 'notes_controller.dart';

class ParentNotesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NotesProvider());
    Get.put(ParentNotesController());
  }

}