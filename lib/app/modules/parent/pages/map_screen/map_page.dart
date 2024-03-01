import 'package:get/get.dart';

 import '../../route/routs.dart';
import 'map_binding.dart';
import 'map_screen.dart';
 class ParentMapPage extends GetPage{
  ParentMapPage():super(
    name:ParentAppRoutes.MAP ,
    page: ()=>ParentMapScreen(),
    binding: ParentMapBinding(),
      transitionDuration: Duration(milliseconds: 700)

  );
}