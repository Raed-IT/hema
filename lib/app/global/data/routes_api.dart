class GlobalApiRouts {
  //online
  // static const DOMAIN = 'http://192.168.31.177:8000';

  static const DOMAIN = 'https://jelalmostaqbal.com';
  // static const DOMAIN = 'https://school.mada-company.com';
  static const HOST = '$DOMAIN/api';

  //locally
  // static const DOMAIN = '10. 0.2.2:8000';
  // static const DOMAIN = '192.168.31.66:8000';
  // static const HOST = 'http://$DOMAIN/api';

  // static const HOST = 'https://schoolsps.com/api';
  static const LOGIN = "$HOST/login";
  static const NOTIFICATION = "$HOST/notifications";
  static const POSTS = "$HOST/posts";
  static const SETTINGS = "$HOST/settings";
  static const PASS = "$HOST/check_password";
  static const SHIFT = "${GlobalApiRouts.HOST}/lessons";
  static const SUBJECTS = "${GlobalApiRouts.HOST}/subjects";
  static const MEDIA = "${GlobalApiRouts.HOST}/media";
  static const REPROTS = "${GlobalApiRouts.HOST}/reports";
  static const REPROTS_ITEMS = "${GlobalApiRouts.HOST}/reports-items";
  static const STUDENTS = "${GlobalApiRouts.HOST}/students";
  static const USERS = "${GlobalApiRouts.HOST}/users";
}
