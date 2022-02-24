



import 'package:cached_network_image/cached_network_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/utils/contants.dart';
import 'package:shopbiz/utils/custom_colors.dart';
import 'package:shopbiz/utils/decoration.dart';

class ProductDetailPage extends StatefulWidget {
  static const id = '/productdetail';

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  int selectedIndex=0;
  int quant = 1;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    
    var name = data['productname'];
    var detail = data['detail'];
    var brand = data['brand'];
    List images = data['images'];
    var isOnSale = data['isOnSale'];
    var isPopular = data['isPopular'];
    var price = data['price'];
    var quantity = data['quantity'];
    var serialCodel = data['serialCodel'];
    var weight = data['weight'];
    // var brandName = data['brandName'];
    return Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            child: Column(
              
              children: [
                Column(
                  children: [
                    Stack(children: [
                      
                     Container(
                      height: 220,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child:Image(image: CachedNetworkImageProvider(
                          images[selectedIndex]),
                        fit: BoxFit.cover,
                        )
                        //  Image.network(images[selectedIndex],fit: BoxFit.cover,),
                      ) ),
                      
                      InkWell(onTap: (){
                        Navigator.pop(context);
                      },child: Padding(
                        padding: const EdgeInsets.only(top: 25,left: 10),
                        child: Icon(Icons.arrow_back,),
                      ),),
                    ],),
                    
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [ 
                        ...List.generate(images.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex=index;
                                });
                                // print(images[index]);
                              },
                              child: Card(
                                
                                elevation: 5,
                                clipBehavior: Clip.antiAlias,   
                               
                                child:Image(image: CachedNetworkImageProvider(
                                  images[index]
                                ),
                                height: 50,
                                fit: BoxFit.contain,
                                )
                                //  Image.network(
                                //   images[index],
                                //  height: 50,
                                // fit: BoxFit.contain,),
                              ),
                            ),
                          );
                        })
                              
                      ],),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.2),
                  child: Container(
                    height: 78,
                    child: Card(
                      elevation: 8,
                      clipBehavior: Clip.antiAlias,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                       
                        child: Row(
                          
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children: [
                            Text(name,
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                           
                           
                            Card(
                             elevation: 8, 
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: FavoriteButton(valueChanged: (_isFavorite){
                                  print("Is Favorite $_isFavorite");
                                }),
                              ),
                            ),
                           
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
               
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: decoration(),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                    
                     child: Text(detail,style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              ),),
                   ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                       color: Colors.deepPurple.withOpacity(0.5),
                      borderRadius:BorderRadius.circular(8) ),
                   
                    child: Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                         
                          decoration: decoration(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(isOnSale ? "ON SALE" : "OUT OF STOCK",
                              style: TextStyle(color: isOnSale?Colors.red : Colors.white,fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                       
                        Text('JUSTR ONLY :${price} RS',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),),
                      ],

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    minWidth: double.infinity,
                    color: Colors.green,
                    onPressed: (){
                     showDialog(context: context, builder: (_){
                       return StatefulBuilder(
                         builder: (context, StateSetter setState){
                             return Dialog(
                           child: Padding(
                             padding: const EdgeInsets.all(18.0),
                             child: Column(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                              Text('Purchase- $name'.toUpperCase()),
                       
                              Divider(),
                             
                              Row(children: [
                                Column(
                                  children: [
                                    Text('enter quantity'),
                                    Text(' max $quantity'),

                                  ],
                                ),
                                IconButton(onPressed: (){
                                  setState(() {
                                    if(quant>quantity-1){
                                     dislpayMessage('not enough stock');
                                    }else
                                    quant++;
                                  });
                                }, icon: Icon(Icons.add)),
                                 Text("$quant"),
                                IconButton(onPressed: (){
                                  setState(() {
                                    if(quant>0){
                                   
                                    quant--;
                                     
                                    }
                                  });
                                }, icon: Icon(Icons.remove))
                              ],),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(onPressed: (){}, child: Text('Comfirm')),
                                  
                                  ElevatedButton(onPressed: (){}, child: Text('Cancel')),
                                ],
                              ),
                             ]),
                           ),
                         );
                     
                         },
                       
                       );
                     });
                  },
                  child: Text("ADD TO CART",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18),),),
                )
              ],
            ),
          ),
    );
  }
}