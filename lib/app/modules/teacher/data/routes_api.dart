import 'package:school/app/global/data/routes_api.dart';

class TeacherApiRouts {
  static const SECTIONS = "${GlobalApiRouts.HOST}/teacher/sections";
  static const STUDENTS = "${GlobalApiRouts.HOST}/teacher/students";
  static const ATTENDS = "${GlobalApiRouts.HOST}/teacher/attends";
  static const HOME_WORK = "${GlobalApiRouts.HOST}/teacher/home-works";
  static const EXAM = "${GlobalApiRouts.HOST}/teacher/exams";
  static const NOTES = "${GlobalApiRouts.HOST}/teacher/notes";
  static const REPROT_ITEM = "${GlobalApiRouts.HOST}/teacher/reports-items";
  static const MARKS = "${GlobalApiRouts.HOST}/teacher/marks";
  static const ABSENT = "${GlobalApiRouts.HOST}/teacher/absent";
}
