
import 'package:tkwinsa_task/data/web_services/end_points.dart';
import 'package:tkwinsa_task/data/web_services/web_services.dart';

class HttpApi {
  CustomDio customDio = CustomDio();

//////////////////////////////////////////////////////////////////////////////////////////////////

  //*******************  login   *************************//

  Future<dynamic> login({Map<String, dynamic>? body}) async {
    final res = await customDio.request(EndPoints.login,
        type: RequestType.Post, body: body);
    return res;
  }


  //*******************  grades   *************************//

  Future<dynamic> grades({Map<String, dynamic>? body}) async {
    final res = await customDio.request(EndPoints.getGrades,
        type: RequestType.Get);
    return res;
  }

  //*******************  update grade  *************************//

  Future<dynamic> updateGrade({Map<String, dynamic>? body,required String id}) async {
    final res = await customDio.request(EndPoints.updateGrade(id),
        type: RequestType.Put, body: body);
    return res;
  }


  //*******************  delete grade  *************************//

  Future<dynamic> deleteGrade({Map<String, dynamic>? body,required String id}) async {
    final res = await customDio.request(EndPoints.deleteGrade(id),
        type: RequestType.Delete, body: body);
    return res;
  }

  //*******************  add grades *************************//

  Future<dynamic> addGrades({Map<String, dynamic>? body}) async {
    final res = await customDio.request(EndPoints.addGrades,
        type: RequestType.Post, body: body);
    return res;
  }


  //*******************  get classes *************************//

  Future<dynamic> getClasses({Map<String, dynamic>? body}) async {
    final res = await customDio.request(EndPoints.getClasses,
        type: RequestType.Get, body: body);
    return res;
  }


  //*******************  add classes *************************//

  Future<dynamic> addClasses({Map<String, dynamic>? body}) async {
    final res = await customDio.request(EndPoints.addClasses,
        type: RequestType.Post, body: body);
    return res;
  }


  //*******************  update classes *************************//

  Future<dynamic> updateClasses({Map<String, dynamic>? body,required id}) async {
    final res = await customDio.request(EndPoints.updateClasses(id),
        type: RequestType.Put, body: body);
    return res;
  }

  //*******************  update classes *************************//

  Future<dynamic> deleteClasses({Map<String, dynamic>? body,required id}) async {
    final res = await customDio.request(EndPoints.updateClasses(id),
        type: RequestType.Delete, body: body);
    return res;
  }


}
