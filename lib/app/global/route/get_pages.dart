import 'package:get/get.dart';
import 'package:school/app/global/pages/login_screen/login_page.dart';
import 'package:school/app/global/pages/posts_screens/show_post_screen/show_post_page.dart';
import 'package:school/app/global/pages/splash_screen/splash_page.dart';
 import '../pages/about_school/about_school_page.dart';
 import '../pages/notification_screen/notification_page.dart';
import '../pages/posts_screens/posts_screen/posts_page.dart';
 import '../pages/profile_screen/profile_page.dart';
import '../pages/reports_screens/reports_items_screen/reports_items_page.dart';
import '../pages/reports_screens/reports_screen/report_page.dart';
import '../pages/student_profile_screen/student_profile_page.dart';
import '../pages/weekly_program_screen/weekly_program_page.dart';
class GlobalGetPagesProvider {
  static List<GetPage> getPages = [
    SplashPage(),
    LoginPage(),
    NotificationPage(),
    PostsPage(),
    ShowPostPage(),
    AboutSchoolPage(),
    WeeklyProgramPage(),
    StudentProfilePage(),
    ReportsItemsPage(),
    ReportPage(),
    ProfilePage(),
   ];
}
