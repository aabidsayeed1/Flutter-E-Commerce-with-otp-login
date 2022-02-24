

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopbiz/profileinitpage.dart';

import '../screens/main_screen.dart';
import 'usermodel.dart';

class AuthProvider{
  
 Future<bool>  loginWithPhone(BuildContext context,String phone)async{
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController otpC=TextEditingController();
  _auth.verifyPhoneNumber(phoneNumber: phone, 


  verificationCompleted: (AuthCredential credential)async{
    UserCredential result = await _auth.signInWithCredential(credential);
    Navigator.pop(context);
    User user = result.user;
    
    if(user!=null){
       AppUser.set(phone);
       Navigator.pushReplacementNamed(context, Mainpage.id );
       
    }else{
      Fluttertoast.showToast(msg: 'user is not signed in');
    }
  }, 


  verificationFailed: (FirebaseAuthException e){
    Fluttertoast.showToast(msg: e.toString());
  }, 


  codeSent: (String verificationcode, int token){
    showDialog(context: context, 
    builder: (_){
      return AlertDialog(
               title: Text('Enter OTP'),
               content:Column(
                 children: [
                   TextField(
                     controller: otpC,
                   ),
                   
                 ],
               ),
               actions: [
                 ElevatedButton(
                   onPressed: ()async{
                   final code=otpC.text;
                   AuthCredential credential=PhoneAuthProvider.credential(
                     verificationId: verificationcode, 
                     smsCode: code);
                     UserCredential result =
                      await _auth.signInWithCredential(credential);
                      User user = result.user;
                      if(user !=null){
                        AppUser.set(phone);
                        Navigator.pushReplacementNamed(context, Mainpage.id );
                        print('Success');
                      }else{
                        Fluttertoast.showToast(msg: 'error');
                      }
                 }, child: Text('verify'))
               ],
      );
    });
  },


   codeAutoRetrievalTimeout: (id)=>{});
  }
}