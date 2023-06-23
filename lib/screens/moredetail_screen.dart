import 'dart:developer';

import 'package:aibuddha/models/catbreed_model.dart';
import 'package:aibuddha/utils/utils_export.dart';
import 'package:aibuddha/widgets/star_ratings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';


class MoreDetailsScreen extends StatelessWidget {
  const MoreDetailsScreen({super.key, required this.catBreed});
  static const routeName = "/moredetails";
  final CatBreed catBreed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFACACD0),
        appBar: AppBar(
          backgroundColor: Color(0xFF020381),
         title: Text(catBreed.name),    
        ),
        body: SingleChildScrollView(child: Column(children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 1.0,
            color: Color.fromRGBO(43,42,93,.839),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    width: getHorizontalSize(240),
                      height: getVerticalSize(280),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: NetworkImage(catBreed.image?.url ?? ""),
                      fit: BoxFit.cover),
                      
                    ),
                  ),
                  SizedBox(height: 8,),
                  
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Adaptability:",
                  style: TextStyle(color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.italic)),
                    Divider(height: 2,),
                  RatingOfCat(stars: catBreed.adaptability.toDouble()),
                  Divider(height: 2,),
                  Text("Affection Level:",
                  style: TextStyle(color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.italic)),
                    Divider(height: 2,),
                   RatingOfCat(stars: catBreed.affectionLevel.toDouble()),
                   Divider(height: 2,),
                  Text("Child Friendly:",
                  style: TextStyle(color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.italic)),
                    Divider(height: 2,),
                    RatingOfCat(stars: catBreed.childFriendly.toDouble()),
                    Divider(height: 2,),
                ],
              ),
              SizedBox(width: 8,),
            
             Expanded(
               child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Dog Friendly:",
                       style: TextStyle(color: Colors.white,
                         fontSize: 14,
                         fontStyle: FontStyle.italic)),
                         Divider(height: 2,),
                   RatingOfCat(stars: catBreed.dogFriendly.toDouble()),
                   Divider(height: 2,),
                       Text("Energy Level:",
                       style: TextStyle(color: Colors.white,
                         fontSize: 14,
                         fontStyle: FontStyle.italic)),
                         Divider(height: 2,),
                    RatingOfCat(stars: catBreed.energyLevel.toDouble()),
                     Text("Intelligence:",
                       style: TextStyle(color: Colors.white,
                         fontSize: 14,
                         fontStyle: FontStyle.italic)),
                         Divider(height: 2,),
                   RatingOfCat(stars: catBreed.intelligence.toDouble()),
                   Divider(height: 2,),
                 ],
               ),
             ),
             Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Grooming:",
                       style: TextStyle(color: Colors.white,
                         fontSize: 14,
                         fontStyle: FontStyle.italic)),
                         Divider(height: 2,),
                   RatingOfCat(stars: catBreed.grooming.toDouble()),
                   Divider(height: 2,),
                       Text("Health issues:",
                       style: TextStyle(color: Colors.white,
                         fontSize: 14,
                         fontStyle: FontStyle.italic)),
                         Divider(height: 2,),
                    RatingOfCat(stars: catBreed.healthIssues.toDouble()),
                     Text("Stranger Friendly:",
                       style: TextStyle(color: Colors.white,
                         fontSize: 14,
                         fontStyle: FontStyle.italic)),
                         Divider(height: 2,),
                   RatingOfCat(stars: catBreed.strangerFriendly.toDouble()),
                   Divider(height: 2,),
                 ],
               ),
          ],
             ),
                ],
              ),
            ),
          ),
        Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Description",
              style: TextStyle(color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold),),
            ),
          ),
          Padding(
                  padding: const EdgeInsets.only(left: 12,right: 12),
                  child: Text(catBreed.description,
                  style: TextStyle(color: Colors.white,
                    fontSize: 18,
                    fontStyle: FontStyle.italic),),
                ),
            DataTable(columns: <DataColumn>[
              DataColumn(label: Expanded(child: Text("S.No"),)),
              DataColumn(label: Expanded(child: Text("Attribute"),)),
                DataColumn(label: Expanded(child: Text("Value"),))
            ], rows: <DataRow>[
              DataRow(cells: <DataCell>[
                 DataCell(Text('1')),
              DataCell(Text("Origin",
          style: TextStyle(color: Colors.white,
            fontSize: 18,
            ),),),
              DataCell(Text("${catBreed.origin}",
          style: TextStyle(color: Colors.white,
            fontSize: 18,
            ),),),
              ]),
              DataRow(cells: <DataCell>[
                 DataCell(Text('2')),
              DataCell(Text("LifeSpan",
          style: TextStyle(color: Colors.white,
            fontSize: 18,
            ),),),
              DataCell(Text("${catBreed.lifeSpan}",
          style: TextStyle(color: Colors.white,
            fontSize: 18,
            ),),),
              ]),
              DataRow(cells: <DataCell>[
                 DataCell(Text('3')),
              DataCell(Text("WikiPidea",
          style: TextStyle(color: Colors.white,
            fontSize: 18,
            ),),),
              DataCell(TextButton(
                onPressed: ()async{
                  log("Clicked Launch Url:: ${catBreed.wikipediaUrl}");
                  if(catBreed.wikipediaUrl != null){
                   _launchURL(catBreed.wikipediaUrl!);}
                  else{
                  Fluttertoast.showToast(
          msg: "Cannot Launch URL",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
                  }
                },
                child: Text("Wiki",
          style: TextStyle(color: Colors.white,
          decoration: TextDecoration.underline,
          fontStyle: FontStyle.italic,
            fontSize: 18,
            ),)),),
              ]),
              DataRow(cells: <DataCell>[
                 DataCell(Text('4')),
              DataCell(Text("Temperament",
          style: TextStyle(color: Colors.white,
            fontSize: 18,
            ),),),
              DataCell(
                Text(catBreed.temperament,
                overflow: TextOverflow.clip,
                softWrap: true,
          style: TextStyle(color: Colors.white,
         
          fontStyle: FontStyle.italic,
            fontSize: 18,
            ),)),
              ])
            ]),
            SizedBox(height: 8,)
       
        ],)),
      ),
    );
  }

   void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url),
      mode: LaunchMode.inAppWebView);
    } else {
      
      log("Couldn't launch");
    }
  }
}

