
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tkwinsa_task/business_logic/http_api.dart';
import 'package:tkwinsa_task/business_logic/view_models/class_vm/class_vm.dart';
import 'package:tkwinsa_task/business_logic/view_models/grades_vm/grades_vm.dart';
import 'package:tkwinsa_task/business_logic/view_models/login_vm/login_vm.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => HttpApi());
}

List<SingleChildWidget> providers = [
  ...independentServices,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
  ChangeNotifierProvider<GradesViewModel>(create: (_) => GradesViewModel()),
  ChangeNotifierProvider<ClassViewModel>(create: (_) => ClassViewModel()),
];
