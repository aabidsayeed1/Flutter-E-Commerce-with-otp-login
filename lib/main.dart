import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopbiz/adminscreens/addproduct.dart';
import 'package:shopbiz/products/products_detail.dart';
import 'package:shopbiz/products/productspage.dart';
import 'package:shopbiz/screens/main_screen.dart';
import 'package:shopbiz/profileinitpage.dart';
import 'package:shopbiz/login.dart';
import 'package:shopbiz/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent));
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    

  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopBiz',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'roboto-regular'),
      home: SplashInitPage(),
      routes: {
        SplashPage.id:(context)=>SplashPage(),
        LoginPage.id:(context) => LoginPage(),
        ProfileInitPage.id:(context) => ProfileInitPage(),
        Mainpage.id:(context) => Mainpage(),
        AddProductPage.id:(context) => AddProductPage(),
        ProductPage.id:(context) => ProductPage(),
        ProductDetailPage.id:(context) => ProductDetailPage(),
      },
    );
  }
}


