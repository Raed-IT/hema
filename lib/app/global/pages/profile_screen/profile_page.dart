import 'package:get/get.dart';
import 'package:school/app/global/pages/profile_screen/profile_binding.dart';
import 'package:school/app/global/pages/profile_screen/profile_screen.dart';
import 'package:school/app/global/route/routs.dart';

class ProfilePage  extends GetPage{
  ProfilePage():super(
    name: GlobalAppRoutes.PROFILE,
    page: ()=>const ProfileScreen(),
    binding: ProfileBinding(),
  );
}