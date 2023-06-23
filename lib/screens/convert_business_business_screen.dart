
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sed_project/model/business.dart';
import 'package:sed_project/model/business_registration.dart';
import 'package:sed_project/model/district.dart';
import 'package:sed_project/model/entrepreneur_mainproduct_service.dart';
import 'package:sed_project/model/entrepreneur_product_service.dart';
import 'package:sed_project/model/entrepreneur_training_needs.dart';
import 'package:sed_project/model/for_requests/insert_converted_l_s.dart' as entConvImport;
import 'package:sed_project/model/have_a_business.dart';
import 'package:sed_project/model/have_a_business_data.dart';
import 'package:sed_project/model/investments.dart';
import 'package:sed_project/model/main_product_service.dart';
import 'package:sed_project/model/nature_details.dart';
import 'package:sed_project/model/ownership.dart';
import 'package:sed_project/model/selected_image.dart';
import 'package:sed_project/model/service_category_details.dart';
import 'package:sed_project/model/training_needs.dart';
import 'package:sed_project/services/http_requests.dart';
import 'package:sed_project/sqlf%20DB/registration_db.dart';

import 'image_converter.dart';

class ConvertBusinessInfoScreen extends StatefulWidget {
 Business business;


 ConvertBusinessInfoScreen(this.business);

  @override
  _ConvertBusinessInfoScreenState createState() => _ConvertBusinessInfoScreenState();
}

class _ConvertBusinessInfoScreenState extends State<ConvertBusinessInfoScreen> {
  final businessName = TextEditingController();
  final contactNumber = TextEditingController();
  final businessAddress1 = TextEditingController();
  final businessAddres2 = TextEditingController();
  final mainProductController = TextEditingController();
  final regNoController = TextEditingController();
  List<Ownership> ownerShipList = [
    Ownership(id: 0,ID: "1",ownership:"Sole" ),
    Ownership(id: 1,ID: "2",ownership:"Partnership" ),
    Ownership(id: 2,ID: "3",ownership:"Limited" ),
  ];
  List<BusinessRegistration> businessRegistrationObjList = [
    BusinessRegistration(id: 0,ID: "1",businessRegistration:'Not Registered' ),
    BusinessRegistration(id: 1,ID: "2",businessRegistration:'Registered in DS' ),
    BusinessRegistration(id: 2,ID: "3",businessRegistration:'Registered in DCSR' ),

  ];
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
  List<String> districts = [];
  List<String> natures = [];
  List<String> productServiceCategory = [];
  List<String> trainingNeeds = [];
  List<String> mainProductList = [];
  List<NatureDetails> natureDetails = [];
  List<TrainingNeeds> trainingNeedsDetails = [];
  List<District> districtList=[];
  List<ServiceCategoryDetails> serviceCategoryDetails = [];
  List<String> businessRegistrationList = [];
  List<String> expectedInvestment = [];
  List<String>ownershipList=[];

  NatureDetails natureDetail;
  TrainingNeeds trainingNeedsObj;
  ServiceCategoryDetails serviceCategoryDetailsObj;
  District districtObj;
  BusinessRegistration businessRegistrationObj;
  Investment investmentObj;
  Ownership ownershipObj;


  List<TrainingNeeds> selectedTrainingNeeds = [];
  List<ServiceCategoryDetails> selectedServiceCategorys = [];
  List<MainProductService> selectedMainProducts = [];

  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;

  String startDate;
  String regDate;


  String initialInv;
  String owner;
  String district;
  String businessReg;
  String nature;
  String productSerCat;
  String trainNeed;

  DateTime date;
  DateTime dateReg;

  List<SelectedImage> selectedImage = [];
  bool valueCheck=false;

  Future getAllDetails()async{
    districtList = (await EntrepreneurDb.instance.getDistrictList());
    natureDetails = (await EntrepreneurDb.instance.getBusinessNatureList());
    serviceCategoryDetails = (await EntrepreneurDb.instance.getProductServiceCategoryList());
    trainingNeedsDetails = (await EntrepreneurDb.instance.getTrainingNeedsList());

    investments.forEach((element) {
      expectedInvestment.add(element.investment);
    });

    businessRegistrationObjList.forEach((element) {
      businessRegistrationList.add(element.businessRegistration);
    });

    ownerShipList.forEach((element) {
      ownershipList.add(element.ownership);
    });

    districtList.forEach((element) {
      districts.add(element.districtName);
    });

    natureDetails.forEach((element) {
      natures.add(element.nature);
    });

    trainingNeedsDetails.forEach((element) {
      trainingNeeds.add(element.programmeName);
    });

    serviceCategoryDetails.forEach((element) {
      productServiceCategory.add(element.code+" "+element.category);
    });

  }

