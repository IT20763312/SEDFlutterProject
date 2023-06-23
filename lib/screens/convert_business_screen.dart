import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:sed_project/model/business.dart';
import 'package:sed_project/model/selected_image.dart';
import 'package:sed_project/screens/convert_business_business_screen.dart';
import 'package:sed_project/sqlf%20DB/registration_db.dart';

class ConvertBusinessScreen extends StatefulWidget {
  const ConvertBusinessScreen({Key key}) : super(key: key);

  @override
  _ConvertBusinessScreenState createState() => _ConvertBusinessScreenState();
}

class _ConvertBusinessScreenState extends State<ConvertBusinessScreen> {
  String searchItem = 'Search...';
  bool searched = false;
  String nicNumber;
  String ltsBusinessStr="";
  List<Business> businessDetails=[];
  List<Business> ltsBusiness=[];
  List<String> businessDetailsList = [];
  Business businessObj;




  Future getAllDetails()async{
    businessDetails = await EntrepreneurDb.instance.getBusinessToConvertList();
    businessDetails.forEach((element) {
      businessDetailsList.add(element.entrepreneurNic);
    });
    print(businessDetailsList);
  }

  Future getBusinessListRelatedToNic(String nic)async{
    print('nic is'+nic);
    ltsBusiness= await EntrepreneurDb.instance.getLtsBusinessesByNic(nic);
    ltsBusiness.forEach((element) {
      ltsBusinessStr=element.businessId;
      print("business Id is "+element.businessId);
    });
    setState(() {});
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      backgroundColor: Colors.blue,
      content: Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      action: SnackBarAction(
        label: 'Ok',
        textColor: Colors.white,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget searchResultUI()  {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40,right: 40),
          child: Container(
              color: Colors.blue,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Text(
                    'Business Id',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 140,),
                  Text(
                    'Action',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 40,right: 40),
          child: Container(
              child: Row(
                children: [
                  SizedBox(width: 12,),
                  Text(
                    ltsBusinessStr,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 180,),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: MaterialButton(
                      onPressed: () async {
                        try {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConvertBusinessInfoScreen(businessObj)));
                          searched=false;
                          setState(() {});
                        } catch (error) {}
                      },
                      child: const Text(
                        'Convert',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
          ),
        )
      ],
    );

  }

  Future<void> watitingControllder;
  Future<int> _showDialog(context, List<String> list) async {
    TextEditingController _text = TextEditingController();
    List<String> searchResList = [];
    searchResList.addAll(list);
    return showDialog<int>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: TextField(
                      controller: _text,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.grey,
                      style:
                          TextStyle(color: Colors.grey.shade800, fontSize: 12),
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Type Here To Search",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                        border: InputBorder.none,
                      ),
                      onChanged: (vale) {
                        if(watitingControllder!=null){
                          watitingControllder.ignore();
                        }
                        watitingControllder =
                            Future.delayed(const Duration(seconds: 1)).then((
                                value){
                              setState((){
                                if(vale.isEmpty){
                                  print(vale.toString());
                                  searchResList.clear();
                                  searchResList.addAll(list);
                                }else{
                                  searchResList.clear();
                                  list.forEach((element) {
                                    print(element.toString());
                                    if(element.toLowerCase().contains(vale.toLowerCase())){
                                      searchResList.add(element);
                                    }
                                  });
                                }
                              });
                            });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(searchResList.length, (index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                  context, list.indexOf(searchResList[index]));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      searchResList[index],
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade500),
                                      softWrap: true,
                                    )),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Divider(),
                              ],
                            ));
                      }),
                    ),
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllDetails();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Convert Like To Start Business',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(color: Colors.blue, boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Select NIC of Entrepreneur',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 3))
                      ]),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/nic_card_icon.svg',
                              height: 30,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  int index = (await _showDialog(context, businessDetailsList)) ;
                                  if(index!=null){
                                    businessObj=businessDetails[index];
                                    nicNumber = businessDetailsList[index];
                                  }
                                  setState(() {});
                                },
                                child: Text(nicNumber != null
                                      ? nicNumber ?? "NIC Number"
                                      : "NIC Number",
                                  style:
                                      TextStyle(fontSize: 15, color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 60,right: 60),
              child: Container(
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: MaterialButton(
                  onPressed: () async {
                    try {
                        if(nicNumber==null){
                          showSnackBar(context,"Please select a nic!");
                        }else{
                          searched=true;
                          await getBusinessListRelatedToNic(nicNumber);
                          setState(() {});
                        }
                    } catch (error) {
                      print(error.toString());
                    }
                  },
                  child: const Text(
                    'Search',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Divider(),
            searched ? searchResultUI() :SizedBox()
          ],
        ),
      ),
    ));
  }
}
