import 'package:cached_network_image/cached_network_image.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_cubit/cubit.dart';
import '../app_cubit/states.dart';

class LowboyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = AppCubit.get(context).winchModel;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,

            title: Text(
              'Lowboy',
              style: TextStyle(color: Colors.blue),
            ),
            iconTheme: IconThemeData(color: Colors.blue),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/d/db/Blokvogn.jpg',
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.fill,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Details :',
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.underline),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15),
                      child: Row(
                        children: [
                          Icon(Icons.text_fields),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            textAlign: TextAlign.left,
                            'Lowboy',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              AppCubit.get(context).callPhone();
                            },
                            child: Text(
                              '01124726782',
                              style: TextStyle(
                                  fontSize: 21,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Container(
                    height: 80,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.description_outlined),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'This lowboy holds 50 ton of any thing',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Container(
                      height: 70,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.directions),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text('Train station _ Zagazig _ Sharquia',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                            )
                          ],
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
