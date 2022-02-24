import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopbiz/models/categories.dart';
import 'package:shopbiz/products/products_detail.dart';
import 'package:shopbiz/utils/custom_colors.dart';
import 'package:shopbiz/utils/decoration.dart';
import 'package:shopbiz/utils/textstyles.dart';

class ProductPage extends StatefulWidget {

static const id='/productpage';

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

FirebaseFirestore db= FirebaseFirestore.instance;
bool isFavourite=false;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments as Map <String ,dynamic>;
    var category=data['category'];
    return Scaffold(
      appBar: 
      AppBar(
        elevation: 0.0,
        title: Text(category),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
          )
          ),
          ),
          body: StreamBuilder(
           stream: db
            .collection('products')
            .where("category", isEqualTo: category)
            .snapshots(),
            builder:(context,AsyncSnapshot <QuerySnapshot> snapshot){
                if (snapshot.hasError){
                  Fluttertoast.showToast(msg: 'Something Went Wrong');
                } if (snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData){
                  return Center(child: CircularProgressIndicator());
                }
                final values = snapshot.data.docs;
               
                return values.length>0
                ?GridView.builder(
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: values.length,
                  itemBuilder: (BuildContext context,int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: 
                  
                  
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(ProductDetailPage.id,
                        arguments: {
                          'productname':values[index]['productName'],
                          'detail':values[index]['detail'],
                          'brand':values[index]['brandName'],  
                          'images':values[index]['imageUrl'],
                          'isOnSale':values[index]['isOneSale'],
                          'isPopular':values[index]['isPopular'],
                          'price':values[index]['price'],
                          'quantity':values[index]['quantity'],
                          'serialCodel':values[index]['serialCodel'],
                          'weight':values[index]['weight'],
                          // 'brandName':values[index]['brandName'],
 
                        });
                      },
                      child: Container(
                         decoration: decoration(),
                        child: Stack(
                          
                          children: [
                    
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                           
                            child: Image(
                              image: CachedNetworkImageProvider(
                                values[index]['imageUrl'][1], 
                              )
                            ),
                            // Image.network(
                            //   values[index]['imageUrl'][1],
                            // fit: BoxFit.cover,
                            // height: 200,
                            // width: 200,),
                          ),
                          Container(
                            
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 134),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              
                            ),
                            child: Center(
                              child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               
                                children: [
                                // Expanded(
                                //   child: IconButton(
                                //     onPressed: (){},
                                //    icon: Icon(FontAwesomeIcons.heart,size: 15,),
                                //    color:white ,),
                                // ),
                                 Expanded(
                                   child: Text(
                                     values[index]['productName'],
                                     textAlign :TextAlign.center,
                                     style: TextStyle(color: white,fontSize: 11),)),
                    
                                 Expanded(
                                   child: IconButton(
                                    onPressed: (){},
                                   icon: Icon(FontAwesomeIcons.cartPlus,size: 15,),
                                   color:white ,),
                                 ),
                              ],
                              ),
                            ),
                          )
                        ],)
                      ),
                    ),
                  );
                })
                :Center(child: Text('no product found',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),);
            }, ),
    );
  }
}