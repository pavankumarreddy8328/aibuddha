import 'package:aibuddha/controllers/controllers_export.dart';
import 'package:aibuddha/models/catbreed_model.dart';
import 'package:aibuddha/screens/screens_export.dart';
import 'package:aibuddha/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate{

  HomeController homeController = Get.find();
 @override
  // TODO: implement keyboardType
  TextInputType? get keyboardType => TextInputType.text;

 
  @override
  // TODO: implement textInputAction
  TextInputAction get textInputAction => TextInputAction.done;

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Search";

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
      primaryColor: Color(0xFF9B51E0),
     
      inputDecorationTheme: InputDecorationTheme(
        
        border: InputBorder.none,
        labelStyle: TextStyle(color: Color(0xFF9B51E0),
        ),
        floatingLabelStyle: TextStyle(color: Color(0xFF9B51E0),
        ),
        helperStyle: TextStyle(color: Color(0xFF9B51E0),
        ),
        counterStyle: TextStyle(color: Color(0xFF9B51E0),
        ),
       hintStyle: TextStyle(
      fontStyle: FontStyle.italic,
      color: Color(0xFF9B51E0)
    )
      ),
      appBarTheme: const AppBarTheme(

        backgroundColor: Color(0xFF020381),
      ),);
  }

  


  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => TextStyle(
    fontStyle: FontStyle.italic,
    color: Colors.black
  );
  

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
     return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
   IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

    List<CatBreed> matchQuery = [];
    for (var catBreed in homeController.catBreeds.value) {
      if (catBreed.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(catBreed);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: ((context, index) {
      return ListTile(
        onTap: (){
           Get.to(() => MoreDetailsScreen(catBreed: matchQuery[index]));
        },
        leading: Container(
          width: getHorizontalSize(40),
          height: getVerticalSize(40),
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(matchQuery[index].image?.url ?? ""),
            fit: BoxFit.cover)
          ),
        ),
        title: Text(matchQuery[index].name),
      );
    }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<CatBreed> matchQuery = [];
    for (var catBreed in homeController.catBreeds.value) {
      if (catBreed.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(catBreed);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: ((context, index) {
      return ListTile(
         onTap: (){
           Get.to(() => MoreDetailsScreen(catBreed: matchQuery[index]));
        },
        leading: Container(
          width: getHorizontalSize(40),
          height: getVerticalSize(40),
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(matchQuery[index].image?.url ?? ""),
            fit: BoxFit.cover)
          ),
        ),
        title: Text(matchQuery[index].name),
      );
    }));
  }

  

}