import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/models/usermodel.dart';
import 'package:shopbiz/screens/main_screen.dart';
import 'package:shopbiz/utils/contants.dart';
import 'package:shopbiz/utils/custom_colors.dart';
import 'package:shopbiz/login.dart';
import 'package:shopbiz/utils/decoration.dart';

class ProfileInitPage extends StatefulWidget {
  
   static const id ='/profileinit';

  @override
  State<ProfileInitPage> createState() => _ProfileInitPageState();
}

class _ProfileInitPageState extends State<ProfileInitPage> {
   Future signout(BuildContext context)async{
   await  FirebaseAuth.instance.signOut().whenComplete(
     () => Navigator.pushReplacementNamed(context, LoginPage.id));
   }

   TextEditingController nameC =TextEditingController();

   TextEditingController houseC =TextEditingController();

   TextEditingController streetC =TextEditingController();

   TextEditingController cityC =TextEditingController();

   TextEditingController pinCodeC =TextEditingController();

   TextEditingController dobC =TextEditingController();

  //  TextEditingController PhoneNumberC =TextEditingController();
  
  DateTime selectedDate;

  final formkey = GlobalKey<FormState>();

  bool isLoading = false;
  FirebaseFirestore db = FirebaseFirestore.instance;

  submit(BuildContext context)async{
    if(formkey.currentState.validate()){

      FirebaseMessaging fbm = FirebaseMessaging.instance;
      String fcm = await fbm.getToken(); 
      AppUser.update(
      name: nameC.text,
      house: houseC.text,
      street: streetC.text,
      city: cityC.text,
      pincode: pinCodeC.text,
      dob: dobC.text,
      fcmToken: fcm,
      isLoggedIn:true, 
      userType: 0,
      

      );
      db
      .collection('user')
      .doc(AppUser.phone).set(AppUser()
      .getMap).then((value){
      Navigator.of(context).pushReplacementNamed(Mainpage.id);
      }).catchError((e){
        dislpayMessage(e.toString());
      });
     setState(() {
       isLoading= true;
     });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar:  AppBar(
        title: Text('Address'),
        actions: [
          IconButton(onPressed: (){
          signout(context);
          },
           icon: Icon(Icons.logout)),
           
        ],
      ),
      body: SafeArea(
        child: Center(
          child:Stack(
            children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('PROFILE',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple.withOpacity(0.7),
                  fontWeight: FontWeight.bold),)),
            ),
          
            isLoading?Center(
              child: CircularProgressIndicator(),
            )
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Card(
                elevation: 10,
                color: Colors.grey.shade100,
                child: Form(
                  key: formkey,
                  child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                     
                     
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: TextFormField(
                          onFieldSubmitted: (v){
                           nameC.text=v;
                          },
                          textInputAction:TextInputAction.next,
                          keyboardType: TextInputType.name,
                          controller: nameC,
                          validator: (v) {
                            if (v.length < 4){
                              return 'should be greater than 5';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            icon: person,
                            hintText: 'enter name',
                            labelText: 'what people call you?',
                           border: OutlineInputBorder(),
                          ),
                        ),
                      ),
      
                      //  Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      //   child: TextFormField(
                      //     controller: emailC,
                      //     validator: (v) {
                      //       if (v.length < 4){
                      //         return 'should be greater than 5';
                      //       }
                      //       return null;
                      //     },
                      //     decoration: InputDecoration(
                      //       hintText: 'enter email',
                      //       labelText: 'what is your email?',
                      //      border: OutlineInputBorder(),
                      //     ),
                      //   ),
                      // ),
      
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: TextFormField(
                          onFieldSubmitted: (v){
                           houseC.text=v;
                          },
                          textInputAction:TextInputAction.next,
                          keyboardType: TextInputType.name,
                          controller: houseC,
                          validator: (v) {
                            if (v.length < 4){
                              return 'should be greater than 5';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            icon: address,
                            hintText: 'enter house no.',
                            labelText: 'enter house no.',
                           border: OutlineInputBorder(),
                          ),
                        ),
                      ),
      
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: TextFormField(
                          onFieldSubmitted: (v){
                           streetC.text=v;
                          },
                          textInputAction:TextInputAction.next,
                          keyboardType: TextInputType.name,
                          controller: streetC,
                          validator: (v) {
                            if (v.length < 4){
                              return 'should be greater than 5';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            icon: address,
                            hintText: 'enter street',
                            labelText: 'enter street',
                           border: OutlineInputBorder(),
                          ),
                        ),
                      ),
      
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: TextFormField(
                          onFieldSubmitted: (v){
                           cityC.text=v;
                          },
                          textInputAction:TextInputAction.next,
                          keyboardType: TextInputType.name,
                          controller: cityC,
                          validator: (v) {
                            if (v.length < 4){
                              return 'should be greater than 5';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.location_city),
                            hintText: 'enter city',
                            labelText: 'enter city',
                           border: OutlineInputBorder(),
                          ),
                        ),
                      ),
      
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: TextFormField(
                          onFieldSubmitted: (v){
                           pinCodeC.text=v;
                          },
                          textInputAction:TextInputAction.next,
                          keyboardType: TextInputType.number,
                          controller: pinCodeC,
                          validator: (v) {
                            if (v.length < 4){
                              return 'should be greater than 5';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            
                            icon: Icon(Icons.location_history),
                            hintText: 'enter pincode',
                            labelText: 'enter pincode',
                           border: OutlineInputBorder(),
                          ),
                        ),
                      ),
      
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: TextFormField(
                          textInputAction:TextInputAction.next,
                          onFieldSubmitted: (v){
                           dobC.text=v;
                          },
                          onTap: (){
                            showDatePicker(
                              context: context, 
                            initialDate: DateTime.now(), 
                            firstDate: DateTime(1970), 
                            lastDate: DateTime.now())
                            .then((value) {
                              if(value==null){
                                return;
                              }else{
                                selectedDate=value;
                                dobC.text = selectedDate.toString().substring(0,10);
                              }
                            });
                          },
                          controller: dobC,
                          validator: (v) {
                            if (v.length < 4){
                              return 'should be greater than 5';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.date_range),
                            hintText: 'enter DOB',
                            labelText: 'enter DOB',
                           border: OutlineInputBorder(),
                          ),
                        ),
                      ),
      
                      
                    ],
                  ),
                )),
              ),
            ),
          
            
            
          ],)
        ),
      ),
      floatingActionButton : isLoading 
       ?null: FloatingActionButton(
         onPressed: (){
                  submit(context);
                },
                child: Icon(Icons.navigate_next),
    )
    );
  }
}