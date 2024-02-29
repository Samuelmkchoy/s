// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'forgot_pw_page.dart';

class LoginPage extends StatefulWidget{
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //sign method

  Future signIn() async {

    //loading
    showDialog(
      context: context,
       builder: (context){
        return Center(
          child: CircularProgressIndicator()
          );
       },
    );
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim(),
    );

    //pop the loading 
    Navigator.of(context).pop();

  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          
                //Logo Name
                Image.asset("images/icon.jpg"),
               
                const SizedBox(height: 10),
                const Text(
                  'Login Page',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    ),
                ),
                const SizedBox(height: 30),
          
                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(12),                      
                      ),
                      hintText: 'Email',
                      fillColor: Colors.grey[300],
                      filled: true,
                      ),
                    ),
                  ),
                const SizedBox(height: 10),
          
                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(12),                      
                      ),
                      hintText: 'Password',
                      fillColor: Colors.grey[300],
                      filled: true,
                      ),
                    ),
                  ),
              
              const SizedBox(height: 10),

              // Forgot password
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context){
                              return const ForgotPasswordPage();
                            },
                          ),
                        );
                      },

                      child: const Text('Forgot password?',
                          style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 10),

              // sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange[300],
                      borderRadius: BorderRadius.circular(12),
                      ),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                ),
                ),
                const SizedBox(height: 25),
          
                // resgister now~
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                    'Not a member?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text(
                      ' Resgister now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}