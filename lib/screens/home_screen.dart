import 'dart:developer';

import 'package:aibuddha/controllers/home_controller.dart';
import 'package:aibuddha/screens/screens_export.dart';
import 'package:aibuddha/utils/utils_export.dart';
import 'package:aibuddha/widgets/cat_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController>{
  static const routeName = "/home";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
    backgroundColor: Color(0xFF444CF7),
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
   IconButton(
   onPressed: () {
    showSearch(context: context, delegate: CustomSearchDelegate());
   },
   icon: const Icon(Icons.search),
   )
  ],
          backgroundColor: Color(0xFF020381),
          centerTitle: true,
          title: Text("Breeds of Cats",
          style: TextStyle(
            color: Color(0xFF9B51E0)
          ),),
          pinned: true,
        ),
        
        Obx(
          () => SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return 
            Padding(
              padding: getPadding(left: 10, right: 10, top: 10, bottom: 10),
        
              child: Card(
                color: Color(0xFF020381),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 1.0,
                shadowColor: Colors.grey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
               children: [ CatImage(imageUrl: controller.catBreeds[index].image?.url ?? "",
               catName: controller.catBreeds[index].name,),
               const SizedBox(width: 8,),
                      
                Expanded(
                  child: Column(
                    
                    children: [
                      const SizedBox(height: 12,),
                      Text(controller.catBreeds[index].name,
                      style: TextStyle(
                        fontSize: getFontSize(24),
                        color: Colors.white,
                        
                      ),),
                      const SizedBox(height: 8,),
                      Text(controller.catBreeds[index].description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: getFontSize(12),
                        color: Colors.white,
                        
                      ),),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        onPressed: (){

                          Get.to(() => MoreDetailsScreen(catBreed: controller.catBreeds[index]),
                          transition: Transition.fadeIn,
                          curve: Curves.easeInCubic,
                          duration: Duration(seconds: 1));
                        }, 
                      child: Text("More Details",
                      style: TextStyle(
                        fontSize: getFontSize(18),
                        color: Color(0xFF9B51E0),
                      )
                      ))
                
                
                    ],
                  ),
                ),]
               ),
              ),
            );
          
              },
              childCount: controller.catBreeds.length) ),
        )]
    ),
   );
  }
  
}