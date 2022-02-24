import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/contants.dart';
import '../utils/custom_colors.dart';

class CSlider extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: caoursel.length , 
      options: CarouselOptions(
       
        autoPlay: true,
        viewportFraction: 0.84,
        enlargeCenterPage: true),
       itemBuilder:(BuildContext context,int index, int page){
         return Container(
           clipBehavior: Clip.antiAlias,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20),
           ),
           child: Stack(
             children: [
            Image(image: CachedNetworkImageProvider(
              caoursel[index].images,
               ),
            ),
               
             Container(
               height: double.infinity,
               width: double.infinity,
               color: Colors.black54.withOpacity(0.3),
               child: Center(
                 child: Text(
                   caoursel[index].text,
                   textAlign: TextAlign.center,
                   style: TextStyle(color: white,fontSize: 30),),
               )),
           ],)
         );
       }, 
       );
  
  }
}

  
