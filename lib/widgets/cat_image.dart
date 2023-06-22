import 'dart:developer';

import 'package:aibuddha/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CatImage extends StatelessWidget {
  const CatImage({super.key, required this.imageUrl, required this.catName});
  final String imageUrl;
  final String catName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(152),
      height: getVerticalSize(170),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
      boxShadow : [BoxShadow(
          color: Color.fromRGBO(23, 37, 40, 0.10000000149011612),
          offset: Offset(4,4),
          blurRadius: 20
      )],
      color : Color(0xFF020381),
  ),
      child: Stack(
        children: <Widget>[
          Container(
          // width: 120,
          // height: 120,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image : DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
             onError: (error, stackTrace){
                      log("error");
                    }
      ),
  )
      ),
        ]
      )
    );
  }
}