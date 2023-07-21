import 'package:emergency_app/screens/map_screen1.dart';
import 'package:emergency_app/screens/map_screen3.dart';
import 'package:emergency_app/screens/map_screen4.dart';
import 'package:flutter/material.dart';

class VehivleFuelScreen extends StatelessWidget {
  static const String routeName = 'vehicle';

  const VehivleFuelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
              color: Colors.blue
          ),
          titleSpacing: 2,
          title: const Text('Vehicle Fuel',style: TextStyle(
            color: Colors.blue,
          )),

        ),
        body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/محطات بترول 1.png'),
                  const SizedBox(height: 10,),
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                  return const MapScreen1();

                                }
                                ));
                              },
                              child: const Text(
                                'Petrol Station',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
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
                  const SizedBox(height: 20,),
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Image.asset('assets/محطات كهرباء 1.png'),
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
                                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                      return const MapScreen1();

                                    }
                                    ));
                                  },
                                  child: const Text(
                                    'Electric Station',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
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
                    ],
                  ),
                  const SizedBox(height: 50,),
                  Image.asset('assets/محطات غاز 1.png'),
                  const SizedBox(height: 5,),
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                  return const MapScreen1();

                                }
                                ));
                              },
                              child: const Text(
                                'Gas Station',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
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
                ],
              ),
            )
        )
    );
  }
}