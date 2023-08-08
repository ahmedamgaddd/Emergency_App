import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../screens/home_screen.dart';
import '../sign_up/sign_up _screen.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_states.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessStates) {
          Fluttertoast.showToast(
            msg: "LOGIN SUCCESSFULLY ",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          Fluttertoast.showToast(
              msg:
                  "Not allowed to log in , please sure of data and try again",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        if( state is LoginSuccessStates){
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) => HomeScreen(),
              ), (route) => false);
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                'Emergency',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.blue,
                ),
              ),
              elevation: 0,
            ),
            body: SingleChildScrollView(
                child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(
                    'assets/login.png',
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 50, left: 50),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ('user name must not be empty');
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'User Name',
                          prefixIcon: Icon(Icons.person),
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: TextFormField(
                      obscureText: cubit.isPassword,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ('password must not be empty');
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: () {
                              cubit.changePasswordVisibility();
                            },
                            child: Icon(cubit.isPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.userLogin(
                                email: emailController.text,
                                password: passwordController.text);

                          }
                          // Navigator.push(context, MaterialPageRoute(
                          //     builder: (context) => HomeScreen(),));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account ?',
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, SignUpScreen.routeName);
                        },
                        child: const Text(
                          'Sign up ',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
      },
    );
  }
}
