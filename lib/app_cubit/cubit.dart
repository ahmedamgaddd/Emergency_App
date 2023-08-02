import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergency_app/app_cubit/states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:url_launcher/url_launcher_string.dart';

import '../model/winch_model.dart';



class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());
  static AppCubit get(context) => BlocProvider.of(context);
  WinchModel? winchModel;
  Future<void> createWinch3Data({
    required String description,
    required String image,
    required String name,
    required String phone,
  }) async {
    WinchModel winchModel = WinchModel(
      description: 'This winch holds 3 ton of any thing',
      image:
          'https://sc04.alicdn.com/kf/H5ba2f1d980c04718b4b7c18ac834b94bE.jpg',
      name: 'Winch 3 ton',
      phone: '01124726782',
    );
    await FirebaseFirestore.instance
        .collection('data')
        .add(winchModel.toMap())
        .then((value) {
      emit(CreateWinchDataSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(CreateWinchDataErrorStates(error.toString()));
    });
  }

  Future<void> getWinch3Data() async {
    await FirebaseFirestore.instance.collection('data').get().then((value) {
      value.docs.forEach((doc) {
        winchModel = WinchModel.fromJson(doc.data());
      });
      emit(GetWinchDataSuccessStates());
    }).catchError((error) {
      print('hello');
      print(error.toString());
      emit(GetWinchDataErrorStates(error.toString()));
    });
  }

  File? image;
  var picker = ImagePicker();
  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(GetImageSuccessStates());
    } else {
      emit(GetImageErrorStates());
      print(' no image selected');
    }
  }

  String phoneNumber = '+201124726782'; // رقم الهاتف الذي تريد الاتصال به
  void callPhone() async {
    String url = 'tel:$phoneNumber';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      print ('Could not launch $url');
    }
  }

}
