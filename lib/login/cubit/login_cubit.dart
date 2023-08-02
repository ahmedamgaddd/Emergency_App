import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user_model.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialStates());
  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          print(value.user?.email);
          print(value.user?.uid);
          emit(LoginSuccessStates());
    })
        .catchError((error) {
      // if (password.length>=6){
      //   Flutter toast.showToast(
      //     msg: "short password",
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 5,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0,
      //   );
      // }
      emit(LoginErrorStates(error.toString()));
    });
  }
  Future<void> getUserData() async {
    await FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((doc) {
        userModel = UserModel.fromJson(doc.data());
        print(userModel?.profileImage);
        print(userModel?.name);
        print(userModel?.bio);
      });
      emit(GetUserDataSuccessStates());
    }).catchError((error) {
      print('hello');
      print(error.toString());
      emit(GetUserDataErrorStates(error.toString()));
    });
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true; // password hide
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(LoginChangePassVisibilityStates());
  }
}
