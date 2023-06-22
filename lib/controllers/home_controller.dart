import 'dart:developer';

import 'package:aibuddha/controllers/controller.dart';
import 'package:aibuddha/models/catbreed_model.dart';
import 'package:get/get.dart';

class HomeController extends Controller{

  RxList<CatBreed> catBreeds = <CatBreed>[].obs;

  void getCatBreeds(){
    api.getCatBreeds().then((value)  {
      catBreeds.value = value;
    }).catchError((error){
      log("Error happened at Getting CatBreeds :: ${error.toString()}");
    });
  }

}