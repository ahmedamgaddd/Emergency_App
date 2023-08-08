
import 'package:emergency_app/screens/map_screen2.dart';
import 'package:emergency_app/screens/map_screen3.dart';
import 'package:emergency_app/screens/map_screen4.dart';
import 'package:emergency_app/screens/vehivle_transport.dart';
import 'package:emergency_app/screens/vehivlefuel_screen.dart';
import 'package:flutter/material.dart';

import 'map_screen.dart';


class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),

            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VehivleFuelScreen(),
                          ));
                    },
                    child: const Text(
                      'Gas Station',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/2021_5_12_23_50_3_634 1.png'),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 50,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                          return  VehivleTransportScreen();

                        }
                        ));

                      },
                      child: const Text(
                        'Winch',
                        style: TextStyle(color: Colors.white,
                            fontSize: 25),
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/خدمات-انقاذ-السيارات 1.png',
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                              return const MapScreen2();

                            }
                            ));
                          },
                          child: const Text(
                            'ATM',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                  OutlinedButton(onPressed: (){},
                      child: const Text('Location',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontSize: 20
                        ),)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/atm.jpg'),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                              return const MapScreen();

                            }
                            ));
                          },
                          child: const Text(
                            'Hospital',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                  OutlinedButton(onPressed: (){},
                      child: const Text('Location',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontSize: 20
                        ),)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/WhatsApp Image 2023-07-09 at 18.08.48.jpg'),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                              return const MapScreen3();

                            }
                            ));
                          },
                          child: const Text(
                            'Car Services',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                  OutlinedButton(onPressed: (){},
                      child: const Text('Location',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontSize: 20
                        ),)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/car repair.jpg'),
          ],
        ),
      ),
    );
  }
}