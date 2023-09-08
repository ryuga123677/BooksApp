import 'dart:convert';

import 'package:booksapp/utils.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart';

import 'homescreen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = TextEditingController();
  final box=GetStorage();
  late Response response;
  @override
  // final dio=Dio();


  void login(String email) async {

    try{
       response = await post(Uri.parse("https://staging.thenotary.app/doLogin"),
          body: {
            'email' :email,

          }
      );
      if(response.statusCode == 200)
      {var data =jsonDecode(response.body.toString());
        box.write('Response', response);

      utils().toastmessage('Account created');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>homescreen()));
      }
      else
      {utils().toastmessage("failed");

      }
    }
    catch(e)
    {
      utils().toastmessage(e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                hintText: 'Email',
              ),
            ),
          ),
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50)
              ),
              child: const Center(child: Text('Login',style: TextStyle(color: Colors.white),)),
              width: MediaQuery.of(context).size.width*.24,
              height:MediaQuery.of(context).size.height*.04 ,
            ),
            onTap: () => login(controller.text.toString()),),
          ),
        ],
      ),
    );
  }
}
