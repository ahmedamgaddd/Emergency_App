import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../app_cubit/cubit.dart';
import '../login/cubit/login_cubit.dart';
import '../login/cubit/login_states.dart';
import 'edit_profile.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'profile';

  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  bool showDetails = false ;
@override
  void initState() {
   LoginCubit.get(context).getUserData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = LoginCubit.get(context).userModel;
        var imagePick = AppCubit.get(context).image;

        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.blue),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: IconButton(onPressed: () {
                    setState(() {
                      showDetails =! showDetails ;
                    });

                  },icon: Icon(Icons.info_outline),),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Visibility(
                        visible: showDetails,
                        child: Container(
                          width: 135,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(7)
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder:
                                      (context) => EditProfileScreen(),));
                            },
                            child: Text('Go to edit profile',
                              style: TextStyle(
                              color: Colors.blue,
                            ),

                            textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'My Account ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
                             ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl: model?.profileImage ?? '', // رابط الصورة
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()), // عنصر الانتظار أثناء تحميل الصورة
                      errorWidget: (context, url, error) => Icon(Icons.error), // عنصر يظهر في حالة حدوث خطأ أثناء التحميل
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider, // الصورة المحملة
                        radius: 80, // نصف قطر الدائرة
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('${model?.name}',style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      height: 50,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.phone,),
                          ),
                          Text('${model?.phone}',style: TextStyle(
                            fontSize:16,

                          ),)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 50,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.abc_outlined,),
                          ),
                          Text('${model?.bio}',style: TextStyle(
                            fontSize:16,

                          ),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: double.infinity,
                              height: 40,
                              child: OutlinedButton(onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder:
                                        (context) => EditProfileScreen(),));
                              },
                                  child:Text('Edit profile',style: TextStyle(
                                    fontSize: 18
                                  ),))),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder:
                                      (context) => EditProfileScreen(),));
                            },
                        icon: Icon(Icons.edit,color: Colors.blue,),),
                      )
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
