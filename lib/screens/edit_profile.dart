
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_cubit/cubit.dart';
import '../app_cubit/states.dart';

class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var bioController = TextEditingController();

  EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.blue),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 15),
                child: Text(
                  'UPLOAD',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/925px-Unknown_person.jpg'),
                      radius: 100,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white10,
                      radius: 30,
                      child: IconButton(
                        onPressed: () {
                          AppCubit.get(context).getImage();
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: 'Your name',
                        hintStyle: TextStyle(
                            color: Colors.black26),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: 'phone',
                        hintStyle: TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(Icons.phone, color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: bioController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Enter your bio',
                        labelStyle: TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon:
                            Icon(Icons.text_fields, color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
