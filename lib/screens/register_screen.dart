import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sed_project/model/business.dart';
import 'package:sed_project/model/business_experience.dart';
import 'package:sed_project/model/business_related_problem.dart';
import 'package:sed_project/model/district.dart';
import 'package:sed_project/model/ds_division.dart';
import 'package:sed_project/model/education_qualification.dart';
import 'package:sed_project/model/entrepreneur_business_related_problem.dart';
import 'package:sed_project/model/entrepreneur_collected_officer.dart';
import 'package:sed_project/model/entrepreneur_details.dart';
import 'package:sed_project/model/entrepreneur_expected_support.dart';
import 'package:sed_project/model/entrepreneur_mainproduct_service.dart';
import 'package:sed_project/model/entrepreneur_product_service.dart';
import 'package:sed_project/model/entrepreneur_qualification.dart';
import 'package:sed_project/model/entrepreneur_training_needs.dart';
import 'package:sed_project/model/entrepreneur_training_program.dart';
import 'package:sed_project/model/expected_support.dart';
import 'package:sed_project/model/for_requests/insert_entrepreneur.dart' as entImport;
import 'package:sed_project/model/for_requests/insert_h_b.dart' as entImpHvb;
import 'package:sed_project/model/for_requests/insert_l_s.dart' as entImplts;
import 'package:sed_project/model/gn_division.dart';
import 'package:sed_project/model/have_a_business.dart';
import 'package:sed_project/model/like_to_start_business.dart';
import 'package:sed_project/model/main_product_service.dart';
import 'package:sed_project/model/professional_qualification.dart';
import 'package:sed_project/model/professional_qualification_level.dart';
import 'package:sed_project/model/selected_object_mobule/selected_pro_qualification.dart';
import 'package:sed_project/model/service_category_details.dart';
import 'package:sed_project/model/training_needs.dart';
import 'package:sed_project/model/training_programs_followed.dart';
import 'package:sed_project/model/user_details.dart';
import 'package:sed_project/model/way_of_aware_sed.dart';
import 'package:sed_project/screens/have_a_business_screen.dart';
import 'package:sed_project/screens/image_converter.dart';
import 'package:sed_project/screens/like_to_start_businesss_screen.dart';
import 'package:sed_project/services/http_requests.dart';
import 'dart:io';
import 'package:sed_project/sqlf%20DB/registration_db.dart';

class RegisterScreen extends StatefulWidget {
  UserDetails userDetails;

  RegisterScreen(this.userDetails);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  static final nicController = TextEditingController();
  final nameController = TextEditingController();
  final titleController = TextEditingController();
  final initialsController = TextEditingController();
  final fullNameController = TextEditingController();
  final addressController = TextEditingController();
  final contNo1Controller = TextEditingController();
  final contNo2Controller = TextEditingController();
  final emailController = TextEditingController();
  final collOfficerNameController = TextEditingController();
  final collOfficerNicController = TextEditingController();
  final collOfficerDesigController = TextEditingController();
  final genderController = TextEditingController();
  final dobController = TextEditingController();
  final otherNotesController = TextEditingController();

  List<District> districtList = [];
  List<String> districts = [];

  List<EducationalQualification> educationList = [];
  List<String> educationQualifs = [];

  List<ProfessionalQualification> proffeQualifs = [];
  List<String> proffQualifications = [];

  List<ProfessionalQualificationLevel> proffeQualifsLevels = [];
  List<String> proffLevels = [];

  List<BusinessExperience> businessExps = [];
  List<String> businessExperience = [];

  List<DsDivision> dsDivisions = [];
  List<String> dsDivisionList = [];

  List<GnDivision> gnDivisions = [];
  List<String> gnDivisionList = [];

  List<TrainingNeeds> trainingNeeds = [];

  List<ExpectedSupport> expectSup = [];
  List<String> supportFromSed = [];

  List<BusinessRelatedProblem> businessProblems = [];
  List<String> businessRelProblems = [];

  int wayOfAwareKey;
  List<String> wayOfAwareList = [];

  List<SelectedProQualification> selectedProQualification = [];
  List<ExpectedSupport> selectedExpectedSupportFromSED = [];
  List<BusinessRelatedProblem> selectedBusinessRelatedProblems = [];
  List<LikeToStart> selectedLikeToStartData = [];
  List<HaveABusiness> selectedHaveABusinessData = [];
  List<EntrepreneurExpectedSupport> selectedEntrepreneurExpectedSupport = [];
  List<EntrepreneurBusinessRelatedProblem>selectedEntrepreneurBusinessRelatedProblem = [];
  List<EntrepreneurTrainingPrograms> selectedEntrepreneurTrainingPrograms = [];
  List<EntrepreneurQualification> selectedEntrepreneurQualification = [];
  List<TrainingProgramsFollowed> selectTrainingPrograms = [];
  List<TrainingProgramsFollowed> trainPrograms = [];
  List<Business> selectBusiness = [];
  List<WayOfAware> selectWayofAware = [];
  List<String> trainingPrograms = [];

  List<entImport.CollectedOfficerDetails> collectedOfficerData = [];

