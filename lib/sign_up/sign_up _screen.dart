
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../screens/home_screen.dart';
import 'cubit/signUp_cubit.dart';
import 'cubit/signUp_states.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'sign up';
  bool isVisible = true;
  var formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is UserCreateSuccessStates) {
          Fluttertoast.showToast(
            msg: "SIGN UP SUCCESSFULLY ",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );}
        if(state is SignUpErrorStates) {
          Fluttertoast.showToast(
              msg:
              "Not allowed to sign up , please sure of data and try again",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        if(state is UserCreateSuccessStates){
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) => HomeScreen(),),
                  (route) => false);
        }
      },
      builder: (context, state) {
        var cubit = SignUpCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0XFF6695FF),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0XFF6695FF),
          ),
          body: SingleChildScrollView(
              child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  child: Image.asset(
                    'assets/image/login.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1000,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(30),
                        topEnd: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30, left: 30),
                          child: TextFormField(
                            controller: fullNameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return ('full name must not be empty');
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                labelText: 'Full Name',
                                prefixIcon: Icon(
                                  Icons.person,
                                  size: 25,
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 30, left: 30),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return ('email must not be empty');
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                labelText: 'Email Address',
                                prefixIcon: Icon(
                                  Icons.email,
                                  size: 25,
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 30, left: 30),
                          child: TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return ('password must not be empty');
                              }
                              return null;
                            },
                            obscureText: cubit.isVisible,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                labelText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 25,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    cubit.changePassVisibility();
                                  },
                                  child: Icon(cubit.isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 30, left: 30),
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return ('phone must not be empty');
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                labelText: 'phone',
                                prefixIcon: Icon(
                                  Icons.phone,
                                  size: 25,
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: TextButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.signUp(
                                            name: fullNameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            phone: phoneController.text);
                                       }
                                      // //Navigator.pushNamed(context, HomeScreen.routeName);
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => HomeScreen(),
                                      //     ));
                                    },
                                    child: Text(
                                      'Create Account',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    )),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/image/google.png'
                                ),
                                radius: 15,
                                backgroundColor: Colors.white,
                              ),
                              TextButton(
                                  onPressed: () {
                                    SignUpCubit.get(context).signInWithGoogle();
                                  },
                                  child: Text(
                                    'Sign Up With Google',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
