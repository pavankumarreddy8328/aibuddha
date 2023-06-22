import 'dart:developer';

import 'package:aibuddha/controllers/controller.dart';
import 'package:aibuddha/models/catbreed_model.dart';
import 'package:get/get.dart';

class HomeController extends Controller{

  RxList<CatBreed> catBreeds = <CatBreed>[].obs;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCatBreeds();

  }
// @override
//   void onReady() {
//     // TODO: implement onReady
//     super.onReady();
//     getCatBreeds();
//   }
  void getCatBreeds(){
    api.getCatBreeds().then((value)  {
      catBreeds.value = value;
      isLoading.value = false;
    }).catchError((error){
      log("Error happened at Getting CatBreeds :: ${error.toString()}");
    });
  }

}