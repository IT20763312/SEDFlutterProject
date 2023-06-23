import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sed_project/model/investments.dart';
import 'package:sed_project/model/like_to_start_business.dart';
import 'package:sed_project/model/like_to_start_business_data.dart';
import 'package:sed_project/model/nature_details.dart';
import 'package:sed_project/model/service_category_details.dart';
import 'package:sed_project/model/training_needs.dart';
import 'package:sed_project/services/http_requests.dart';
import 'package:sed_project/sqlf%20DB/registration_db.dart';

class LikeToStartScreen extends StatefulWidget {
  LikeToStart likeToStart;


  LikeToStartScreen(this.likeToStart);

  @override
  _LikeToStartScreenState createState() => _LikeToStartScreenState();
}

class _LikeToStartScreenState extends State<LikeToStartScreen> {
  final describeBusinessController = TextEditingController();
  DateTime date;
  NatureDetails natureDetail;
  TrainingNeeds trainingNeedsObj;
  ServiceCategoryDetails serviceCategoryDetailsObj;
  Investment investmentObj;
  int localId=0;
  String serverId;
  String businessId;
  int busiId=0;

  List<NatureDetails> natureDetails = [];
  List<String> nature = [];

  List<ServiceCategoryDetails> serviceCategoryDetails = [];
  List<String> serviceCategory = [];

  List<String> expectedToStart = [];
  List<String> expectedInvestment = [];

  List<Investment>investments=[
    Investment(id: 0,ID: "1",investment:'Below 100,000'),
    Investment(id: 1,ID: "2",investment:'100,001 - 500,000,'),
    Investment(id: 2,ID: "3",investment:'500,001 - 1,000,000'),
    Investment(id: 3,ID: "4",investment:'1,000,001 - 1,500,000'),
    Investment(id: 4,ID: "5",investment:'1,500,001 - 2,000,000'),
    Investment(id: 5,ID: "6",investment:'2,000,001 - 2,500,000'),
    Investment(id: 6,ID: "7",investment:'2,500,001 - 3,000,000'),
    Investment(id: 7,ID: "8",investment:'3,000,001 - 3,500,000'),
    Investment(id: 8,ID: "9",investment:'3,500,001 - 4,000,000'),
    Investment(id: 9,ID: "10",investment:'4,000,001 - 4,500,000'),
    Investment(id: 10,ID: "11",investment:'4,500,001 - 5,000,000'),
    Investment(id: 11,ID: "12",investment:'5,000,001 - 5,500,000'),
    Investment(id: 12,ID: "13",investment:'5,500,001 - Above'),
  ];

  List<TrainingNeeds> trainingNeedsDetails = [];
  List<String> trainingNeeds = [];

  List<TrainingNeeds> selectedTrainingNeeds = [];
  List<ServiceCategoryDetails> selectedServiceCategorys = [];

  String value;
  String natureName;
  String serviceName;
  String investment;
  String expectedToStartBusiness;
  String trainingNeed;
  String dateStr='*Expected to start';

  String getText(){
    if(date==null){
      return '*Expected to start';
    }
    else{
      dateStr='${date.day}/${date.month}/${date.year}';
      setState(() {});
      return dateStr;
    }
  }

