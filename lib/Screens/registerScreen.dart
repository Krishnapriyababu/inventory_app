import 'package:flutter/material.dart';

import '../components/My_textfield.dart';
import '../components/my_button.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
   String? gender;
   int radioId = 1;
   //sign  user in method
   void signUserIn(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300] ,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const SizedBox(height: 50),
              //logo
              const Icon(Icons.lock,
                size: 100,),
              const SizedBox(height: 50),
              //username textfield
              MyTextField(
                controller: usernameController,
                hintText: "Name",
                obscureText: false,
              ),

              const SizedBox(height: 25),
              MyTextField(
                controller: usernameController,
                hintText: "Email Id",
                obscureText: false,
              ),

              const SizedBox(height: 25),
              MyTextField(
                controller: usernameController,
                hintText: "Confirm Password",
                obscureText: false,
              ),

              const SizedBox(height: 25),
              //password Textfield
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText:true ,
              ),

              const SizedBox(height: 25),
          //radio button
           Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: radioId,
                onChanged: (val) {

                },
              ),
              Text(
                'Supervisor',
                style: new TextStyle(fontSize: 17.0),
              ),

              Radio(
                value: 2,
                groupValue: radioId,
                onChanged: (val) {

                },
              ),
              Text(
                'Employe',
                style: new TextStyle(
                  fontSize: 17.0,
                ),
              ),
          ],
        ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    onTap:signUserIn, button_text: 'SignUp' ,
                  ),
                  MyButton(
                    onTap:signUserIn, button_text: 'Clear' ,
                  ),
                ],
              ),
              const SizedBox(height: 50),


            ],

          ),
        ),
      ),
    );
  }
}
