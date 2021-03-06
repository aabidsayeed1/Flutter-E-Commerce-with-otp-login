import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopbiz/models/categories.dart';
import 'package:shopbiz/products/productspage.dart';
import 'package:shopbiz/utils/custom_colors.dart';

import '../widgets/app_drawer.dart';
import '../widgets/slider.dart';

class Mainpage extends StatefulWidget {
 
 static const id = '/mainpage';

 
  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  

TextEditingController searchC = TextEditingController();
 List<Category> newList = List.from(categories);
 @override
  void dispose() {
    // TODO: implement dispose
    searchC.clear();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title:
       Text('Home Page'),
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  textDirection: TextDirection.ltr,
                  controller: searchC,
                  onChanged: (value){
                    
                    setState(() {
                    
                      searchC.text=value;
                      newList=categories.
                      where((element) => element.name.toLowerCase()
                      .contains(value.toLowerCase()))
                      .toList();
                      print(searchC.text);
                    });
                  },
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   labelText: 'Search category...',
                   suffixIcon: Icon(FontAwesomeIcons.search),
                 ),
                ),
              ),
            ),
            SizedBox(height: 20,),
          CSlider(),
          SizedBox(height: 20,),
          Text(
            'CATEGORIES',
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
          ),
          Column(
            children: newList.map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                  .pushNamed(ProductPage.id,
                  arguments :{
                    "category": e.name,
                    "Icon": e.icon,
                  }
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blue,Colors.deepPurple],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(e.name,
                          style: TextStyle(
                            fontSize: 25,
                            color: white),
                            ),
                        ),
                        Container(
                          transform: Matrix4.rotationZ(0.2),
                          decoration: BoxDecoration(
                            
                          ),
                          child: Icon(e.icon,size: 35,color: white,)),
                      ],
                    ),
                  ),
                ),
              ),
            )).toList(),
          )

        ]
        ),
      ),
    );
  }
}