  Future pickDate(BuildContext context)async {
    final initialDate=DateTime.now();
    final newDate=await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate:DateTime(DateTime.now().year-5),
        lastDate: DateTime(DateTime.now().year+5)
    );
    if(newDate==null)return;
    setState(() {
      date=newDate;
      getText();
    });
  }





  Future getAllDetails(bool data) async {
    natureDetails = (await EntrepreneurDb.instance.getBusinessNatureList());
    serviceCategoryDetails = (await EntrepreneurDb.instance.getProductServiceCategoryList());
    trainingNeedsDetails = (await EntrepreneurDb.instance.getTrainingNeedsList());

    print("lenght is"+natureDetails.length.toString());
     natureDetails.forEach((element) {
      nature.add(element.nature);
    });

    serviceCategoryDetails.forEach((element) {
      serviceCategory.add(element.code+" "+element.category);
    });

     trainingNeedsDetails.forEach((element) {
      trainingNeeds.add(element.programmeName);
    });

    investments.forEach((element) {
      expectedInvestment.add(element.investment);
    });
    if(data==true){
      setupData();
    }
    setState(() {});




  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item, style: TextStyle(fontSize: 13, color: Colors.grey)),
      );

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
                        setState(() {
                          if (vale.isEmpty) {
                            print(vale.toString());
                            searchResList.clear();
                            searchResList.addAll(list);
                          } else {
                            searchResList.clear();
                            list.forEach((element) {
                              print(element.toString());
                              if (element
                                  .toLowerCase()
                                  .contains(vale.toLowerCase())) {
                                searchResList.add(element);
                              }
                            });
                          }
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


  Widget _chipWidget(String label,Function removeFunction){
    return Chip(
      labelPadding: EdgeInsets.zero,
      onDeleted: removeFunction,
      deleteIcon: const Icon(Icons.highlight_remove_outlined,size: 15,),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          color: Colors.grey.shade600,
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      padding: const EdgeInsets.only(left: 20),
    );
  }

  @override
  Future<void> initState(){
    // TODO: implement initState
    super.initState();
    if(widget.likeToStart!=null){
      getAllDetails(true);
    }else{
      getAllDetails(false);
    }

  }
  void setupData() {
    localId=widget.likeToStart.id;
    serverId=widget.likeToStart.serverId;
    businessId=widget.likeToStart.businessId;

    if(businessId!=null){
      busiId=int.tryParse(businessId);
    }

    print("nature id is "+widget.likeToStart.natureId);
    print(natureDetails.length);
    natureDetails.forEach((e) {
      print('nature id is normal'+e.natureId);
      if(e.natureId==widget.likeToStart.natureId){
        print("nature id went in ");
        natureDetail=e;
      }
    });

    investments.forEach((e) {
      if(e.ID==widget.likeToStart.expectedInvestmentId){
        investmentObj=e;
      }
    });

    describeBusinessController.text=widget.likeToStart.describeBusiness;
    dateStr=widget.likeToStart.expectedStartDate;
    print("expected date is "+ widget.likeToStart.expectedStartDate);

    if(widget.likeToStart.productServiceCategoryList.isNotEmpty){
      selectedServiceCategorys.addAll(widget.likeToStart.productServiceCategoryList);
    }else{
      print("not product service category list ");
    }

    if(widget.likeToStart.trainingNeedsList.isNotEmpty){
      selectedTrainingNeeds.addAll(widget.likeToStart.trainingNeedsList);
    }else{
      print("not training needs ");
    }

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


  bool allValidations(){
    if(natureDetail==null){
      showSnackBar(context, "Select nature!");
      return false;
    }else if(selectedServiceCategorys.isEmpty){
      showSnackBar(context, "Add product/service category!");
      return false;
    }else if(describeBusinessController.text.isEmpty){
      showSnackBar(context, "Describe your business!");
      return false;
    }else if(investmentObj==null){
      showSnackBar(context, "Select expected investment!");
      return false;
    }else if(dateStr==null){
      showSnackBar(context, "Select expected to start date!");
      return false;
    }else if(selectedTrainingNeeds.isEmpty){
      showSnackBar(context, "Add training needs!");
      return false;
    }
    else{
      setState(() {});
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 60,
              ),
              child: Center(
                child: Container(
                  child: const Text(
                    "Like to Start a Business",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Nature",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/nature_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                int index = await _showDialog(context, nature) ;
                                if(index!=null){
                                  String temp  = nature[index];
                                  natureDetail = natureDetails[index];
                                  if(temp!=natureDetail.nature){
                                    for(int i=0;i<natureDetails.length;i++){
                                      if(temp==natureDetails[index].nature){
                                        natureDetail=natureDetails[index];
                                        break;
                                      }
                                    }
                                  }
                                }

                                setState(() {});
                              },
                              child: Text(
                                natureDetail != null
                                    ? natureDetail.nature ?? "*Select Nature"
                                    : "*Select Nature",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/product_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            Expanded(child: GestureDetector(
                              onTap: () async {
                                int index = (await _showDialog(context, serviceCategory));
                                String temp  = serviceCategory[index];
                                serviceCategoryDetailsObj = serviceCategoryDetails[index];
                                if(temp!=serviceCategoryDetailsObj.category){
                                  for(int i=0;i<serviceCategoryDetails.length;i++){
                                    if(temp==serviceCategoryDetails[index].category){
                                      serviceCategoryDetailsObj=serviceCategoryDetails[index];
                                      break;
                                    }
                                  }
                                }
                                setState(() {});
                              },
                              child: Text(
                                serviceCategoryDetailsObj != null
                                    ? serviceCategoryDetailsObj.category ??
                                    "*Select Product/Service Category"
                                    : "*Select Product/Service Category",
                                softWrap: true,
                                style:
                                TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ))
                            ,
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: MaterialButton(
                                onPressed: () async {
                                  setState(() {
                                    if(serviceCategoryDetailsObj!=null){
                                      if(selectedServiceCategorys.contains(serviceCategoryDetailsObj)){
                                        showSnackBar(context,"Already added");
                                      }else{
                                        selectedServiceCategorys.add(serviceCategoryDetailsObj);
                                      }
                                    }
                                  });
                                },
                                child: const Text(
                                  'Add',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    selectedServiceCategorys.isEmpty?const SizedBox():Wrap(
                      spacing: 6.0,
                      runSpacing: 6.0,
                      children: List.generate(
                          selectedServiceCategorys.length, (index) {
                        ServiceCategoryDetails temp = selectedServiceCategorys[index];
                        return _chipWidget(
                            temp.category,
                                (){
                              setState(() {
                                selectedServiceCategorys.removeAt(index);
                              });
                            });
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/Icons/description_icon.svg',
                          width: 15.84,
                          height: 19.839,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            maxLength: 128,
                            maxLines: null,
                            controller: describeBusinessController,
                            keyboardType: TextInputType.multiline,
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              hintText:
                                  '*Describe Your Business Product/Service',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                              //hintText: 'Enter your Username'
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Expected Investment",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/investment_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                int index = (await _showDialog(context, expectedInvestment));
                                if(index!=null){
                                  String temp  = expectedInvestment[index];
                                  investmentObj= investments[index];
                                  if(temp!=investmentObj.investment){
                                    for(int i=0;i<investments.length;i++){
                                      if(temp==investments[index].investment){
                                        investmentObj=investments[index];
                                        break;
                                      }
                                    }
                                  }

                                }
                                setState(() {});
                              },
                              child: Text(
                                investmentObj != null
                                    ? investmentObj.investment ?? "*Expected Investment"
                                    : "*Expected Investment",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Expected to Start",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/calender_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                pickDate(context);
                                setState(() {});
                              },
                              child: Text(dateStr ,
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/training_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                int index = (await _showDialog(context, trainingNeeds));
                                String temp  = trainingNeeds[index];
                                trainingNeedsObj = trainingNeedsDetails[index];
                                if(temp!=trainingNeedsObj.programmeName){
                                  for(int i=0;i<trainingNeedsDetails.length;i++){
                                    if(temp==trainingNeedsDetails[index].programmeName){
                                      trainingNeedsObj=trainingNeedsDetails[index];
                                      break;
                                    }
                                  }
                                }
                                setState(() {});
                              },
                              child: Text(
                                trainingNeedsObj != null
                                    ? trainingNeedsObj.programmeName ?? "*Training Needs"
                                    : "*Training Needs",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: MaterialButton(
                                onPressed: () async {
                                  setState(() {
                                    if(trainingNeedsObj!=null){
                                      if(selectedTrainingNeeds.contains(trainingNeedsObj)){
                                        showSnackBar(context, "Already added");
                                      }else{
                                        selectedTrainingNeeds.add(trainingNeedsObj);
                                      }
                                    }
                                  });
                                },
                                child: const Text(
                                  'Add',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    selectedTrainingNeeds.isEmpty?const SizedBox():Wrap(
                      spacing: 6.0,
                      runSpacing: 6.0,
                      children: List.generate(
                          selectedTrainingNeeds.length, (index) {
                        TrainingNeeds temp = selectedTrainingNeeds[index];
                        return _chipWidget(
                            temp.programmeName,
                                (){
                              setState(() {
                                selectedTrainingNeeds.removeAt(index);
                              });
                            });
                      }),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 60,
                        ),
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: MaterialButton(
                            onPressed: () async {
                              try {
                                Navigator.pop(context);
                              } catch (error) {}
                            },
                            child: const Text(
                              'Back',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: MaterialButton(
                            onPressed: () async {
                              try {
                                bool checkVal=allValidations();
                                print("value is"+checkVal.toString());
                                if(checkVal){
                                  LikeToStart likeToStartBusiness=LikeToStart(
                                      id: 0,serverId: 0.toString(), businessId:busiId.toString(),natureId:(natureDetail.natureId),describeBusiness:  describeBusinessController.text,expectedInvestmentId: investmentObj.ID ,
                                      expectedStartDate: dateStr,addToConvert:0.toString(), state: '',productServiceCategoryList: selectedServiceCategorys ,trainingNeedsList: selectedTrainingNeeds );
                                  Navigator.pop(context,likeToStartBusiness);
                                }
                              } catch (error) {

                              }
                            },
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
