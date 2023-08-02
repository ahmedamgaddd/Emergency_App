
import 'package:emergency_app/screens/winch3.dart';
import 'package:emergency_app/screens/winch7.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_cubit/cubit.dart';
import '../app_cubit/states.dart';
import '../sign_up/cubit/signUp_cubit.dart';
import 'lowboy.dart';

class VehivleTransportScreen extends StatelessWidget {
  static const String routeName = 'vehicle';
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var descriptionController = TextEditingController();

  VehivleTransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.blue),
              titleSpacing: 2,
              title: Text('Vehicle Transport',
                  style: TextStyle(
                    color: Colors.blue,
                  )),
            ),
            body: SingleChildScrollView(
                child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/image/winsh3.png'),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          width: 200,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                //   AppCubit.get(context).createWinchData(
                                //     description: descriptionController.text,
                                // image: 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg',
                                //
                                // name: nameController.text,
                                //     phone: phoneController.text,
                                //   );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Winch3Screen(),
                                    ));
                              },
                              child: Text(
                                'winch 3 ton',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      OutlinedButton(onPressed: (){},
                          child: Text('Location',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                                fontSize: 20
                            ),)),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Image.asset('assets/image/winsh7.png'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          width: 200,
                          height: 40,
                          child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                        builder: (context) => Winch7Screen(),
                                      ));
                                },
                                child: Text(
                                  'winch 7 ton',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      OutlinedButton(onPressed: (){},
                          child: Text('Location',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                                fontSize: 20
                            ),)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset('assets/image/lowbod.png'),
                 Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: Colors.blue,
                         ),
                         width: 200,
                         height: 40,
                         child: Center(
                             child: ElevatedButton(
                                 onPressed: () {
                                   Navigator.push(context,
                                       MaterialPageRoute(
                                         builder: (context) =>
                                             LowboyScreen(),
                                       ));
                                 },
                                 child: Text(
                                   'lowboy 50 ton',
                                   style: TextStyle(
                                     fontSize: 17,
                                     color: Colors.white,
                                   ),
                                 ))),
                       ),
                     ),
                     SizedBox(
                       width: 20,
                     ),
                     OutlinedButton(onPressed: (){},
                         child: Text('Location',
                           style: TextStyle(
                               decoration: TextDecoration.underline,
                               color: Colors.blue,
                               fontSize: 20
                           ),)),
                   ],
                 )
                ],
              ),
            )));
      },
    );
  }
}
