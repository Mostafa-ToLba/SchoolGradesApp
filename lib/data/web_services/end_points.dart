class RequestType {
  static const String Get = 'get';
  static const String Post = 'post';
  static const String Put = 'put';
  static const String Delete = 'delete';
}

class EndPoints {
  static const String baseURL = "https://test.wiqaya.co/";
  static const String login = "auth/login";
  static const String getGrades = "school/grades";
  static String updateGrade(String id) => "school/grades/$id";
  static String deleteGrade(String id) => "school/grades/$id";
  static const String addGrades = "school/grades";
  static const String getClasses = "school/classes";
  static const String addClasses = "school/classes";
  static  String updateClasses(String id) => "school/classes/$id";
  static  String deleteClasses(String id) => "school/classes/$id";

}
