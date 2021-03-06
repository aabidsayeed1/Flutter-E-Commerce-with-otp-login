 
 
 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AppUser{
   static String name;
   static String phone;
   static String house;
   static String street;
   static String city;
   static String pincode;
   static String dob;
   static String fcmToken;
   static bool isLoggedIn;
   static int userType;
  
   FirebaseFirestore db = FirebaseFirestore.instance;
   static void set(String phoneNumber){
     AppUser.name="";
     AppUser.phone=phone;
     AppUser.house="";
     AppUser.street = '';
     AppUser.city='';
     AppUser.pincode='';
     AppUser.isLoggedIn= false;
     AppUser.userType=0;
   }
   Map <String, dynamic> get getMap {
     return{
       'name':AppUser.name,
       'phone':AppUser.phone,
       'house':AppUser.house,
       'street':AppUser.street,
       'city':AppUser.city,
       'pincode':AppUser.pincode,
       'userType':AppUser.userType,
     };
   }
   static void update({
    String name,
    String phone,
    String house,
    String street,
    String city,
    String pincode,
    String dob,
    String fcmToken,
    bool isLoggedIn,
    int userType,
   }){
    AppUser.name=name;
     AppUser.phone=phone;
     AppUser.house=house;
     AppUser.street = street;
     AppUser.city=city;
     AppUser.pincode=pincode;
     AppUser.isLoggedIn= isLoggedIn;
     AppUser.userType=userType;
   }
   get getInfoFromDb async {
     var temp = false;
     var value =await db.collection("User").doc(AppUser.phone).get();
     if(value.exists){
       temp=true;
       update(
         name: value.data()['name'],
         house: value.data()['house'],
         street: value.data()['street'],
         city: value.data()['street'],
         pincode: value.data()['pincode'],
         dob: value.data()['dob'],
         userType:value.data()['userType'],
         isLoggedIn: AppUser.isLoggedIn,
         fcmToken:value.data()['fcmToken'],
       );
     }
     return temp;
   }
 }