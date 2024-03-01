import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/present_tabel_screens/show_table_present/show_present_binding.dart';
import 'package:school/app/modules/parent/pages/present_tabel_screens/show_table_present/show_present_screen.dart';
import 'package:school/app/modules/parent/route/routs.dart';

class ParentShowPresentPage extends GetPage {
  ParentShowPresentPage()
      : super(
            name: ParentAppRoutes.SHOE_PRESENT,
            page: () => ParentShowPresentScreen(),
            binding: ParentShowPresentBinding());
}
