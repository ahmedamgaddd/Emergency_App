
import 'package:flutter/material.dart';

class VehivleFuelScreen extends StatelessWidget {
static const String routeName = 'vehicle';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.blue
        ),
        titleSpacing: 2,
        title: Text('Vehicle Fuel',style: TextStyle(
            color: Colors.blue,
        )),

      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/image/fuel.png'),
              SizedBox(height: 10,),
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
                          onPressed: () {},
                          child: Text(
                            'Petrol Station',
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
              SizedBox(height: 20,),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Image.asset('assets/image/electricity.png'),
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
                              onPressed: () {},
                              child: Text(
                                'Electric Station',
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
                ],
              ),
              SizedBox(height: 50,),
              Image.asset('assets/image/gas.png'),
              SizedBox(height: 5,),
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
                          onPressed: () {},
                          child: Text(
                            'Gas Station',
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
            ],
          ),
        )
      )
    );
  }
}