  bool update = false;
  String value;
  String district;
  String education;
  ProfessionalQualification proffQualification;
  ProfessionalQualificationLevel proffLevel;
  String businessExp;
  String trainProg;
  String suppSed;
  BusinessRelatedProblem busRelProb;
  String wayOfAware;
  String dsDivision;
  String gnDivision;
  bool valueCheck = false;
  int collectedOfficerIsSame = 0;
  bool nicControl;
  EntrepreneurDb entrepreneurDb;
  District districtObj;
  DsDivision dsDivisionObj;
  GnDivision gnDivisionObj;
  ExpectedSupport expectedSupportObj;
  TrainingNeeds trainingNeedsObj;
  EducationalQualification educationalQualificationObj;
  BusinessExperience businessExperienceObj;
  WayOfAware wayOfAwareObj;
  TrainingProgramsFollowed trainingProgramsFollowedObj;
  EntrepreneurExpectedSupport entrepreneurExpectedSupportObj;

  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item,
            style: const TextStyle(fontSize: 13, color: Colors.grey)),
      );

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  void removeImage() {
    setState(() {
      _imageFile = null;
    });
  }

  Widget checkButton() {
    if (update) {
      return const Text(
        'Update',
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      );
    } else {
      return const Text(
        'Register',
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      );
    }
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          _imageFile == null
              ? Image.asset(
                  'assets/image/pickImage.jpg',
                  alignment: Alignment.center,
                  height: 160,
                  width: 160,
                )
              : Image.file(
                  File(_imageFile.path),
                  width: 160,
                  height: 180,
                ),
          _imageFile == null
              ? SizedBox()
              : Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      removeImage();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      color: Colors.black38,
                      child: const Icon(Icons.cancel_rounded,
                          color: Colors.white, size: 20),
                    ),
                  ),
                )
        ],
        alignment: Alignment.topRight,
      ),
    );
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
            "Choose Profile photo",
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
                Navigator.pop(context);
              },
              // label: const Text("Camera"),
            ),
            IconButton(
              icon: const Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
                Navigator.pop(context);
              },
              // label: const Text("Gallery"),
            ),
          ])
        ],
      ),
    );
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

  void checkNicChanges() {
    if (nicController.text.length == 10 || nicController.text.length == 12) {
      processNic(nicController.text);
    } else {
      print(nicController.text.length.toString());
      genderController.text = "*Gender";
      titleController.text = "*Title";
      dobController.text = "*Date of Birth";
    }
  }

  Widget _chipWidget(String label, Function removeFunction) {
    return Chip(
      labelPadding: EdgeInsets.zero,
      onDeleted: removeFunction,
      deleteIcon: const Icon(
        Icons.highlight_remove_outlined,
        size: 15,
      ),
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

  void processNic(String nic) async {
    try {
      int day;
      int month;
      entrepreneurDb = EntrepreneurDb.instance;
      bool availability = await entrepreneurDb.checkAvailability(nic.toString());
      if (availability) {
        showAlertDialog(context);
        // nicController.clear();
        // showSnackBar(context,"An Entrepreneur with the nic "+nic+" is already registered");
      } else {
        String sYear = "";
        String days = "";
        if (nic.length == 10) {
          print('came 1');
          sYear = "19" + nic.substring(0, 2);
          days = nic.substring(2, 5);
          print('days is ' + days);
        } else if (nic.length == 12) {
          print('came 2');
          sYear = nic.substring(0, 4);
          days = nic.substring(4, 7);
        }

        int numberOfDays = int.parse(days);
        print('Number of days is ' + numberOfDays.toString());

        if (numberOfDays > 500) {
          print("RegisterActivity_processNic_gender: FEMALE");
          genderController.text = "Female";
          titleController.text = "Miss";
          numberOfDays = numberOfDays - 500;
          setState(() {});
        } else {
          print("RegisterActivity_processNic_gender: MALE");
          genderController.text = "Male";
          titleController.text = "Mr";
        }

        if (numberOfDays < 1 && numberOfDays > 366) {
          showSnackBar(context, "Please enter a valid NIC");
        } else {
          if (numberOfDays > 335) {
            day = numberOfDays - 335;
            month = 12;
          } else if (numberOfDays > 305) {
            day = numberOfDays - 305;
            month = 11;
          } else if (numberOfDays > 274) {
            day = numberOfDays - 274;
            month = 10;
          } else if (numberOfDays > 244) {
            day = numberOfDays - 244;
            month = 9;
          } else if (numberOfDays > 213) {
            day = numberOfDays - 213;
            month = 8;
          } else if (numberOfDays > 182) {
            day = numberOfDays - 182;
            month = 7;
          } else if (numberOfDays > 152) {
            day = numberOfDays - 152;
            month = 6;
          } else if (numberOfDays > 121) {
            day = numberOfDays - 121;
            month = 5;
          } else if (numberOfDays > 91) {
            day = numberOfDays - 91;
            month = 4;
          } else if (numberOfDays > 60) {
            day = numberOfDays - 60;
            month = 3;
          } else if (numberOfDays < 32) {
            month = 1;
            day = numberOfDays;
          } else if (numberOfDays > 31) {
            day = numberOfDays - 31;
            month = 2;
          }
        }
        dobController.text = '${day}/${month}/${sYear}';
        setState(() {});
      }
    } catch (e) {
      print("The exception thrown is $e");
    }
  }

  @override
  Future<void> initState() {
    super.initState();
    nicController.clear();
    selectedBusinessRelatedProblems.clear();
    selectedProQualification.clear();
    selectedExpectedSupportFromSED.clear();
    selectTrainingPrograms.clear();


    getAllDetails();
  }

  Future getGnDivisionDetails(String dsDivisionId) async {
    gnDivisionList.clear();
    gnDivisions = (await EntrepreneurDb.instance
        .getGnDivisionList(int.parse(dsDivisionId)));
    gnDivisions.forEach((element) {
      gnDivisionList.add(element.gnDivisionName);
    });
  }

  Future getDsDivisionDetails(String districtId) async {
    dsDivisionList.clear();
    dsDivisions = (await EntrepreneurDb.instance
        .getDsDivisionList(int.parse(districtId)));
    dsDivisions.forEach((element) {
      dsDivisionList.add(element.dsDivisionName);
    });
    setState(() {});
  }

  Future getProfQualiifLevelDetails(String professionalQualificationId) async {
    proffLevels.clear();
    proffeQualifsLevels = (await EntrepreneurDb.instance
        .getProfessionalQualifLevelList(
            int.parse(professionalQualificationId)));
    proffeQualifsLevels.forEach((element) {
      proffLevels.add(element.levelName);
    });

    setState(() {});
  }

  Future getAllDetails() async {
    selectWayofAware.insert(
        0, WayOfAware(id: 1, ID: 1.toString(), wayOfAware: 'SED Officer'));
    selectWayofAware.insert(
        1, WayOfAware(id: 2, ID: 2.toString(), wayOfAware: 'Friend'));
    selectWayofAware.insert(
        2, WayOfAware(id: 3, ID: 3.toString(), wayOfAware: 'SED Entrepreneur'));
    selectWayofAware.insert(
        3, WayOfAware(id: 4, ID: 4.toString(), wayOfAware: 'News paper'));
    selectWayofAware.insert(
        4, WayOfAware(id: 5, ID: 5.toString(), wayOfAware: 'Poster/Hand bill'));
    selectWayofAware.insert(
        5, WayOfAware(id: 6, ID: 6.toString(), wayOfAware: 'Exhibition'));

    trainPrograms.insert(
        0,
        TrainingProgramsFollowed(
            id: 1,
            trainingId: 1.toString(),
            programName: 'Business Management'));
    trainPrograms.insert(
        1,
        TrainingProgramsFollowed(
            id: 2, trainingId: 2.toString(), programName: 'Marketing'));
    trainPrograms.insert(
        2,
        TrainingProgramsFollowed(
            id: 3, trainingId: 3.toString(), programName: 'Production'));
    trainPrograms.insert(
        3,
        TrainingProgramsFollowed(
            id: 4, trainingId: 4.toString(), programName: "Accountancy"));
    trainPrograms.insert(
        4,
        TrainingProgramsFollowed(
            id: 5, trainingId: 5.toString(), programName: "Entrepreneurship"));
    trainPrograms.insert(
        5,
        TrainingProgramsFollowed(
            id: 6, trainingId: 6.toString(), programName: "Computer/IT"));
    trainPrograms.insert(
        6,
        TrainingProgramsFollowed(
            id: 7, trainingId: 7.toString(), programName: "Other"));

    trainPrograms.forEach((element) {
      trainingPrograms.add(element.programName);
    });

    selectWayofAware.forEach((element) {
      wayOfAwareList.add(element.wayOfAware);
    });

    districtList = (await EntrepreneurDb.instance.getDistrictList());
    educationList = (await EntrepreneurDb.instance.getEducationList());
    proffeQualifs = (await EntrepreneurDb.instance.getProfessionalQualifList());
    businessExps = (await EntrepreneurDb.instance.getBusinessExpList());
    expectSup = (await EntrepreneurDb.instance.getExpSupportList());
    businessProblems =
        (await EntrepreneurDb.instance.getBusinessProblemsList());

    districtList.forEach((element) {
      districts.add(element.districtName);
    });

    educationList.forEach((element) {
      educationQualifs.add(element.qualificationName);
    });

    proffeQualifs.forEach((element) {
      proffQualifications.add(element.qualificationName);
    });

    businessExps.forEach((element) {
      businessExperience.add(element.experienceName);
    });
    expectSup.forEach((element) {
      supportFromSed.add(element.supportName);
    });

    businessProblems.forEach((element) {
      businessRelProblems.add(element.problemName);
    });
  }




  Future<void> InsertLiketoStartToDb() async {
    if (selectedLikeToStartData.isNotEmpty) {
      selectedLikeToStartData.forEach((element) async {
        String likeToStartBusId = "0";
        int productServiceServerID = 0;
        int trainingNeedsServerID = 0;

        if (element.businessId != "0") {
          likeToStartBusId = element.businessId;
        }

        entImplts.InsertLS insertLS = entImplts.InsertLS(
            businessId: likeToStartBusId,
            businessType: 1,
            category: "1",
            entrepreneurNic: nicController.text,
            isSync: 0,
            localId: "",
            lts: entImplts.Lts(
              addedtoconvert: 0,
              businessid: 0,
              describebusiness: element.describeBusiness,
              expectedinvestment: int.tryParse(element.expectedInvestmentId),
              expectedtostart: element.expectedStartDate,
              isSync: 0,
              localId: 0,
              natureId: int.tryParse(element.natureId),
              productServiceCategoryList: element.productServiceCategoryList
                  .map(
                    (e) => entImplts.ProductServiceCategoryList(
                        businessId: "",
                        businessType: 1,
                        category: e.category,
                        categorylevel3id: e.categoryLevelId,
                        code: e.code,
                        id: "0",
                        isSync: 0,
                        localId: "",
                        refno: "",
                        status: e.status),
                  )
                  .toList(),
              id: 0,
              state: "",
              trainingNeedsList: element.trainingNeedsList
                  .map(
                    (e) => entImplts.TrainingNeedsList(
                        bussinessId: "",
                        businessType: 1,
                        id: "0",
                        isSync: 0,
                        localId: "",
                        refno: "",
                        trainingDescription: e.programmeName,
                        trainingNeedId: e.ID),
                  )
                  .toList(),
            ),
            natureId: element.natureId);
        // print('Like to start json printed///////');
        // print(insertLS.toString());
        // print('///////////////////////////////////');

        Response likeToStartResponse = (await ServerRequests().addLikeToStartBusiness(context, insertLS));
        print("Like to start response is////////");
        print(likeToStartResponse.body.toString());

        if (update) {
          print('Like to start update working//////////');

          int result=await EntrepreneurDb.instance.deleteBusiness(element.businessId);
          int result1=await EntrepreneurDb.instance.deleteLikeToStartBusiness(element.businessId);
          int result2=await EntrepreneurDb.instance.deleteEntreprenuerProductService(element.businessId);
          int result3=await EntrepreneurDb.instance.deleteEntreprenuerTrainingNeeds(element.businessId);
          print('like to start result is'+result.toString());
          print('like to start result1 is'+result1.toString());
          print('like to start result2 is'+result2.toString());
          print('like to start result3 is'+result3.toString());
          print('//////////////////////////////////////////////////');
        }

        Map map = jsonDecode(likeToStartResponse.body);
        Map data = map['DATA'];

        var businessId = data["businessId"];
        element.businessId = businessId.toString();
        print('business id is ' + businessId.toString());

        int locID = data["lts"]["ID"];
        print('server id is ' + locID.toString());
        element.serverId = locID.toString();

        map['DATA']['lts']['productServiceCategoryList'].forEach((value) {
          productServiceServerID = value["id"];
          print('productServiceCategory id is ' +
              productServiceServerID.toString());
        });

        map['DATA']['lts']['trainingNeedsList'].forEach((value) {
          trainingNeedsServerID = value["id"];
          print('trainingNeedsList id is ' + trainingNeedsServerID.toString());
        });

        print('//////////////////////////////////////////');

        Business business = Business(
            id: 0,
            businessId: element.businessId,
            natureId: element.natureId,
            entrepreneurNic: nicController.text,
            category: "1",
            businessType: 1.toString());
        int id = await EntrepreneurDb.instance.InsertBusinessRecord(business);
        int liketoStartId = await EntrepreneurDb.instance.InsertLikeToStartBusinessRecord(element);
        print("db business id is/////////// " + id.toString());
        print("db liketoStart id is/////////// " + liketoStartId.toString());

        List<EntrepreneurProductService> productServices = [];
        element.productServiceCategoryList.forEach((e) async {
          EntrepreneurProductService entProdService =
              EntrepreneurProductService(
                  id: 0,
                  localId: productServiceServerID.toString(),
                  businessId: element.businessId,
                  code: e.code,
                  category: e.category,
                  categoryLevel3Id: e.categoryLevelId,
                  status: e.status,
                  referenceNo: "",
                  isSync: 0,
                  businessType: 1);

          productServices.add(entProdService);
          print("size of product services" + productServices.length.toString());
          await EntrepreneurDb.instance.InsertEntrepreneurProductServiceRecord(entProdService);
        });

        List<EntrepreneurTrainingNeeds> trainingNeeds = [];
        element.trainingNeedsList.forEach((e) async {
          EntrepreneurTrainingNeeds entrepreneurTrainingNeeds =
              EntrepreneurTrainingNeeds(
                  localId: trainingNeedsServerID.toString(),
                  businessId: element.businessId,
                  trainingNeedId: e.ID,
                  trainingDescription: e.programmeName,
                  referenceNo: "",
                  isSync: 0,
                  businessType: "1");
          trainingNeeds.add(entrepreneurTrainingNeeds);
          print("size of product services" + trainingNeeds.length.toString());
          await EntrepreneurDb.instance.InsertEntrepreneurTrainingNeedsRecord(entrepreneurTrainingNeeds);
        });
      });
    }
  }

  Future<void> InsertHaveABusinessToDb(String dateTime) async {
    if (selectedHaveABusinessData.isNotEmpty) {
      selectedHaveABusinessData.forEach((element) async {
        String haveABusinessID = "0";
        int mainProductServiceID = 0;
        int productServiceServerID = 0;
        int trainingNeedsServerID = 0;
        String storageFileName = '';

        if (element.businessId!="0") {
          print('update business id is'+element.businessId);
          haveABusinessID = element.businessId;
        }

        entImpHvb.InsertHB insertHB = entImpHvb.InsertHB(
            businessId: haveABusinessID,
            businessType: 2,
            category: "2",
            entrepreneurNic: nicController.text,
            hb: entImpHvb.Hb(
              address1: element.address1,
              address2: element.address2,
              businessId: 0,
              businessName: element.businessName,
              businessRegistrationPlace: element.businessRegistrationPlace,
              contact: element.contact,
              converted: 0,
              count: 0,
              districtId: int.tryParse(districtObj.districtId),
              expectedSupport: element.expectedSupport,
              haveusinessModalId: int.tryParse(element.haveBusinessModalId),
              initialInvestment: int.tryParse(element.initialInvestmentId),
              isSync: 0,
              localId: 0,
              mainProduct: element.mainProduct,
              mainProductServiceList: element.mainProductServiceList
                  .map(
                    (e) => entImpHvb.MainProductServiceList(
                        entrepreneurnic: nicController.text,
                        havemodalid: element.haveBusinessModalId,
                        id: "",
                        imgarr: e.image,
                        isSync: 0,
                        localId: "",
                        mainproductname: e.name,
                        storagefilename: e.image,
                        uploadeddate: dateTime),
                  )
                  .toList(),
              natureId: int.tryParse(element.natureId),
              ownershipId: int.tryParse(element.ownershipId),
              productServiceCategoryList: element.productServiceCategoryList
                  .map(
                    (e) => entImpHvb.ProductServiceCategoryList(
                        businessId: "0",
                        businessType: 2,
                        category: e.category,
                        categorylevel3id: e.categoryLevelId,
                        code: e.code,
                        id: "",
                        isSync: 0,
                        localId: "",
                        refno: "",
                        status: e.status),
                  )
                  .toList(),
              registeredDate: dateTime,
              businessRegistration: element.businessRegistration,
              id: 0,
              startDate: element.startDate,
              trainingNeedsList: element.trainingNeedsList
                  .map(
                    (e) => entImpHvb.TrainingNeedsList(
                        bussinessId: "0",
                        businessType: 2,
                        id: "",
                        isSync: 0,
                        localId: "",
                        refno: "",
                        trainingDescription: e.programmeName,
                        trainingNeedId: e.ID),
                  )
                  .toList(),
            ),
            isSync: 0,
            localId: 0,
            natureId: element.natureId);
        Response haveABusinessResponse = (await ServerRequests().addHaveABusiness(context, insertHB));
        print("have a business response is/////////");
        print(haveABusinessResponse.body.toString());
        print('//////////////////////////////////');

        if (update) {
          print('business id in update is'+element.businessId);
          int result1=await EntrepreneurDb.instance.deleteBusiness(element.businessId);
          int result2=await EntrepreneurDb.instance.deleteHaveABusiness(element.businessId);
          int result3=await EntrepreneurDb.instance.deleteEntreprenuerMainProductService(nicController.text);
          int result4=await EntrepreneurDb.instance.deleteEntreprenuerProductService(element.businessId);
          int result5=await EntrepreneurDb.instance.deleteEntreprenuerTrainingNeeds(element.businessId);
          print('have a business result1 is'+result1.toString());
          print('have a business result2 is'+result2.toString());
          print('have a business result3 is'+result3.toString());
          print('have a business result4 is'+result4.toString());
          print('have a business result5 is'+result5.toString());
          print('//////////////////////////////////////////////////');
        }

        Map map = jsonDecode(haveABusinessResponse.body);
        Map data = map['DATA'];

        var businessId = data["businessId"];
        element.businessId = businessId.toString();
        print('business id is ' + businessId.toString());

        int locID = data["hb"]["id"];
        print('server id of hb is ' + locID.toString());
        element.serverId = locID.toString();

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
            businessId: element.businessId,
            natureId: element.natureId,
            entrepreneurNic: nicController.text,
            category: "2",
            businessType: 2.toString());

        await EntrepreneurDb.instance.InsertBusinessRecord(business);
        await EntrepreneurDb.instance.InsertHaveABusinessRecord(element);

        List<EntrepreneurMainProductService> mainProductServiceArrayList = [];
        element.mainProductServiceList.forEach((e) async {
          EntrepreneurMainProductService entrepreneurMainProductService =
              EntrepreneurMainProductService(
                  localId: mainProductServiceID.toString(),
                  storageFileName: storageFileName,
                  entrepreneurNic: nicController.text,
                  uploadedDate: dateTime,
                  productServiceName: e.name,
                  haveModalId: "",
                  imgArr: e.image);

          mainProductServiceArrayList.add(entrepreneurMainProductService);
          await EntrepreneurDb.instance.InsertEntrepreneurMainProductServiceRecord(entrepreneurMainProductService);
        });
        print("size of main product services in HB" + mainProductServiceArrayList.length.toString());

        List<EntrepreneurTrainingNeeds> trainingNeeds = [];
        element.trainingNeedsList.forEach((e) async {
          EntrepreneurTrainingNeeds entrepreneurTrainingNeeds =
              EntrepreneurTrainingNeeds(
                  localId: trainingNeedsServerID.toString(),
                  businessId: element.businessId,
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
        element.productServiceCategoryList.forEach((e) async {
          EntrepreneurProductService entrepreneurProductService =
              EntrepreneurProductService(
                  id: 0,
                  localId: productServiceServerID.toString(),
                  businessId: element.businessId,
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
      });
    }
  }

  Future<void> checkRegistrationDetails() async {
    try{
      String base64String = '';
      List<EntrepreneurQualification> qualifications = [];
      List<EntrepreneurTrainingPrograms> trainingProgram = [];
      List<EntrepreneurExpectedSupport> expectedSupport = [];
      List<EntrepreneurBusinessRelatedProblem> businessRelatedProblem = [];

      if (update) {
        print("Update working///////////////////////");
        // selectedBusinessRelatedProblems.clear();
        // selectedProQualification.clear();
        // selectedExpectedSupportFromSED.clear();
        // selectTrainingPrograms.clear();

        int result=await EntrepreneurDb.instance.deleteEntrepreneur(nicController.text);
        int result1=await EntrepreneurDb.instance.deleteEntrepreneurExpectedSupport(nicController.text);
        int result2=await EntrepreneurDb.instance.deleteEntrepreneurTrainingPrograms(nicController.text);
        int result3=await EntrepreneurDb.instance.deleteEntrepreneurQualifications(nicController.text);
        int result4=await EntrepreneurDb.instance.deleteEntrepreneurBusinessRelatedProblem(nicController.text);
        print('result is'+result.toString());
        print('result1 is'+result1.toString());
        print('result2 is'+result2.toString());
        print('result3 is'+result3.toString());
        print('result4 is'+result4.toString());

      }

      String datetime = DateTime.now().toString();
      print(datetime);

      entImport.CollectedOfficerDetails collectedOfficerDetails =
      entImport.CollectedOfficerDetails(
          isSync: 0,
          cofficerdesignation: collOfficerDesigController.text,
          cofficer: collOfficerNameController.text,
          cofficernic: collOfficerNicController.text);
      collectedOfficerData.add(collectedOfficerDetails);
      // Fluttertoast.showToast(
      //     msg: "pre call -2 ",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );
      if (_imageFile != null) {
        base64String = await ImageConverter.base64(_imageFile);
      }

      if (valueCheck) {
        collectedOfficerIsSame = 1;
      }

      entImport.InsertEntrepreneur insertEntrepreneur =
      entImport.InsertEntrepreneur(
          businessRelatedProblem: selectedBusinessRelatedProblems
              .map((e) => entImport.BusinessRelatedProblem(
              businessrelatedproblemid: e.problemId,
              entrepreneurnic: nicController.text,
              localId: e.id.toString()))
              .toList(),
          collectedOfficerDetails: collectedOfficerData,
          qualifications: selectedProQualification
              .map((e) => entImport.Qualifications(
            entrepreneurnic: nicController.text,
            id: "0",
            isSync: 0,
            localId: "998",
            proLvl: e.professionalQualificationLevel.levelName,
            proQulifi: e.professionalQualification.qualificationName,
            professionalqualificationlevelid: e
                .professionalQualificationLevel
                .professionalQualificationId,
          ))
              .toList(),
          address: addressController.text,
          btype: " ",
          birthday: dobController.text,
          businessrelatedproblemid: " ",
          category: " ",
          contactno: contNo1Controller.text,
          contactno2: contNo2Controller.text,
          districtid: districtObj.districtId,
          dsdivisiondivisionid: dsDivisionObj.divisionId,
          educationLevelText: educationalQualificationObj.qualificationName,
          educationqualificationqualificationid:
          educationalQualificationObj.qualificationId,
          email: emailController.text,
          enteredofficer: collOfficerNameController.text,
          enteredtime: "",
          entrepreneurshipid: "",
          entrepreneurshiplevelid: "",
          expectedSupport: selectedExpectedSupportFromSED
              .map(
                (e) => entImport.ExpectedSupport(
              expSupport: e.supportName,
              expSupportId: e.supportId,
              id: "",
              isSync: 0,
              localId: "",
              nic: nicController.text,
            ),
          )
              .toList(),
          expectedsupportdescribe: "",
          expectedsupportid: "",
          experiancefieldid: businessExperienceObj.experienceId,
          fullname: fullNameController.text,
          gender: genderController.text,
          gngndivisionid: gnDivisionObj.id,
          image: base64String,
          initials: initialsController.text,
          issameofficer: collectedOfficerIsSame.toString(),
          isSync: 0,
          name: nameController.text,
          nic: nicController.text,
          officernic: collOfficerNicController.text,
          othernotes: otherNotesController.text,
          professionalqualificationid: "",
          professionalqualificationlevelid: "",
          registereddatetime: "",
          state: "",
          title: titleController.text,
          trainingProgram: selectTrainingPrograms
              .map(
                (e) => entImport.TrainingProgram(
              id: "",
              isSync: 0,
              localId: "",
              nic: nicController.text,
              trnFlw: e.programName,
              trnFlwId: e.trainingId,
            ),
          )
              .toList(),
          updatedofficer: "",
          updatedtime: "",
          wayofawareid: wayOfAwareObj.ID.toString(),
          wayOfAwareText: wayOfAwareObj.wayOfAware);

      Response entResponse = (await ServerRequests().addEntrepreneur(context, insertEntrepreneur));
      print("Entrepreneur json is");
      print(insertEntrepreneur.toJson().toString());
      print("///////////////////////////");
      print("///////////////////////////");
      // print("Entrepreneur response is");
      // print(entResponse.body.toString());
      // Fluttertoast.showToast(
      //     msg: "pre call 2 ",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );
      // Fluttertoast.showToast(
      //     msg: "res body " + entResponse.body.toString(),
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );
      // print("////////////////////////////////");

      Map map = jsonDecode(entResponse.body);

      selectedBusinessRelatedProblems.forEach((element) {
        int serverId=0;
        map['DATA']['BusinessRelatedProblem'].forEach((value) {
          serverId = value['id'];
          print('BusinessRelatedProblem server id is ' + serverId.toString());
        });

        EntrepreneurBusinessRelatedProblem entrepreneurBusinessRelatedProblem =
        EntrepreneurBusinessRelatedProblem(
          id: "",
          localId: serverId.toString(),
          entrepreneurNic: nicController.text,
          businessRelatedProblemId: element.problemId,
          isSync: 0,
        );
        businessRelatedProblem.add(entrepreneurBusinessRelatedProblem);

      });


      selectedProQualification.forEach((element) async {
        int serverId=0;
        String proffQualifLevelId ='';
        map['DATA']['Qualifications'].forEach((value) {
          serverId = value['ID'];
          print('proffQualif server id is ' + serverId.toString());
          proffQualifLevelId = value['PROFESSIONAL_QUALIFICATION_LEVEL_ID'];
          print('proffQualif  levelid is ' + proffQualifLevelId);
        });

        EntrepreneurQualification entrepreneurQualification =
        EntrepreneurQualification(
            id: "0",
            localId: serverId.toString(),
            entrepreneurNic: nicController.text,
            professionalQualificationLevelId: proffQualifLevelId,
            proQulifi: element.professionalQualification.qualificationName,
            proLvl: element.professionalQualificationLevel.levelName,
            isSync: 0);
        qualifications.add(entrepreneurQualification);

      });



      print('/////////////////////////////////////////////////////////////////////////');
      print('/////////////////////////////////////////////////////////////////////////');
      print('size of expected support list is '+selectedExpectedSupportFromSED.length.toString());
      print('/////////////////////////////////////////////////////////////////////////');
      selectedExpectedSupportFromSED.forEach((element) {
        int serverId=0;
        map['DATA']['ExpectedSupport'].forEach((value) {
          serverId = value['id'];
          print('ExpectedSupport server id is ' + serverId.toString());
        });
        EntrepreneurExpectedSupport entrepreneurExpectedSupport =
        EntrepreneurExpectedSupport(
            id: "",
            localId: serverId.toString(),
            nic: nicController.text,
            expSupportId: element.supportId,
            expSupport: element.supportName,
            isSync: 0);

        expectedSupport.add(entrepreneurExpectedSupport);
      });

      print('/////////////////////////////////////////////////////////////////////////');
      print('/////////////////////////////////////////////////////////////////////////');
      print('size of expected support second list is '+expectedSupport.length.toString());
      print('/////////////////////////////////////////////////////////////////////////');

      selectTrainingPrograms.forEach((element) {
        int serverId=0;
        map['DATA']['TrainingProgram'].forEach((value) {
          serverId = value['id'];
          print('TrainingProgram server id is ' + serverId.toString());
        });
        EntrepreneurTrainingPrograms entrepreneurTrainingPrograms =
        EntrepreneurTrainingPrograms(
            localId: serverId.toString(),
            nic: nicController.text,
            trnFlwId: element.trainingId,
            trnFlw: element.programName,
            isSync: 0);
        trainingProgram.add(entrepreneurTrainingPrograms);

      });

      await InsertLiketoStartToDb();
      await InsertHaveABusinessToDb(datetime);

      EntrepreneurCollectedOfficer officer = EntrepreneurCollectedOfficer(
          officerName: collOfficerNameController.text,
          officerNic: collOfficerNicController.text,
          officerDesignation: collOfficerDesigController.text);
      List<EntrepreneurCollectedOfficer> entOfficer = [];
      entOfficer.add(officer);

      EntrepreneurDetails entrepreneurDetails = EntrepreneurDetails(
          nic: nicController.text,
          experienceFieldId: businessExperienceObj.experienceId,
          entrepreneurshipLevelId: "0",
          professionalQualificationLevelId: "0",
          entrepreneurshipId: "0",
          professionalQualificationId: "0",
          dsDivisionDivisionId: dsDivisionObj.divisionId,
          districtId: districtObj.districtId,
          educationQualificationQualificationId:
          educationalQualificationObj.qualificationId,
          name: nameController.text,
          initials: initialsController.text,
          address: addressController.text,
          contactNo: contNo1Controller.text,
          email: emailController.text,
          gender: genderController.text,
          birthday: dobController.text,
          category: "0",
          state: "0",
          image: base64String,
          registeredDateTime: datetime,
          expectedSupportDescribe: "",
          expectedSupportId: "",
          businessRelatedProblemId: "",
          officerNic: collOfficerNicController.text,
          bType: "",
          educationLevelText: "",
          contactNo2: contNo2Controller.text,
          fullname: fullNameController.text,
          gnGnDivisionId: gnDivisionObj.id,
          enteredOfficer: "",
          updatedOfficer: "",
          enteredTime: "",
          updatedTime: "",
          wayOfAwareId: wayOfAwareObj.ID,
          wayOfAwareText: wayOfAwareObj.wayOfAware,
          isSameOfficer: collectedOfficerIsSame.toString(),
          otherNotes: otherNotesController.text,
          title: titleController.text,
          collectedOfficerName: collOfficerNameController.text,
          collectedOfficerNic: collOfficerNicController.text,
          collectedOfficerDesignation: collOfficerDesigController.text,
          isSync: 0,
          CollectedOfficerDetails: entOfficer);

      await EntrepreneurDb.instance.InsertEntRecord(entrepreneurDetails);
      await EntrepreneurDb.instance.InsertEntQualification(qualifications);
      await EntrepreneurDb.instance.InsertEntTrainingPrograms(trainingProgram);
      await EntrepreneurDb.instance.InsertEntBusinessRelatedProblem(businessRelatedProblem);
      await EntrepreneurDb.instance.InsertEntExpectedSupport(expectedSupport);

      showSuccessDialog(context);
    }catch(e){
      // Fluttertoast.showToast(
      //     msg: "Error EXP 2 " + e.toString(),
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );
      print('not ok');
    }

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

    AlertDialog updateAlert = AlertDialog(
      title: Text("Success!"),
      content: Text("Successfully Updated!"),
      actions: [
        continueButton,
      ],
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Success!"),
      content: Text("Successfully Registered!"),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        if (update) {
          return updateAlert;
        } else {
          return alert;
        }
      },
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Close"),
      onPressed: () {
        nicController.clear();
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Ok"),
      onPressed: () {
        update = true;
        setState(() {});
        getRegisteredEntrepreneur(nicController.text);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Heads Up!"),
      content: Text("Already a Registered  user\nLoad details?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool allValidations() {
    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);

    if (nicController.text.isEmpty) {
      showSnackBar(context, "Please Enter your Nic");
      return false;
    } else if (nameController.text.isEmpty) {
      showSnackBar(context, "Please Enter your Name");
      return false;
    } else if (initialsController.text.isEmpty) {
      showSnackBar(context, "Please Enter your Name initials");
      return false;
    } else if (fullNameController.text.isEmpty) {
      showSnackBar(context, "Please Enter your FullName");
      return false;
    } else if (addressController.text.isEmpty) {
      showSnackBar(context, "Please Enter your Address");
      return false;
    } else if (contNo1Controller.text.isEmpty) {
      showSnackBar(context, "Please Enter your phone number");
      return false;
    } else if (contNo2Controller.text.isNotEmpty && contNo2Controller.text.length < 10) {
      showSnackBar(context, "Please Enter a valid phone number");
      return false;
    } else if (contNo1Controller.text.length < 10) {
      showSnackBar(context, "Please Enter a valid phone number");
      return false;
    } else if (emailController.text.isEmpty) {
      showSnackBar(context, "Please Enter your Email");
      return false;
    } else if (!regex.hasMatch(emailController.text)) {
      showSnackBar(context, "Please Enter a valid Email");
      return false;
    } else if (districtObj == null) {
      showSnackBar(context, "Please Select a District");
      return false;
    } else if (dsDivisionObj == null) {
      showSnackBar(context, "Please Select a Ds Division");
      return false;
    } else if (gnDivisionObj == null) {
      showSnackBar(context, "Please Select a Gn Division");
      return false;
    } else if (educationalQualificationObj == null) {
      showSnackBar(context, "Select education qualification!");
      return false;
    } else if (selectedProQualification.isEmpty) {
      showSnackBar(context, "Add professional qualification!");
      return false;
    } else if (businessExperienceObj == null) {
      showSnackBar(context, "Select business experience!");
      return false;
    } else if (selectTrainingPrograms.isEmpty) {
      showSnackBar(context, "Add training program followed!");
      return false;
    } else if (selectedExpectedSupportFromSED.isEmpty) {
      showSnackBar(context, "Add expected support from SED!");
      return false;
    } else if (selectedBusinessRelatedProblems.isEmpty) {
      showSnackBar(context, "Add business related problems!");
      return false;
    } else if (wayOfAwareObj == null) {
      showSnackBar(context, "Please Select way of aware about SED!");
      return false;
    } else if (!valueCheck && collOfficerNameController.text.isEmpty && collOfficerNicController.text.isEmpty && collOfficerDesigController.text.isEmpty) {
      showSnackBar(context, "Please enter officer details");
      return false;
    } else if (selectedHaveABusinessData.isEmpty && selectedLikeToStartData.isEmpty) {
      showSnackBar(context, "Please Add a business");
      return false;
    } else {
      return true;
    }
  }

  Future getRegisteredEntrepreneur(String nic) async {
    selectedEntrepreneurExpectedSupport.clear();
    selectedProQualification.clear();
    selectedExpectedSupportFromSED.clear();
    selectedBusinessRelatedProblems.clear();
    selectTrainingPrograms.clear();
    selectedHaveABusinessData.clear();
    selectedLikeToStartData.clear();

    EntrepreneurDetails entrepreneurDetails;
    entrepreneurDetails = (await EntrepreneurDb.instance.getEntrepreneur(nic));

    selectedEntrepreneurExpectedSupport = await EntrepreneurDb.instance.getAllSupportByNic(nic);
    print("-----------");
    print(selectedEntrepreneurExpectedSupport.length.toString());
    selectedEntrepreneurExpectedSupport.forEach((element) {
      selectedExpectedSupportFromSED.add(ExpectedSupport(
          supportId: element.expSupportId, supportName: element.expSupport));
    });

    selectedEntrepreneurBusinessRelatedProblem = await EntrepreneurDb.instance.getAllBusinessProblemsByNic(nic);
    selectedEntrepreneurBusinessRelatedProblem.forEach((element) async {
      BusinessRelatedProblem businessRelatedProblem = await EntrepreneurDb
          .instance
          .getBusinessProblem(element.businessRelatedProblemId);
      selectedBusinessRelatedProblems.add(businessRelatedProblem);
    });

    selectedEntrepreneurTrainingPrograms = await EntrepreneurDb.instance.getAllTrainingProgramsByNic(nic);
    if (selectedEntrepreneurTrainingPrograms.isEmpty) {
      print('Entreprenuer training program list is empty');
    }
    selectedEntrepreneurTrainingPrograms.forEach((element) async {
      selectTrainingPrograms.add(TrainingProgramsFollowed(
          trainingId: element.trnFlwId, programName: element.trnFlw));
    });

    selectedEntrepreneurQualification = await EntrepreneurDb.instance.getAllQualificationByNic(nic);
    if (selectedEntrepreneurQualification.isNotEmpty) {
      print('EntrepreneurQualification is not empty');
    }
    selectedEntrepreneurQualification.forEach((element) async {
      ProfessionalQualificationLevel professionalQualificationLevel =
          await EntrepreneurDb.instance.getProfessionalQualificationLevel(
              element.professionalQualificationLevelId);
      ProfessionalQualification professionalQualification =
          await EntrepreneurDb.instance.getProfessionalQualificationById(
              professionalQualificationLevel.professionalQualificationId);
      SelectedProQualification selectedProQualifications =
          SelectedProQualification(
        ProfessionalQualification(
            id: 0,
            qualificationId: professionalQualification.qualificationId,
            qualificationName: element.proQulifi),
        ProfessionalQualificationLevel(
            dbId: 0,
            id: professionalQualification.qualificationId,
            levelName: element.proLvl,
            professionalQualificationId:
                element.professionalQualificationLevelId),
      );

      selectedProQualification.add(selectedProQualifications);
    });

    selectBusiness = await EntrepreneurDb.instance.getBusinessesByNic(nic);
    if (selectBusiness.length > 0) {
      selectBusiness.forEach((element) async {
        String businessId = element.businessId;
        print("business id is " + businessId);
        if (await EntrepreneurDb.instance.isBusinessExist(element.businessId)) {
          // int iBusinessId = int.tryParse(element.businessId);
          // if (iBusinessId <= 0) {
          //   iBusinessId = element.id;
          //   businessId = iBusinessId.toString();
          // }
          String businessId = element.businessId;
          print("second loop business id is " + element.businessId);

          // selectedHaveABusinessData.clear();
          if (await EntrepreneurDb.instance.isHaveABusinessExist(element.businessId)) {
            List<EntrepreneurMainProductService> entMainProductService = await EntrepreneurDb.instance.getAllEntrepreneurMainProductServiceByNic(entrepreneurDetails.nic);
            List<MainProductService> mainProductServiceList = [];
            if (entMainProductService.isNotEmpty) {
              entMainProductService.forEach((element) async {
                MainProductService mainProductService = new MainProductService(
                    image: element.imgArr, name: element.productServiceName);
                mainProductServiceList.add(mainProductService);
              });
            } else {
              print('main product list is empty///////////////////////////');
            }

            List<EntrepreneurProductService> entProductList = await EntrepreneurDb.instance.getAllEntrepreneurProductServiceByBusinessId(businessId);
            List<ServiceCategoryDetails> productServiceList = [];
            if (entProductList.isNotEmpty) {
              entProductList.forEach((element) async {
                ServiceCategoryDetails serviceCategoryDetails = await EntrepreneurDb.instance.getProductServiceItemFromCode(element.code);
                productServiceList.add(serviceCategoryDetails);
              });
            } else {
              print(
                  'productServiceList list is empty///////////////////////////');
            }

            List<EntrepreneurTrainingNeeds> entTrainingNeedsList = await EntrepreneurDb.instance.getAllEntrepreneurTrainingNeedByBusinessId(businessId);
            List<TrainingNeeds> trainingNeedsList = [];
            if (entTrainingNeedsList.isNotEmpty) {
              entTrainingNeedsList.forEach((element) {
                TrainingNeeds trainingNeeds = TrainingNeeds(
                    id: element.id,
                    ID: element.trainingNeedId,
                    programmeName: element.trainingDescription);
                trainingNeedsList.add(trainingNeeds);
              });
            } else {
              print(
                  'trainingNeedsList list is empty///////////////////////////');
            }

            List<HaveABusiness> haveABusiness = await EntrepreneurDb.instance.getHaveBusiness(element.businessId);
            if (haveABusiness != null && haveABusiness.isNotEmpty) {
              haveABusiness.forEach((element2) {
                addHaveABusinessList(element2, element, mainProductServiceList, productServiceList, trainingNeedsList);
              });
            } else {
              print('no have business obj');
            }

            // if (haveABusiness != null) {
            //   haveABusiness.businessId=element.businessId;
            //   haveABusiness.mainProductServiceList = mainProductServiceList;
            //   haveABusiness.productServiceCategoryList = productServiceList;
            //   haveABusiness.trainingNeedsList = trainingNeedsList;
            //   if (!selectedHaveABusinessData.contains(haveABusiness)) {
            //     selectedHaveABusinessData.add(haveABusiness);
            //   }
            // } else {
            //   print('no have business obj');
            // }

            setState(() {});
          }

          // selectedLikeToStartData.clear();
          if (await EntrepreneurDb.instance.isLikeToStartExist(element.businessId)) {
            print('like to start data adding//////////////////////////////');
            List<EntrepreneurProductService> entProdList = await EntrepreneurDb.instance.getAllEntrepreneurProductServiceByBusinessId(businessId);
            List<ServiceCategoryDetails> productSerList = [];
            if (entProdList.isNotEmpty) {
              entProdList.forEach((element) async {
                ServiceCategoryDetails serviceCategoryDetails = await EntrepreneurDb.instance.getProductServiceItemFromCode(element.code);
                if (serviceCategoryDetails != null) {
                  productSerList.add(serviceCategoryDetails);
                  print(' product services  added');
                }
              });
            } else {
              print(' product services not added');
            }

            List<EntrepreneurTrainingNeeds> entTrainingNeedList = await EntrepreneurDb.instance.getAllEntrepreneurTrainingNeedByBusinessId(businessId);
            List<TrainingNeeds> trainingNeedList = [];

            if (entTrainingNeedList.isNotEmpty) {
              entTrainingNeedList.forEach((element) {
                TrainingNeeds trainingNeeds = TrainingNeeds(
                    id: element.id,
                    ID: element.trainingNeedId,
                    programmeName: element.trainingDescription);
                trainingNeedList.add(trainingNeeds);
                print(' training needs  added');
              });
            } else {
              print('training needs not added');
            }

            List<LikeToStart> likeToStart = await EntrepreneurDb.instance.getLikeToBusiness(element.businessId);
            if (likeToStart != null && likeToStart.isNotEmpty) {
              likeToStart.forEach((element2) {
                addToLikeToStartList(element2, element, productSerList, trainingNeedList);
              });
            } else {
              print('no like to start obj');
            }

            setState(() {});
          } else {
            print(' No like to start data//////////////////////////');
          }
        }
      });
    }

    educationalQualificationObj = await EntrepreneurDb.instance.getEducationalQualificationById(entrepreneurDetails.educationQualificationQualificationId);
    nicController.text = entrepreneurDetails.nic;
    nicControl = false;
    nameController.text = entrepreneurDetails.name;
    titleController.text = entrepreneurDetails.title;
    initialsController.text = entrepreneurDetails.initials;
    fullNameController.text = entrepreneurDetails.fullname;
    addressController.text = entrepreneurDetails.address;
    contNo1Controller.text = entrepreneurDetails.contactNo;
    contNo2Controller.text = entrepreneurDetails.contactNo2;
    emailController.text = entrepreneurDetails.email;
    genderController.text = entrepreneurDetails.gender;
    dobController.text = entrepreneurDetails.birthday;
    otherNotesController.text = entrepreneurDetails.otherNotes;
    districtObj = await EntrepreneurDb.instance.getDistrictById(entrepreneurDetails.districtId);
    dsDivisionObj = await EntrepreneurDb.instance.getDsDivisionById(entrepreneurDetails.dsDivisionDivisionId);
    gnDivisionObj = await EntrepreneurDb.instance.getGnDivisionById(entrepreneurDetails.gnGnDivisionId);
    gnDivision = gnDivisionObj.gnDivisionName;
    businessExperienceObj = await EntrepreneurDb.instance.getBusinessExperienceById(entrepreneurDetails.experienceFieldId);
    wayOfAwareObj = await EntrepreneurDb.instance.getWayOfAware(entrepreneurDetails.wayOfAwareId);

    if (entrepreneurDetails.isSameOfficer == "1") {
      valueCheck = true;
      setState(() {});
    } else {
      collOfficerNameController.text = entrepreneurDetails.collectedOfficerName;
      collOfficerNicController.text = entrepreneurDetails.collectedOfficerNic;
      collOfficerDesigController.text =
          entrepreneurDetails.collectedOfficerDesignation;
      setState(() {});
    }

    setState(() {});
  }

  addToLikeToStartList(LikeToStart element2, Business element, productSerList, trainingNeedList) {
    element2.businessId = element.businessId;
    element2.natureId = element.natureId;
    element2.productServiceCategoryList = productSerList;
    element2.trainingNeedsList = trainingNeedList;
    bool needtoadd = true;
    selectedLikeToStartData.forEach((element3) {
      print("=============================================${element3.id}==${element2.id}");
      if (element3.id == element2.id) {
        needtoadd = false;
      }
    });
    if (needtoadd) {
      selectedLikeToStartData.add(element2);
      print('/////////////////////////////');
      print('Size of like to start list is '+selectedLikeToStartData.length.toString());
      print('/////////////////////////////');
      print('like to start data added////////////////');
      print( '/////////////////////');
      selectedLikeToStartData.forEach((element) {
        print( 'like to start json new/////////////////////');
        print(element.toJson().toString());
        print(element.businessId.toString());
        print(element.natureId.toString());
        print(element.describeBusiness.toString());
        print( '/////////////////////');
      });
      setState(() {
        getColumn();
      });
    } else {
      print('like to start data not added');
    }
  }

  addHaveABusinessList(HaveABusiness element2, Business element, mainProductList, productSerList, trainingNeedList) {
    element2.businessId = element.businessId;
    element2.mainProductServiceList = mainProductList;
    element2.productServiceCategoryList = productSerList;
    element2.trainingNeedsList = trainingNeedList;

    bool needtoadd = true;
    selectedHaveABusinessData.forEach((element3) {
      print("Have a Business loop =============================================");
      print("=============================================${element3.id}==${element2.id}");
      print("=============================================");
      if (element3.id == element2.id) {
        needtoadd = false;
      }
    });
    if (needtoadd) {
      selectedHaveABusinessData.add(element2);
      print('HaveABusiness data added////////////////');
    } else {
      print('HaveABusiness data not added');
    }
  }

  removeSelectedLtsBusines(int index) {
    setState(() {
      selectedLikeToStartData.removeAt(index);
    });
  }

  removeSelectedHaveABusines(int index) {
    setState(() {
      selectedHaveABusinessData.removeAt(index);
    });
  }

  Future<void> editLikeToStartBusiness(int index) async {
    LikeToStart likeToStart = selectedLikeToStartData[index];
    LikeToStart likeToStartObj = await Navigator.push(context,
        MaterialPageRoute(builder: (_) => LikeToStartScreen(likeToStart)));
    if (likeToStartObj != null) {
      selectedLikeToStartData.removeAt(index);
      selectedLikeToStartData.add(likeToStartObj);
    }
    setState(() {});
  }

  Future<void> editHaveABusiness(int index) async {
    HaveABusiness haveABusiness = selectedHaveABusinessData[index];
    HaveABusiness haveABusinessObj = await Navigator.push(context,
        MaterialPageRoute(builder: (_) => HaveABusinessScreen(haveABusiness)));
    if (haveABusinessObj != null) {
      selectedHaveABusinessData.removeAt(index);
      selectedHaveABusinessData.add(haveABusinessObj);
    }
    setState(() {});
  }

  Widget getColumn() {
    print(selectedLikeToStartData.length.toString());
    print('like to start list generte length');
    return Column(
      children: selectedLikeToStartData.isEmpty
          ? []
          : List.generate(selectedLikeToStartData.length, (index) {
              print(selectedLikeToStartData[index].toJson().toString());
             print('//////////////////////////////////////');
              print(selectedLikeToStartData.length.toString());
              print('like to start list generte length test 2');
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Business Description",
                          textAlign: TextAlign.left,
                          softWrap: true,
                        ),
                        SizedBox(width: 160),
                        Text(
                          "Action",
                          textAlign: TextAlign.left,
                          softWrap: true,
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                selectedLikeToStartData.isNotEmpty
                                    ? selectedLikeToStartData[index]
                                        .describeBusiness
                                    : "",
                                textAlign: TextAlign.left,
                                softWrap: true,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                editLikeToStartBusiness(index);
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                child: Image.asset(
                                  'assets/Icons/ic_edit.png',
                                  alignment: Alignment.center,
                                  height: 15,
                                  width: 15,
                                ),
                                // const Icon(Icons.cancel_rounded,color: Colors.white,size: 20),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                removeSelectedLtsBusines(index);
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                child: SvgPicture.asset(
                                  'assets/Icons/delete_icon.svg',
                                  width: 15.84,
                                  height: 19.839,
                                  color: Colors.blue,
                                ),
                                // const Icon(Icons.cancel_rounded,color: Colors.white,size: 20),
                              ),
                            )
                          ],
                        ),
                      ],
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              );
            }),

    );
  }

  Widget getColumn2() {
    return Column(
      children: selectedHaveABusinessData.isEmpty
          ? []
          : List.generate(selectedHaveABusinessData.length,(index){
                print(selectedHaveABusinessData[index].toJson().toString());
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Business Name",
                            textAlign: TextAlign.left,
                            softWrap: true,
                          ),
                          SizedBox(width: 195),
                          Text(
                            "Action",
                            textAlign: TextAlign.left,
                            softWrap: true,
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  selectedHaveABusinessData.isNotEmpty
                                      ? selectedHaveABusinessData[index]
                                      .businessName
                                      : "",
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  editHaveABusiness(index);
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                    'assets/Icons/ic_edit.png',
                                    alignment: Alignment.center,
                                    height: 15,
                                    width: 15,
                                  ),
                                  // const Icon(Icons.cancel_rounded,color: Colors.white,size: 20),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  removeSelectedHaveABusines(index);
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  child: SvgPicture.asset(
                                    'assets/Icons/delete_icon.svg',
                                    width: 15.84,
                                    height: 19.839,
                                    color: Colors.blue,
                                  ),
                                  // const Icon(Icons.cancel_rounded,color: Colors.white,size: 20),
                                ),
                              )
                            ],
                          ),
                        ],
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                );
    }),
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
              padding: const EdgeInsets.only(top: 60, right: 20),
              child: Center(
                child: Container(
                  child: const Text(
                    "Entrepreneur Registration",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
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
                            // SizedBox(width: 10),
                            // SvgPicture.asset(
                            //   'assets/Icons/image_icon.svg',
                            //   width: 15.84,
                            //   height: 19.839,
                            //   color: Colors.blue,
                            // ),
                            // SizedBox(width: 18),
                            // GestureDetector(
                            //   onTap: () {
                            //     showModalBottomSheet(
                            //       context: context,
                            //       builder: ((builder) => bottomSheet()),
                            //     );
                            //   },
                            //   child: const Text(
                            //     "*Add Picture",
                            //     style: TextStyle(
                            //       fontSize: 13,
                            //       color: Colors.grey,
                            //     ),
                            //   ),
                            // ),
                            SizedBox(width: 100),
                            GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) => bottomSheet()),
                                  );
                                },
                                child: imageProfile())
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "NIC",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/nic_card_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colors.grey),
                                enabled: nicControl,
                                controller: nicController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '*NIC Number',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    checkNicChanges();
                                    print(value);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/name_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colors.grey),
                                controller: nameController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '*Name',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  //hintText: 'Enter your Username'
                                ),
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Title",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/name_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  if (titleController.text.isEmpty) {
                                    showSnackBar(
                                        context, "please enter your nic!");
                                  }
                                },
                                child: TextFormField(
                                  style: TextStyle(color: Colors.grey),
                                  enabled: false,
                                  controller: titleController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '*title',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                    //hintText: 'Enter your Username'
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Initials",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/Profile.svg',
                              color: Colors.blue,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colors.grey),
                                controller: initialsController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '*initials',
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
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Full Name",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/Profile.svg',
                              color: Colors.blue,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colors.grey),
                                controller: fullNameController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '*Full Name',
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
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Address",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/address_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 18),
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colors.grey),
                                controller: addressController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '*Address',
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
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Contact Number 1",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/contactnum_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                maxLength: 10,
                                style: TextStyle(color: Colors.grey),
                                controller: contNo1Controller,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: '*Contact Number 1',
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
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Contact Number 2",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/contactnum_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                maxLength: 10,
                                style: TextStyle(color: Colors.grey),
                                controller: contNo2Controller,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: ' Contact Number 2',
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
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/email_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colors.grey),
                                controller: emailController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '*Email Address',
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
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/gender_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  if (genderController.text.isEmpty) {
                                    showSnackBar(context, "Please enter your nic!");
                                  }
                                },
                                child: TextFormField(
                                  enabled: false,
                                  controller: genderController,
                                  style: TextStyle(color: Colors.grey),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Gender',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                    //hintText: 'Enter your Username'
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Date of Birth",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            SvgPicture.asset(
                              'assets/Icons/calender_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  if (dobController.text.isEmpty) {
                                    showSnackBar(
                                        context, "please enter your nic!");
                                  }
                                },
                                child: TextFormField(
                                  controller: dobController,
                                  enabled: false,
                                  style: TextStyle(color: Colors.grey),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '*Date of Birth',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                    //hintText: 'Enter your Username'
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "District",
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
                              'assets/Icons/district_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                int index =
                                    (await _showDialog(context, districts));
                                String temp = districts[index];
                                districtObj = districtList[index];
                                if (temp != districtObj.districtName) {
                                  for (int i = 0;
                                      i < districtList.length;
                                      i++) {
                                    if (temp ==
                                        districtList[index].districtName) {
                                      setState(() {
                                        districtObj = districtList[index];
                                        print('district name is' +
                                            districtObj.districtName);
                                      });
                                      break;
                                    }
                                  }
                                }
                                setState(() {});
                              },
                              child: Text(
                                districtObj != null
                                    ? districtObj.districtName ??
                                        "*Select District"
                                    : "*Select District",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "DS Division",
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
                              'assets/Icons/division_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                if (districtObj == null) {
                                  showSnackBar(context,
                                      "Please select a district first");
                                } else {
                                  await getDsDivisionDetails(
                                      districtObj.districtId);
                                  int index = (await _showDialog(
                                      context, dsDivisionList));
                                  String temp = dsDivisionList[index];
                                  dsDivisionObj = dsDivisions[index];
                                  if (temp != dsDivisionObj.dsDivisionName) {
                                    for (int i = 0;
                                        i < dsDivisions.length;
                                        i++) {
                                      if (temp ==
                                          dsDivisions[index].dsDivisionName) {
                                        dsDivisionObj = dsDivisions[index];
                                        break;
                                      }
                                    }
                                  }
                                }
                                setState(() {});
                              },
                              child: Text(
                                dsDivisionObj != null
                                    ? dsDivisionObj.dsDivisionName ??
                                        "*Select DS Division"
                                    : "*Select DS Division",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "GN Division",
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
                              'assets/Icons/division_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                if (dsDivisionObj == null) {
                                  showSnackBar(context,
                                      "Please select a DsDivision first");
                                } else {
                                  await getGnDivisionDetails(
                                      dsDivisionObj.divisionId);
                                  int index = (await _showDialog(
                                      context, gnDivisionList)) as int;
                                  if (index != null) {
                                    gnDivision = gnDivisionList[index];
                                    gnDivisionObj = gnDivisions[index];
                                  }
                                }
                                setState(() {});
                              },
                              child: Text(
                                gnDivision != null
                                    ? gnDivision ?? "*Select GN Division"
                                    : "*Select GN Division",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Education qualification",
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
                              'assets/Icons/education_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                int index = (await _showDialog(
                                    context, educationQualifs)) as int;
                                String temp = educationQualifs[index];
                                educationalQualificationObj =
                                    educationList[index];
                                if (temp !=
                                    educationalQualificationObj
                                        .qualificationName) {
                                  for (int i = 0;
                                      i < educationList.length;
                                      i++) {
                                    if (temp ==
                                        educationList[index]
                                            .qualificationName) {
                                      educationalQualificationObj =
                                          educationList[index];
                                      break;
                                    }
                                  }
                                }

                                setState(() {});
                              },
                              child: Text(
                                educationalQualificationObj != null
                                    ? educationalQualificationObj
                                            .qualificationName ??
                                        "*Select Education qualification"
                                    : "*Select Education qualification",
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
                              'assets/Icons/qualification_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      int index = await _showDialog(
                                          context, proffQualifications);
                                      String temp = proffQualifications[index];
                                      proffQualification = proffeQualifs[index];
                                      if (temp !=
                                          proffQualification
                                              .qualificationName) {
                                        for (int i = 0;
                                            i < proffeQualifs.length;
                                            i++) {
                                          if (temp ==
                                              proffeQualifs[index]
                                                  .qualificationName) {
                                            proffQualification =
                                                proffeQualifs[index];
                                            break;
                                          }
                                        }
                                      }
                                      setState(() {});
                                    },
                                    child: Text(
                                      proffQualification != null
                                          ? proffQualification
                                                  .qualificationName ??
                                              "*Select Professional Qualification"
                                          : "*Select Professional Qualification",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                      softWrap: true,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () async {
                                      if (proffQualification == null) {
                                        showSnackBar(context,
                                            "Please select a professional qualification first");
                                      } else {
                                        await getProfQualiifLevelDetails(
                                            proffQualification.qualificationId);
                                        int index = await _showDialog(
                                            context, proffLevels);
                                        String temp = proffLevels[index];
                                        proffLevel = proffeQualifsLevels[index];
                                        if (temp != proffLevel.levelName) {
                                          for (int i = 0;
                                              i < proffeQualifsLevels.length;
                                              i++) {
                                            if (temp ==
                                                proffeQualifsLevels[index]
                                                    .levelName) {
                                              proffLevel =
                                                  proffeQualifsLevels[index];
                                              break;
                                            }
                                          }
                                        }
                                      }
                                      setState(() {
                                        if (proffQualification != null &&
                                            proffLevel != null) {
                                          setState(() {
                                            SelectedProQualification temp =
                                                SelectedProQualification(
                                                    proffQualification,
                                                    proffLevel);
                                            if (selectedProQualification
                                                .contains(temp)) {
                                              showSnackBar(
                                                  context, "Already Added");
                                            } else {
                                              selectedProQualification
                                                  .add(temp);
                                            }
                                          });
                                        }
                                      });
                                    },
                                    child: Text(
                                      proffLevel != null
                                          ? proffLevel.levelName ??
                                              "*Select Level"
                                          : "*Select Level",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 30),
                            // Container(
                            //   height: 30,
                            //   decoration: BoxDecoration(
                            //       color: Colors.blue,
                            //       borderRadius: BorderRadius.circular(10)),
                            //   child: MaterialButton(
                            //     onPressed: () async {
                            //       if (proffQualification != null && proffLevel != null) {
                            //         setState(() {
                            //           SelectedProQualification temp =
                            //               SelectedProQualification(
                            //                   proffQualification, proffLevel);
                            //           if (!selectedProQualification
                            //               .contains(temp)) {
                            //             selectedProQualification.add(temp);
                            //           }
                            //         });
                            //       }
                            //     },
                            //     child: const Text(
                            //       'Add',
                            //       style: TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 15,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                    selectedProQualification.isEmpty
                        ? const SizedBox()
                        : Wrap(
                            spacing: 6.0,
                            runSpacing: 6.0,
                            children: List.generate(
                                selectedProQualification.length, (index) {
                              SelectedProQualification temp =
                                  selectedProQualification[index];
                              return _chipWidget(
                                  temp.professionalQualification
                                          .qualificationName +
                                      "(" +
                                      temp.professionalQualificationLevel
                                          .levelName +
                                      ")", () {
                                setState(() {
                                  selectedProQualification.removeAt(index);
                                });
                              });
                            }),
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
                              "Buisness of Experience",
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
                              'assets/Icons/business_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                int index = (await _showDialog(
                                    context, businessExperience));
                                if (index != null) {
                                  String temp = businessExperience[index];
                                  businessExperienceObj = businessExps[index];
                                  if (temp !=
                                      businessExperienceObj.experienceName) {
                                    for (int i = 0;
                                        i < businessExps.length;
                                        i++) {
                                      if (temp ==
                                          businessExps[index].experienceName) {
                                        businessExperienceObj =
                                            businessExps[index];
                                        break;
                                      }
                                    }
                                  }
                                }
                                setState(() {});
                              },
                              child: Text(
                                businessExperienceObj != null
                                    ? businessExperienceObj.experienceName ??
                                        "*Select Business of Experience"
                                    : "*Select Business of Experience",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Training Programs Followed",
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
                              'assets/Icons/training_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                int index = (await _showDialog(
                                    context, trainingPrograms));
                                String temp = trainingPrograms[index];
                                if (temp == "Select Training Program") {
                                  trainingProgramsFollowedObj = null;
                                } else {
                                  trainingProgramsFollowedObj =
                                      trainPrograms[index];
                                  if (temp !=
                                      trainingProgramsFollowedObj.programName) {
                                    for (int i = 0;
                                        i < trainPrograms.length;
                                        i++) {
                                      if (temp ==
                                          trainPrograms[index].programName) {
                                        trainingProgramsFollowedObj =
                                            trainPrograms[index];
                                        break;
                                      }
                                    }
                                  }
                                }
                                setState(() {
                                  if (trainingProgramsFollowedObj != null) {
                                    if (selectTrainingPrograms.contains(
                                        trainingProgramsFollowedObj)) {
                                      showSnackBar(context, "Already Added");
                                    } else {
                                      selectTrainingPrograms
                                          .add(trainingProgramsFollowedObj);
                                    }
                                  }
                                });
                              },
                              child: Text(
                                trainingProgramsFollowedObj != null
                                    ? trainingProgramsFollowedObj.programName ??
                                        "*Select Training Programs Followed"
                                    : "*Select Training Programs Followed",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Container(
                        //       height: 30,
                        //       decoration: BoxDecoration(
                        //           color: Colors.blue,
                        //           borderRadius: BorderRadius.circular(10)),
                        //       child: MaterialButton(
                        //         onPressed: () async {
                        //           setState(() {
                        //             if(trainingProgramsFollowedObj!=null){
                        //               selectTrainingPrograms.add(trainingProgramsFollowedObj);
                        //             }
                        //           });
                        //
                        //         },
                        //         child: const Text(
                        //           'Add Training Program',
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    selectTrainingPrograms.isEmpty
                        ? const SizedBox()
                        : Wrap(
                            spacing: 6.0,
                            runSpacing: 6.0,
                            children: List.generate(
                                selectTrainingPrograms.length, (index) {
                              String temp =
                                  selectTrainingPrograms[index].programName;
                              return _chipWidget(temp, () {
                                setState(() {
                                  selectTrainingPrograms.removeAt(index);
                                });
                              });
                            }),
                          ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Expected Support from SED",
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
                              'assets/Icons/support_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                int index = (await _showDialog(
                                    context, supportFromSed));
                                String temp = supportFromSed[index];
                                expectedSupportObj = expectSup[index];
                                if (temp != expectedSupportObj.supportName) {
                                  for (int i = 0; i < expectSup.length; i++) {
                                    if (temp == expectSup[index].supportName) {
                                      expectedSupportObj = expectSup[index];
                                      break;
                                    }
                                  }
                                }
                                setState(() {
                                  if (expectedSupportObj != null) {
                                    if (selectedExpectedSupportFromSED.contains(expectedSupportObj)) {
                                      showSnackBar(context, "Already Added");
                                    } else {
                                      selectedExpectedSupportFromSED.add(expectedSupportObj);
                                    }
                                  }
                                });
                              },
                              child: Text(
                                expectedSupportObj != null
                                    ? expectedSupportObj.supportName ??
                                        "*Select Expected Support from SED"
                                    : "*Select Expected Support from SED",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Container(
                        //       height: 30,
                        //       decoration: BoxDecoration(
                        //           color: Colors.blue,
                        //           borderRadius: BorderRadius.circular(10)),
                        //       child: MaterialButton(
                        //         onPressed: () async {
                        //           setState(() {
                        //             if(expectedSupportObj!=null){
                        //               selectedExpectedSupportFromSED.add(expectedSupportObj);
                        //             }
                        //           });
                        //         },
                        //         child: const Text(
                        //           'Add Expected Support',
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    selectedExpectedSupportFromSED.isEmpty
                        ? const SizedBox()
                        : Wrap(
                            spacing: 6.0,
                            runSpacing: 6.0,
                            children: List.generate(
                                selectedExpectedSupportFromSED.length, (index) {
                              ExpectedSupport temp =
                                  selectedExpectedSupportFromSED[index];
                              return _chipWidget(temp.supportName, () {
                                setState(() {
                                  selectedExpectedSupportFromSED
                                      .removeAt(index);
                                });
                              });
                            }),
                          ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Buisness Related Problem",
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
                              'assets/Icons/problem_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                int index = (await _showDialog(
                                    context, businessRelProblems));
                                if (index != null) {
                                  String temp = businessRelProblems[index];
                                  busRelProb = businessProblems[index];
                                  if (temp != busRelProb.problemName) {
                                    for (int i = 0;
                                        i < businessProblems.length;
                                        i++) {
                                      if (temp ==
                                          businessProblems[index].problemName) {
                                        busRelProb = businessProblems[index];
                                        break;
                                      }
                                    }
                                  }
                                }
                                setState(() {
                                  if (busRelProb != null) {
                                    if (selectedBusinessRelatedProblems
                                        .contains(busRelProb)) {
                                      showSnackBar(context, "Already Added");
                                    } else {
                                      selectedBusinessRelatedProblems
                                          .add(busRelProb);
                                    }
                                  }
                                });
                              },
                              child: Text(
                                busRelProb != null
                                    ? busRelProb.problemName ??
                                        "*Select Business Related Problem"
                                    : "*Select Business Related Problem",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Container(
                        //       height: 30,
                        //       decoration: BoxDecoration(
                        //           color: Colors.blue,
                        //           borderRadius: BorderRadius.circular(10)),
                        //       child: MaterialButton(
                        //         onPressed: () async {
                        //           setState(() {
                        //             if (busRelProb != null) {
                        //               selectedBusinessRelatedProblems
                        //                   .add(busRelProb);
                        //             }
                        //           });
                        //         },
                        //         child: const Text(
                        //           'Add A Problem',
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    selectedBusinessRelatedProblems.isEmpty
                        ? const SizedBox()
                        : Wrap(
                            spacing: 6.0,
                            runSpacing: 6.0,
                            children: List.generate(
                                selectedBusinessRelatedProblems.length,
                                (index) {
                              BusinessRelatedProblem temp =
                                  selectedBusinessRelatedProblems[index];
                              return _chipWidget(temp.problemName, () {
                                setState(() {
                                  selectedBusinessRelatedProblems
                                      .removeAt(index);
                                });
                              });
                            }),
                          ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36,
                            ),
                            Text(
                              "Way of Aware About SED",
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
                              'assets/Icons/awareness_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                int index = (await _showDialog(
                                    context, wayOfAwareList));
                                String temp = wayOfAwareList[index];
                                if (temp == "Select Way of Aware") {
                                  wayOfAwareObj = null;
                                } else {
                                  wayOfAwareObj = selectWayofAware[index];
                                  if (temp != wayOfAwareObj.wayOfAware) {
                                    for (int i = 0;
                                        i < selectWayofAware.length;
                                        i++) {
                                      if (temp ==
                                          selectWayofAware[index].wayOfAware) {
                                        wayOfAwareObj = selectWayofAware[index];
                                        break;
                                      }
                                    }
                                  }
                                }
                                setState(() {});
                              },
                              child: Text(
                                wayOfAwareObj != null
                                    ? wayOfAwareObj.wayOfAware ??
                                        "*Select Way of Aware About SED"
                                    : "*Select Way of Aware About SED  ",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: valueCheck,
                                title: Text(
                                  "Collected Officer is same as the entered officer",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onChanged: (valueCheck) => setState(
                                    () => this.valueCheck = valueCheck),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    !valueCheck
                        ? Row(
                            children: [
                              SizedBox(width: 10),
                              SvgPicture.asset(
                                'assets/Icons/officer_icon.svg',
                                width: 15.84,
                                height: 19.839,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  controller: collOfficerNameController,
                                  style: TextStyle(color: Colors.grey),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '*Collected Officer Name',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                    //hintText: 'Enter your Username'
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                    !valueCheck
                        ? Row(
                            children: [
                              SizedBox(width: 10),
                              SvgPicture.asset(
                                'assets/Icons/officer_icon.svg',
                                width: 15.84,
                                height: 19.839,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  controller: collOfficerNicController,
                                  style: TextStyle(color: Colors.grey),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '*Collected Officer Nic',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                    //hintText: 'Enter your Username'
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                    !valueCheck
                        ? Row(
                            children: [
                              SizedBox(width: 10),
                              SvgPicture.asset(
                                'assets/Icons/officer_icon.svg',
                                width: 15.84,
                                height: 19.839,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  controller: collOfficerDesigController,
                                  style: TextStyle(color: Colors.grey),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '*Collected Officer Designation',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                    //hintText: 'Enter your Username'
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                    Row(
                      children: [
                        SizedBox(width: 12),
                        SvgPicture.asset(
                          'assets/Icons/othernotes_icon.svg',
                          width: 15.84,
                          height: 19.839,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            maxLength: 128,
                            maxLines: null,
                            controller: otherNotesController,
                            keyboardType: TextInputType.multiline,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            decoration: InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              hintText: 'Other Notes',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                              //hintText: 'Enter your Username'
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 42,
                            ),
                            Text(
                              "Like to Start",
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
                            SizedBox(width: 12),
                            SvgPicture.asset(
                              'assets/Icons/startbusiness_icon.svg',
                              width: 15.84,
                              height: 19.839,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 16),
                            GestureDetector(
                              onTap: () async {
                                try {
                                  LikeToStart likeToStartObj =
                                      await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  LikeToStartScreen(null)));
                                  if (likeToStartObj != null) {
                                    selectedLikeToStartData.add(likeToStartObj);
                                  }

                                  setState(() {});
                                } catch (error) {}
                              },
                              child: Text(
                                "*Add a Business",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                            // Container(
                            //   height: 30,
                            //   decoration: BoxDecoration(
                            //       color: Colors.blue,
                            //       borderRadius: BorderRadius.circular(10)),
                            //   child: MaterialButton(
                            //     onPressed: () async {
                            //       try {
                            //         LikeToStart likeToStartObj =
                            //             await Navigator.push(
                            //                 context,
                            //                 MaterialPageRoute(
                            //                     builder: (_) =>
                            //                         LikeToStartScreen(null)));
                            //         if (likeToStartObj != null) {
                            //           selectedLikeToStartData
                            //               .add(likeToStartObj);
                            //         }
                            //
                            //         setState(() {});
                            //       } catch (error) {}
                            //     },
                            //     child: const Text(
                            //       'Add A Business',
                            //       style: TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 15,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    selectedLikeToStartData.isEmpty ? SizedBox() : getColumn(),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 42,
                            ),
                            Text(
                              "Have a Business",
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
                            SizedBox(width: 12),
                            SvgPicture.asset(
                              'assets/Icons/havebusiness_icon.svg',
                              width: 11.84,
                              height: 14.839,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 16),
                            GestureDetector(
                              onTap: () async {
                                try {
                                  HaveABusiness haveABusinessObj =
                                      await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  HaveABusinessScreen(null)));
                                  if (haveABusinessObj != null) {
                                    selectedHaveABusinessData
                                        .add(haveABusinessObj);
                                  }
                                  setState(() {});
                                } catch (error) {}
                              },
                              child: Text(
                                "*Add a Business",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                            // Container(
                            //   height: 30,
                            //   decoration: BoxDecoration(
                            //       color: Colors.blue,
                            //       borderRadius: BorderRadius.circular(10)),
                            //   child: MaterialButton(
                            //     onPressed: () async {
                            //       try {
                            //         HaveABusiness haveABusinessObj =
                            //             await Navigator.push(
                            //                 context,
                            //                 MaterialPageRoute(
                            //                     builder: (_) =>
                            //                         HaveABusinessScreen(null)));
                            //         if (haveABusinessObj != null) {
                            //           selectedHaveABusinessData
                            //               .add(haveABusinessObj);
                            //         }
                            //         setState(() {});
                            //       } catch (error) {}
                            //     },
                            //     child: const Text(
                            //       'Add A Business',
                            //       style: TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 15,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    selectedHaveABusinessData.isEmpty
                        ? SizedBox()
                        : getColumn2(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 35,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                          onPressed: () async {
                            try {
                              bool checkVal = allValidations();
                              print("value is" + checkVal.toString());
                              if (checkVal) {
                                print('like to start list size is'+selectedLikeToStartData.length.toString());
                                print('Have a Business size is'+selectedHaveABusinessData.length.toString());
                                await checkRegistrationDetails();
                              }
                              // Fluttertoast.showToast(
                              //     msg: "value is" + checkVal.toString(),
                              //     toastLength: Toast.LENGTH_SHORT,
                              //     gravity: ToastGravity.CENTER,
                              //     timeInSecForIosWeb: 1,
                              //     backgroundColor: Colors.red,
                              //     textColor: Colors.white,
                              //     fontSize: 16.0
                              // );
                            } catch (error) {
                              // Fluttertoast.showToast(
                              //     msg: "Error EXP " + error.toString(),
                              //     toastLength: Toast.LENGTH_SHORT,
                              //     gravity: ToastGravity.CENTER,
                              //     timeInSecForIosWeb: 1,
                              //     backgroundColor: Colors.red,
                              //     textColor: Colors.white,
                              //     fontSize: 16.0
                              // );
                              print('not ok');
                            }
                          },
                          child: checkButton()),
                    ),
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
