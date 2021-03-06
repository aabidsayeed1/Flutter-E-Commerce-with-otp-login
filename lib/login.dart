import 'package:flutter/material.dart';
import 'package:shopbiz/models/authprovider.dart';
import 'package:shopbiz/utils/custom_colors.dart';

class LoginPage extends StatelessWidget {
  
    static const id= '/LoginPage';

    GlobalKey fromkey = GlobalKey<FormState>(); 

    TextEditingController inputController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          
          padding: const EdgeInsets.all(20.0),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo.png',height: 160,),
              
              SizedBox(height: 80,),
              Text('SHOPBIZ',
              style: TextStyle(fontSize: 30,fontFamily: 'roboto-bold'),),
              SizedBox(height: 20,),
      
              Form(
                key: fromkey,
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
      
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: inputController, 
                        decoration: InputDecoration(
                         
                          hintText: 'enter phone number',
                        border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  
                  MaterialButton(
                    minWidth: double.infinity,
                    color: primarycolor,
                    onPressed: (){
                    if (inputController.text!=null){
                      final phone= '+91'+inputController.text;
                      AuthProvider().
                      loginWithPhone(context, phone);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('LOGIN',
                    style: TextStyle(color: white,fontSize: 20,),),
                  ),),
                  
                ],
              )))
            ],
          ),
        ),
      ),
    );
  }
}