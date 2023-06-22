import 'package:aibuddha/api/API.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController{
  final api = API();
  final box = GetStorage();
}