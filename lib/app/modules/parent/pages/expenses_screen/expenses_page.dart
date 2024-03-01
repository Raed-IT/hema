import 'package:get/get.dart';
import 'package:school/app/modules/parent/route/routs.dart';

import 'expenses_binding.dart';
import 'expenses_screen.dart';

class ParentExpensesPage extends GetPage{
  ParentExpensesPage():super(
    name: ParentAppRoutes.EXPENSES_SCREEN,
    page: ()=>ParentExpensesScreen(),
    binding: ParentExpensesBinding(),
      transitionDuration: Duration(milliseconds: 700)

  );

}