  addSelectedImage(String description,File image){
    setState(() {
      selectedImage.add(SelectedImage(description, image));
    });
  }

  removeSelectedImage(int index){
    setState(() {
      selectedImage.removeAt(index);
    });
  }


  Widget getColumn(){
    return Column(
      children:selectedImage.isEmpty?[]:List.generate(selectedImage.length, (index) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width/4,
                  height: MediaQuery.of(context).size.width/4,
                  child: Image.file(selectedImage[index].image,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(selectedImage[index].description,
                    textAlign: TextAlign.left,
                    softWrap: true,
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: (){removeSelectedImage(index);},
                child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.black38,
                  child: const Icon(Icons.cancel_rounded,color: Colors.white,size: 20),
                ),
              ),
            )
          ],
          alignment: Alignment.topRight,
        ),
      )),
    );
  }

  String getText(){
    if(date==null){
      return '*Started Date';
    }
    else{
      startDate='${date.day}/${date.month}/${date.year}';
      return '${date.day}/${date.month}/${date.year}';
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
    setState(() =>date=newDate);
  }

  String getTextReg(){
    if(dateReg==null){
      return '*Registered Date';
    }
    else{
      regDate='${dateReg.day}/${dateReg.month}/${dateReg.year}';
      return '${dateReg.day}/${dateReg.month}/${dateReg.year}';
    }
  }

  Future pickDateReg(BuildContext context)async {
    final initialDate=DateTime.now();
    final newDate=await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate:DateTime(DateTime.now().year-5),
        lastDate: DateTime(DateTime.now().year+5)
    );
    if(newDate==null)return;
    setState(() =>dateReg=newDate);
  }




  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(item, style: TextStyle(fontSize: 13, color: Colors.grey)),
  );




  Future<int>_showDialog(context,List<String> list)async{
    TextEditingController _text = TextEditingController();
    List<String> searchResList=[];
    searchResList.addAll(list);
    return showDialog<int>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: StatefulBuilder(builder: (context, setState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height/3,
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
                    style: TextStyle(color: Colors.grey.shade800,fontSize: 12),
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "Type Here To Search",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 12),
                      border: InputBorder.none,
                    ),
                    onChanged: (vale){
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
                    },
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(searchResList.length, (index){
                          return GestureDetector(
                              onTap: (){
                                Navigator.pop(context,list.indexOf(searchResList[index]));
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
                                            style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.grey.shade500),
                                            softWrap: true,
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Divider(),
                                ],
                              )
                          );
                        }),
                      ),
                    )
                )
              ],
            ),
          );
        },),
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


  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose an Image",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            IconButton(
              icon: const Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
            ),
            IconButton(
              icon: const Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
            ),
          ])
        ],
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        _imageFile == null
            ? Image.asset(
          'assets/image/camera.png',
          alignment: Alignment.center,
          height: 30,
          width: 30,
        )
            : Image.file(
          File(_imageFile.path),
          width: 30,
          height: 30,
        ),
      ]),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllDetails();
    print("nic is "+widget.business.entrepreneurNic);
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

  bool  allValidations(){
    if(businessName.text.isEmpty){
      showSnackBar(context, "Enter business name!");
      return false;
    }else if(contactNumber.text.isEmpty){
      showSnackBar(context, "Enter business contact number!");
      return false;
    }else if(businessAddress1.text.isEmpty){
      showSnackBar(context, "Enter business address!");
      return false;
    }else if(!valueCheck && regNoController.text.isEmpty){
      showSnackBar(context, "Enter registration number!");
      return false;
    }else if(districtObj==null){
      showSnackBar(context, "Select business district!");
      return false;
    }else if(businessRegistrationObj==null){
      showSnackBar(context, "Select business registration type!");
      return false;
    }else if(ownershipObj==null){
      showSnackBar(context, "Select business ownership type!");
      return false;
    }else if(!valueCheck && regDate=='*Registered Date'){
      showSnackBar(context, "Set registration date!");
      return false;
    }else if(natureDetail==null){
      showSnackBar(context, "Select nature!");
      return false;
    }else if(selectedMainProducts.isEmpty){
      showSnackBar(context, "Add main product/service! ");
      return false;
    }else if(selectedTrainingNeeds.isEmpty){
      showSnackBar(context, "Add training need! ");
      return false;
    }else if(selectedServiceCategorys.isEmpty){
      showSnackBar(context, "Add product/service category! ");
      return false;
    }
    else{
      setState(() {});
      return true;
    }
  }

  Future<void>insertConvertBusinessToServer(HaveABusiness haveABusinessObj) async{
    String dateTime = DateTime.now().toString();
    int mainProductServiceID = 0;
    var productServiceServerID;
    int trainingNeedsServerID = 0;
    String storageFileName = '';

    await EntrepreneurDb.instance.deleteBusiness(widget.business.businessId);
    await EntrepreneurDb.instance.deleteLikeToStartBusiness(widget.business.businessId);
    await EntrepreneurDb.instance.deleteEntreprenuerProductService(widget.business.businessId);
    await EntrepreneurDb.instance.deleteEntreprenuerTrainingNeeds(widget.business.businessId);

    entConvImport.InsertConvertedLS convertedLS=entConvImport.InsertConvertedLS(
      businessId: '0',
      businessType: 2,
      category: '2',
      entrepreneurNic:widget.business.entrepreneurNic,
      hb: entConvImport.Hb(
        address1: haveABusinessObj.address1,
        address2: haveABusinessObj.address2,
        businessName:haveABusinessObj.businessName,
        businessRegistrationPlace: haveABusinessObj.businessRegistrationPlace,
        contact: haveABusinessObj.contact,
        converted: 1,
        count: 1,
        districtId: int.tryParse(haveABusinessObj.districtId),
        expectedSupport: haveABusinessObj.expectedSupport,
        haveusinessModalId: int.tryParse(haveABusinessObj.haveBusinessModalId),
        initialInvestment: int.tryParse(haveABusinessObj.initialInvestmentId),
        isSync: 0,
        localId:0,
        mainProduct: haveABusinessObj.mainProduct,
        mainProductServiceList:haveABusinessObj.mainProductServiceList.map((e) =>
            entConvImport.MainProductServiceList(
              entrepreneurnic:widget.business.entrepreneurNic,
              havemodalid:haveABusinessObj.haveBusinessModalId,
              id: "0",
              imgarr: e.image,
              isSync: 0,
              localId: "0",
              mainproductname: e.name,
              storagefilename: e.name,
              uploadeddate: ""
          ),
        ).toList(),
        natureId: int.tryParse(haveABusinessObj.natureId),
        ownershipId:  int.tryParse(haveABusinessObj.ownershipId),
        productServiceCategoryList: haveABusinessObj.productServiceCategoryList.map((e) =>
               entConvImport.ProductServiceCategoryList(
                 businessId:  widget.business.businessId,
                 businessType: int.tryParse(widget.business.businessType),
                 category: e.category,
                 categorylevel3id: e.categoryLevelId,
                 code: e.code,
                 id: e.id.toString(),
                 isSync: 0,
                 localId: " ",
                 refno:widget.business.refNo,
                 status: e.status
               ),
        ).toList(),
        registeredDate: "",
        businessRegistration: haveABusinessObj.businessRegistrationPlace,
        id: 0,
        startDate: "",
        trainingNeedsList: haveABusinessObj.trainingNeedsList.map((e) =>
            entConvImport.TrainingNeedsList(
                bussinessId:widget.business.businessId,
                businessType: int.tryParse(widget.business.businessType),
                id: "",
                isSync: 0,
                localId: "",
                refno: widget.business.refNo,
                trainingDescription: e.programmeName,
                trainingNeedId: e.ID
            ),
        ).toList(),
      ),
     isSync: 0,
     localId: 0,
     natureId:haveABusinessObj.natureId.toString(),
    );

    print('convert obj');
    print(convertedLS.toJson().toString());


    Response entResponse = (await ServerRequests().addConvertedLikeToStart(context,convertedLS));
    print("ConvertedLikeToStartresponse is" );
    print(entResponse.body.toString());
    print('Success');

    Map map = jsonDecode(entResponse.body);
    Map data = map['DATA'];

    var businessId = data["businessId"];
    haveABusinessObj.businessId = businessId.toString();
    print('business id is ' + businessId.toString());

    int locID = data["hb"]["id"];
    print('server id of hb is ' + locID.toString());
    haveABusinessObj.serverId = locID.toString();

    map['DATA']['hb']['mainProductServiceList'].forEach((value) {
      mainProductServiceID = value["ID"];
      print('mainProductService id is ' + mainProductServiceID.toString());
    });

    map['DATA']['hb']['mainProductServiceList'].forEach((value) {
      storageFileName = value["STORAGE_FILE_NAME"];
      print('mainProductService storageFileName is ' + storageFileName);
    });

    map['DATA']['hb']['productServiceCategoryList'].forEach((value) {
      productServiceServerID = value["id"];
      print('productServiceCategory id is ' + productServiceServerID.toString());
    });

    map['DATA']['hb']['trainingNeedsList'].forEach((value) {
      trainingNeedsServerID = value["id"];
      print('trainingNeeds id is ' + trainingNeedsServerID.toString());
    });



    Business business = Business(
        id: 0,
        businessId:haveABusinessObj.businessId,
        natureId: haveABusinessObj.natureId.toString(),
        entrepreneurNic: widget.business.entrepreneurNic,
        category: "2",
        businessType: 2.toString()
    );

    await EntrepreneurDb.instance.InsertBusinessRecord(business);
    await EntrepreneurDb.instance.InsertHaveABusinessRecord(haveABusinessObj);

    List<EntrepreneurMainProductService> mainProductServiceArrayList = [];
    haveABusinessObj.mainProductServiceList.forEach((e) async {
      EntrepreneurMainProductService entrepreneurMainProductService = EntrepreneurMainProductService(
          localId: mainProductServiceID.toString(),
          storageFileName: storageFileName,
          entrepreneurNic: widget.business.entrepreneurNic,
          uploadedDate: dateTime,
          productServiceName: e.name,
          haveModalId: "",
          imgArr: e.image
      );

      mainProductServiceArrayList.add(entrepreneurMainProductService);
      await EntrepreneurDb.instance.InsertEntrepreneurMainProductServiceRecord(entrepreneurMainProductService);
    });
    print("size of main product services in HB" + mainProductServiceArrayList.length.toString());

    List<EntrepreneurTrainingNeeds> trainingNeeds = [];
    haveABusinessObj.trainingNeedsList.forEach((e) async {
      EntrepreneurTrainingNeeds entrepreneurTrainingNeeds =
      EntrepreneurTrainingNeeds(
          localId: trainingNeedsServerID.toString(),
          businessId: haveABusinessObj.businessId,
          trainingNeedId: e.ID,
          trainingDescription: e.programmeName,
          referenceNo: "",
          isSync: 0,
          businessType: "2");
      trainingNeeds.add(entrepreneurTrainingNeeds);
      await EntrepreneurDb.instance.InsertEntrepreneurTrainingNeedsRecord(entrepreneurTrainingNeeds);
    });
    print("size of training needs in HB" + trainingNeeds.length.toString());

    List<EntrepreneurProductService> productServices = [];
    haveABusinessObj.productServiceCategoryList.forEach((e) async {
      EntrepreneurProductService entrepreneurProductService =
      EntrepreneurProductService(
          id: 0,
          localId: productServiceServerID.toString(),
          businessId: haveABusinessObj.businessId,
          code: e.code,
          category: e.category,
          categoryLevel3Id: e.categoryLevelId,
          status: e.status,
          referenceNo: "",
          isSync: 0,
          businessType: 2);

      productServices.add(entrepreneurProductService);
      await EntrepreneurDb.instance.InsertEntrepreneurProductServiceRecord(entrepreneurProductService);
    });


    showSuccessDialog(context);

  }

  showSuccessDialog(BuildContext context) {
    Widget continueButton = TextButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.of(context)
          ..pop()
          ..pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Success!"),
      content: Text("Successfully Converted the Business"),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60,),
              child: Center(
                child: Container(
                  child: const Text(
                    "Business Info",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/Icons/businessname_icon.svg',
                          width: 15.84,
                          height: 19.839,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: businessName,
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '*Business Name',
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
                    SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(
                          width: 36,
                        ),
                        Text(
                          "Started Date",
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
                          onTap: ()async {
                            pickDate(context);
                            setState(() {});
                          },
                          child: Text(getText(),
                            style:
                            TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/Icons/contactnum_icon.svg',
                          width: 15.84,
                          height: 19.839,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            maxLength: 10,
                            style: TextStyle(color: Colors.grey),
                            controller: contactNumber,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              hintText: '*Contact Number',
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
                    SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(
                          width: 36,
                        ),
                        Text(
                          "Initial Investment",
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
                          onTap: ()async {
                            int index=(await _showDialog(context,expectedInvestment));
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
                          child: Text(investmentObj!=null ? investmentObj.investment ?? "*Initial Investment" : "*Initial Investment",
                            style:
                            TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/Icons/businessaddress_icon.svg',
                          width: 15.84,
                          height: 19.839,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: const Text(
                            'Business Address',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        SizedBox(width: 45),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.grey),
                            controller: businessAddress1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '*Line 1',
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
                    Row(
                      children: [
                        SizedBox(width: 45),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.grey),
                            controller: businessAddres2,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Line 2',
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
                    SizedBox(height: 15),
                    Row(
                      children: [
                        const SizedBox(width: 46),
                        GestureDetector(
                          onTap: ()async {
                            int index=(await _showDialog(context,districts)) ;
                            String temp  = districts[index];
                            districtObj = districtList[index];
                            if(temp!=districtObj.districtName){
                              for(int i=0;i<districtList.length;i++){
                                if(temp==districtList[index].districtName){
                                  districtObj=districtList[index];
                                  break;
                                }
                              }
                            }

                            setState(() {});
                          },
                          child: Text(districtObj!=null ? districtObj.districtName ?? "*District" : "*District",
                            style:
                            TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Ownership",
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
                              'assets/Icons/ownership_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: ()async {
                                int index=(await _showDialog(context,ownershipList));
                                if(index!=null){
                                  String temp  = ownershipList[index];
                                  ownershipObj = ownerShipList[index];
                                  if(temp!=ownershipObj.ownership){
                                    for(int i=0;i<ownerShipList.length;i++){
                                      if(temp==ownerShipList[index].ownership){
                                        ownershipObj=ownerShipList[index];
                                        break;
                                      }
                                    }
                                  }
                                }
                                setState(() {});
                              },
                              child: Text(ownershipObj!=null ? ownershipObj.ownership ?? "*Select ownership type" : "*Select ownership type",
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
                              "Business Registration",
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
                              'assets/Icons/business_registration_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: ()async {
                                int index=(await _showDialog(context,businessRegistrationList));
                                if(index!=null){
                                  String temp  = businessRegistrationList[index];
                                  businessRegistrationObj = businessRegistrationObjList[index];
                                  if(temp!=businessRegistrationObj.businessRegistration){
                                    for(int i=0;i<businessRegistrationObjList.length;i++){
                                      if(temp==businessRegistrationObjList[index].businessRegistration){
                                        businessRegistrationObj=businessRegistrationObjList[index];
                                        break;
                                      }
                                    }
                                  }
                                }
                                if(businessRegistrationObj!=null && businessRegistrationObjList.indexOf(businessRegistrationObj)==0){
                                  print('value is true');
                                  valueCheck=true;
                                  setState(() {});
                                }else{
                                  valueCheck=false;
                                  setState(() {});
                                }
                                setState(() {});
                              },
                              child: Text(businessRegistrationObj!=null ? businessRegistrationObj.businessRegistration ?? "*Business Registration" : "*Business Registration",
                                style:
                                TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ] ,
                    ),
                    SizedBox(height: 15),
                    !valueCheck ? Row(
                      children: [
                        SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/Icons/registration_num_icon.svg',
                          width: 15.84,
                          height: 19.839,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: regNoController,
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '*Registration No',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                              //hintText: 'Enter your Username'
                            ),
                          ),
                        ),
                      ],
                    ) : SizedBox(),
                    SizedBox(height: 20),
                    !valueCheck ? Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Registration Date",
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
                              onTap: ()async {
                                pickDateReg(context);
                                setState(() {});
                              },
                              child: Text(getTextReg(),
                                style:
                                TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ] ,
                    ) : SizedBox(),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(right: 180),
                      child: Center(
                        child: Container(
                          child: const Text(
                            "Product/Service",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
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
                              onTap: ()async {
                                int index=(await _showDialog(context,natures));
                                String temp  = natures[index];
                                natureDetail = natureDetails[index];
                                if(temp!=natureDetail.nature){
                                  for(int i=0;i<natureDetails.length;i++){
                                    if(temp==natureDetails[index].nature){
                                      natureDetail=natureDetails[index];
                                      break;
                                    }
                                  }
                                }
                                setState(() {});
                              },
                              child: Text( natureDetail != null
                                  ? natureDetail.nature ?? "*Select Nature"
                                  : "*Select Nature",
                                style:
                                TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ] ,
                    ),
                    SizedBox(height: 20),
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
                            Expanded(
                              child: GestureDetector(
                                onTap: ()async {
                                  int index=(await _showDialog(context,productServiceCategory));
                                  String temp  = productServiceCategory[index];
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
                                child: Text(serviceCategoryDetailsObj!=null ? serviceCategoryDetailsObj.category ?? "*Product/Service Category" : "*Product/Service Category",
                                  style: TextStyle(fontSize: 15, color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(width: 52),
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                onPressed: (){
                                  setState(() {
                                    if(serviceCategoryDetailsObj!=null){
                                      if(selectedServiceCategorys.contains(serviceCategoryDetailsObj)){
                                        showSnackBar(context, "Already added");
                                      }else{
                                        selectedServiceCategorys.add(serviceCategoryDetailsObj);
                                      }
                                    }
                                  });
                                },
                                child: const SizedBox(
                                  child: Text(
                                    'Add a product',
                                    softWrap: true,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/service_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                controller: mainProductController,
                                style: TextStyle(color: Colors.grey),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '*Main Product/Service',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  //hintText: 'Enter your Username'
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => bottomSheet()),
                                );
                              },
                              child: imageProfile(),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
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
                                  String base64String = await ImageConverter.base64(_imageFile);
                                  setState(()  {
                                    if(mainProductController.text.isNotEmpty && _imageFile!=null){
                                      MainProductService mainProductServiceObj=MainProductService(name: mainProductController.text,image: base64String,serverId: 0);
                                      if(mainProductServiceObj!=null){
                                        selectedMainProducts.add(mainProductServiceObj);
                                      }
                                      selectedImage.add(
                                          SelectedImage(
                                              mainProductController.text,
                                              File(_imageFile.path)
                                          )
                                      );
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
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    // selectedMainProducts.isEmpty?const SizedBox():Wrap(
                    //    spacing: 6.0,
                    //    runSpacing: 6.0,
                    //    children: List.generate(
                    //        selectedMainProducts.length, (index) {
                    //      MainProductService temp = selectedMainProducts[index];
                    //      return tableForMainProduct(
                    //          temp.name,temp.image,(){
                    //            setState(() {
                    //              selectedMainProducts.removeAt(index);
                    //            });
                    //          });
                    //    }),
                    //  ),
                    getColumn(),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/trainingneeds_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: GestureDetector(
                                onTap: ()async {
                                  int index=(await _showDialog(context,trainingNeeds));
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
                                child: Text( trainingNeedsObj!=null ?  trainingNeedsObj.programmeName ?? "*Training Needs" : "*Training Needs",
                                  style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                                ),
                              ),
                            ),
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
                        ),
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
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        SizedBox(width: 60,),
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: MaterialButton(
                            onPressed: () async {
                              try {

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
                        SizedBox(width: 60,),
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: MaterialButton(
                            onPressed: () async {
                              bool checkVal=allValidations();
                              print("value is"+checkVal.toString());
                              if(checkVal){
                                HaveABusiness haveABusinessObj=HaveABusiness(id: 0,
                                    serverId:0.toString(),businessId:0.toString(),mainProduct:"",contact:contactNumber.text,expectedSupport: "",
                                    businessRegistration:regNoController.text,businessRegistrationPlace:businessRegistrationObj.ID ,count: 0.toString(), haveBusinessModalId: 0.toString(), converted: 0.toString(),
                                    businessName: businessName.text,startDate: startDate,initialInvestmentId:investmentObj.ID,address1:  businessAddress1.text,address2:  businessAddres2.text,
                                    districtId: (districtObj.districtId),ownershipId: ownershipObj.ID,registrationNumber:regNoController.text,registrationDate:  regDate,
                                    natureId: (natureDetail.natureId),productServiceCategoryList: selectedServiceCategorys, mainProductServiceList: selectedMainProducts, trainingNeedsList: selectedTrainingNeeds);

                                await insertConvertBusinessToServer(haveABusinessObj);
                              }
                            },
                            child: const Text(
                              'Submit',
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
