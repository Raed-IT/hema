import 'package:get/get.dart';
import 'package:school/app/modules/parent/route/routs.dart';

import 'notes_binding.dart';
import 'notes_screen.dart';

class ParentNotesPage extends GetPage {
  ParentNotesPage()
      : super(
            name: ParentAppRoutes.NOTES,
            page: () => ParentNotesScreen(),
            binding: ParentNotesBinding(),
            transitionDuration: Duration(milliseconds: 700));
}
