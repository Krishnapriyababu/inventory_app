import 'package:flutter/material.dart';
import 'package:inventory_app/components/my_button.dart';
import 'package:inventory_app/components/square_tile.dart';

import '../components/My_textfield.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);

  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
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
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
            //username textfield
              MyTextField(
                controller: usernameController,
                hintText: "Username",
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
         // Text Forgot password

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children :[
                    Text('Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                 ]
                ),
              ),
              const SizedBox(height: 25),

              MyButton(

                onTap:signUserIn ,
                 button_text: 'SignIn',
              ),
              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("Or COntinue with",
                      style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    //google imagebutton
                   SquareTile(imagePath: 'lib/images/img.png'),
                     SizedBox(height: 10),
                    //twitter imagebutton
                    SquareTile(imagePath: 'lib/images/img_1.png')

                  ],
                ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a Member ?",
                    style: TextStyle(
                        color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 4,),
                 const Text("Register Now",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )

            ],

          ),
        ),
      ),
    );
  }
}
