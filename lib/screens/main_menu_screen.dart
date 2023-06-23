import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sed_project/model/user_details.dart';
import 'package:sed_project/screens/convert_business_screen.dart';
import 'package:sed_project/screens/page_cover.dart';
import 'package:sed_project/screens/progress_screen.dart';
import 'package:sed_project/screens/register_screen.dart';

import 'evaluation_screen.dart';
import 'main_menu_pagecover.dart';

class MainMenuScreen extends StatefulWidget {
  UserDetails userDetails;


  MainMenuScreen(this.userDetails);

  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:MenuPageCover(
          needBack: true,
          needBottom: true,
          title: "Google Maps",
          needTop: false,
          needBackground: true,
          body: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:50),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(width:40 ,),
                          Container(
                              child: Image.asset('assets/image/profile_image.png', alignment: Alignment.center, height: 100, width: 100,)
                          ),
                          SizedBox(width:40 ,),
                          Text(
                            'A.Sachika Nimantha\n             EDTO',
                            style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20,left: 30),
                    child: Row(
                      children: [
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:[
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      offset: Offset(0 , 3)
                                  )
                                ]
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:20),
                                      child: SvgPicture.asset(
                                        'assets/Icons/suitcase_icon.svg',
                                        height:20.839 ,
                                        width:15.84 ,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom:7),
                                      child: Text(
                                        'Registered ENT',
                                        style: TextStyle(color: Colors.blue, fontSize: 15,fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 30,),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('3,450',
                                      style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
                                    ),
                                    // SizedBox(width: 160,),
                                    // Container(
                                    //   height: 30,
                                    //   decoration: BoxDecoration(
                                    //       color: Colors.blue,
                                    //       borderRadius: BorderRadius.circular(10)),
                                    //   child: MaterialButton(
                                    //     onPressed: () async {
                                    //       try {
                                    //         // Navigator.pushReplacement(context,
                                    //         //     MaterialPageRoute(builder: (context) => RegisterScreen()));
                                    //       } catch (error) {
                                    //
                                    //       }
                                    //     },
                                    //     child: Text(
                                    //       'More',
                                    //       style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: Container(

                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow:[
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                        offset: Offset(0 , 3)
                                    )
                                  ]
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top:20),
                                        child: SvgPicture.asset(
                                          'assets/Icons/task_icon.svg',
                                          height:20.839 ,
                                          width:15.84 ,
                                          color: Colors.red,
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom:7),
                                        child: Text(
                                          'First Evaluation',
                                          style: TextStyle(color: Colors.red, fontSize: 15,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(width: 30,),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Row(
                                      children: [
                                        Text('1,760',
                                          style: TextStyle(color: Colors.black, fontSize:15,fontWeight: FontWeight.bold),
                                        ),
                                        // SizedBox(width: 160,),
                                        // Container(
                                        //   height: 30,
                                        //   decoration: BoxDecoration(
                                        //       color: Colors.red,
                                        //       borderRadius: BorderRadius.circular(10)),
                                        //   child: MaterialButton(
                                        //     onPressed: () async {
                                        //       try {
                                        //         // Navigator.pushReplacement(context,
                                        //         //     MaterialPageRoute(builder: (context) => RegisterScreen()));
                                        //       } catch (error) {
                                        //
                                        //       }
                                        //     },
                                        //     child: Text(
                                        //       'More',
                                        //       style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:20,right: 32,left: 30),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow:[
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: Offset(0 , 3)
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 90,),
                                Padding(
                                  padding: const EdgeInsets.only(top:20),
                                  child: SvgPicture.asset(
                                    'assets/Icons/progressbar_icon.svg',
                                    height:20.839 ,
                                    width:15.84 ,
                                    color: Colors.green,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:7),
                                  child: Text(
                                    'Total Progress',
                                    style: TextStyle(color: Colors.green, fontSize: 15,fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 150,),
                                Text('1,760',
                                  style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
                                ),
                                // SizedBox(width: 160,),
                                // Container(
                                //   height: 30,
                                //   decoration: BoxDecoration(
                                //       color: Colors.green,
                                //       borderRadius: BorderRadius.circular(10)),
                                //   child: MaterialButton(
                                //     onPressed: () async {
                                //       try {
                                //         // Navigator.pushReplacement(context,
                                //         //     MaterialPageRoute(builder: (context) => RegisterScreen()));
                                //       } catch (error) {
                                //
                                //       }
                                //     },
                                //     child: Text(
                                //       'More',
                                //       style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
                                //     ),
                                //   ),
                                // ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/image/register.png', alignment: Alignment.center, height: 80, width: 50,),
                                SizedBox(width: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:7),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => RegisterScreen(widget.userDetails)));
                                    },
                                    child: Text(
                                      'Register \nEntrepreneurs',
                                      style: TextStyle(color: Colors.blue, fontSize: 16,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 35,),
                                Image.asset('assets/image/evaluation.png', alignment: Alignment.center, height: 80, width: 50,),
                                SizedBox(width: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:7),
                                  child: GestureDetector(
                                    onTap:(){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => EvaluationScreen(widget.userDetails)));
                                    },
                                    child: Text(
                                      'Evaluation',
                                      style: TextStyle(color: Colors.blue, fontSize: 16,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 33),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/image/evaluation.png', alignment: Alignment.center, height: 80, width: 50,),
                                SizedBox(width: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:7),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => ProgressScreen()));
                                    },
                                    child: Text(
                                      'Progress',
                                      style: TextStyle(color: Colors.blue, fontSize: 16,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 72,),
                                Image.asset('assets/image/edit.png', alignment: Alignment.center, height: 80, width: 50,),
                                SizedBox(width: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:7),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => ConvertBusinessScreen()));
                                    },
                                    child: Text(
                                      'Convert \nBusiness',
                                      style: TextStyle(color: Colors.blue, fontSize: 16,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
