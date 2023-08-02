
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergency_app/sign_up/cubit/signUp_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/user_model.dart';


class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialStates());
  static SignUpCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  void signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(
          phone: phone, name: name, email: email, uId: value.user?.uid ?? '');
      emit(SignUpSuccessStates());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(SignUpErrorStates(error.toString()));
    });
  }

  void userCreate({
    required String phone,
    required String name,
    required String email,
    required String uId,
  }) {
    userModel = UserModel(
      name: name,
      phone: phone,
      email: email,
      uId: uId,
      profileImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/925px-Unknown_person.jpg',
      bio: 'write your bio ',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel!.toMap())
        .then((value) {
      print(userModel?.profileImage);
      print(userModel?.phone);
      print(userModel?.bio);
      emit(UserCreateSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(UserCreateErrorStates(error.toString()));
    });
  }


  IconData suffix = Icons.visibility;
  bool isVisible = true; // password hide
  void changePassVisibility() {
    isVisible = !isVisible;
    suffix = isVisible ? Icons.visibility : Icons.visibility_off;
    emit(SignUpChangePassVisibilityStates());
  }

  GoogleSignIn googleSignIn = GoogleSignIn();
  Future<void> signInWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  }
}
