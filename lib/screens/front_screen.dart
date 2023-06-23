import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sed_project/model/business.dart';
import 'package:sed_project/model/business_experience.dart';
import 'package:sed_project/model/business_registration.dart';
import 'package:sed_project/model/business_related_problem.dart';
import 'package:sed_project/model/db_count.dart';
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
import 'package:sed_project/model/gn_division.dart';
import 'package:sed_project/model/have_a_business.dart';
import 'package:sed_project/model/investments.dart';
import 'package:sed_project/model/like_to_start_business.dart';
import 'package:sed_project/model/nature_details.dart';
import 'package:sed_project/model/ownership.dart';
import 'package:sed_project/model/professional_qualification.dart';
import 'package:sed_project/model/professional_qualification_level.dart';
import 'package:sed_project/model/service_category_details.dart';
import 'package:sed_project/model/training_needs.dart';
import 'package:sed_project/model/training_programs_followed.dart';
import 'package:sed_project/model/user_details.dart';
import 'package:sed_project/model/way_of_aware_sed.dart';
import 'package:sed_project/providers/connectivity_provider.dart';
import 'package:sed_project/screens/main_menu_screen.dart';
import 'package:sed_project/services/http_requests.dart';
import 'package:sed_project/sqlf%20DB/registration_db.dart';




class FrontPage extends StatefulWidget {
  UserDetails userDetails;


  FrontPage(this.userDetails);

  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  DbCount serverDataCount;
  int totalCount = 0;
  int districtCount = 0;
  int dsDivisionCount = 0;
  int gnDivisionCount = 0;
  int educationQualificationCount = 0;
  int professionalQualificationCount = 0;
  int professionalQualificationLevelCount = 0;
  int businessExperienceCount = 0;
  int expectedSupportCount = 0;
  int businessRelatedProblemCount = 0;
  int businessNatureCount = 0;
  int productServiceCategoryCount = 0;
  int trainingNeedsCount = 0;
  int entrepreneurCount = 0;
  int entrepreneurMainProSerCount = 0;
  int entrepreneurProSerCount = 0;
  int entrepreneurTrainingNeedCount = 0;
  int businessCount = 0;
  int haveABusinessCount = 0;
  int likeToStartBusinessCount = 0;
  bool isLoading = false;

  List<DbCount> dbCountDetails = [];


  List<TrainingProgramsFollowed>trainingPrograms=[
    TrainingProgramsFollowed(id:0,trainingId:"1",programName: 'Business Management'),
    TrainingProgramsFollowed(id:1,trainingId:"2",programName: 'Marketing'),
    TrainingProgramsFollowed(id:2,trainingId:"3",programName: 'Production' ),
    TrainingProgramsFollowed(id:3,trainingId:"4",programName: 'Accountancy' ),
    TrainingProgramsFollowed(id:4,trainingId:"5",programName: 'Entrepreneurship' ),
    TrainingProgramsFollowed(id:5,trainingId:"6",programName: 'Computer/IT' ),
  ];


  List<WayOfAware>wayOfAwareSed=[
    WayOfAware(id:0,ID:"1",wayOfAware: 'SED Officer' ),
    WayOfAware(id:1,ID:"2",wayOfAware: 'Friend' ),
    WayOfAware(id:2,ID:"3",wayOfAware: 'SED Entrepreneur'),
    WayOfAware(id:3,ID:"4",wayOfAware: 'News paper' ),
    WayOfAware(id:4,ID:"5",wayOfAware: 'Poster/Hand bill' ),
    WayOfAware(id:5,ID:"6",wayOfAware: 'Exhibition' ),
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

  List<BusinessRegistration> businessRegistrationObjList = [
    BusinessRegistration(id: 0,ID: "1",businessRegistration:'Not Registered' ),
    BusinessRegistration(id: 1,ID: "2",businessRegistration:'Registered in DS' ),
    BusinessRegistration(id: 2,ID: "3",businessRegistration:'Registered in DCSR' ),

  ];

  List<Ownership> ownerShipList = [
    Ownership(id: 0,ID: "1",ownership:"Sole" ),
    Ownership(id: 1,ID: "2",ownership:"Partnership" ),
    Ownership(id: 2,ID: "3",ownership:"Limited" ),
  ];

  bool checkSyncTotCount(){
    if(serverDataCount.districtCount!=districtCount || serverDataCount.dsDivisionCount!=dsDivisionCount || serverDataCount.gnDivisionCount!=gnDivisionCount || serverDataCount.educationQualificationCount!=educationQualificationCount
    || serverDataCount.professionalQualificationCount!=professionalQualificationCount || serverDataCount.professionalQualificationLevelCount!=professionalQualificationLevelCount
    || serverDataCount.businessExperienceCount!=businessExperienceCount || serverDataCount.expectedSupportCount!=expectedSupportCount || serverDataCount.businessRelatedProblemCount!=businessRelatedProblemCount || serverDataCount.productNatureCount!=businessNatureCount || serverDataCount.productServiceCategoryCount!=productServiceCategoryCount || serverDataCount.trainingNeedsCount!=trainingNeedsCount
    || serverDataCount.entrepreneurCount!=entrepreneurCount || serverDataCount.entrepreneurMainProSerCount!=entrepreneurMainProSerCount || serverDataCount.entrepreneurProSerCount!=entrepreneurProSerCount ||
    serverDataCount.entrepreneurTrainingNeedCount!=entrepreneurTrainingNeedCount || serverDataCount.businessCount!=businessCount || serverDataCount.haveABusinessCount!=haveABusinessCount
    ){
      return false;
    }else{
      return true;
    }
  }



  Future loadTotal(BuildContext context) async {
    serverDataCount = (await ServerRequests().getAllInfo(context,widget.userDetails.LoginId.toString(),widget.userDetails.DistrictId));
    setState(() {});
    print("done");
  }

  Future deleteDbTables(BuildContext context,String tableName) async {
    await EntrepreneurDb.instance.deleteATables(tableName);
    setState(() {});
    print("done");
  }

  Future loadDbCount(BuildContext context) async {
    serverDataCount = (await ServerRequests().getAllInfo(context,widget.userDetails.LoginId.toString(),widget.userDetails.DistrictId));
    await EntrepreneurDb.instance.InsertDbCount(serverDataCount);
    totalCount = serverDataCount.getTotal();
    setState(() {});
    print("done");
    setState(() {});
    print("done");
  }

  Future loadDistrict(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing District Data");
    List<District> districtDetails = await ServerRequests().getDistricts(context);
    districtDetails.forEach((element) async {
      try {
        await EntrepreneurDb.instance.InsertDistricts(element);
        districtCount = districtDetails.length;
        setState(() {});
        print("done");
      } catch (error) {
        print("District Insert : " + error.toString());
      }
    });
    EasyLoading.dismiss();
  }

  Future loadDsDivision(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing Ds Divisions Data");
    List<DsDivision> dsDivisionDetails =
        (await ServerRequests().getDsDivision(context));
    dsDivisionDetails.forEach((element) async {
      try {
        await EntrepreneurDb.instance.InsertDsDivisions(element);
        dsDivisionCount = dsDivisionDetails.length;
        setState(() {});
        print("done");
      } catch (error) {
        print(error.toString());
      }
    });
    EasyLoading.dismiss();
  }

  Future loadGnDivision(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing Gn Division Data");
    List<GnDivision> gnDivisionDetails = (await ServerRequests().getGnDivision(context));
    await EntrepreneurDb.instance.InsertGnDivision(gnDivisionDetails);
    gnDivisionCount = gnDivisionDetails.length;
    setState(() {});
    print("done");
    EasyLoading.dismiss();
  }

  Future loadEducationQualifications(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing Education Qualification Data");
    List<EducationalQualification> educationalQualificationDetails = (await ServerRequests().getEducationQualifications(context));
    educationalQualificationDetails.forEach((element) async {
      try {
        await EntrepreneurDb.instance.InsertEducationalQualification(element);
        educationQualificationCount = educationalQualificationDetails.length;
        setState(() {});
        print("done");
      } catch (error) {
        print(error.toString());
      }
    });
    EasyLoading.dismiss();
  }

  Future loadProfessionalQualifications(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing Professional Qualification Data");
    List<ProfessionalQualification> professionalQualificationDetails = (await ServerRequests().getProfessionalQualifications(context));
    professionalQualificationDetails.forEach((element) async {
      try {
        await EntrepreneurDb.instance.InsertProfessionalQualification(element);
        professionalQualificationCount = professionalQualificationDetails.length;
        setState(() {});
        print("done");
      } catch (error) {
        print(error.toString());
      }
    });
    EasyLoading.dismiss();
  }

  Future loadBusinessExperience(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing Business Experience Data");
    List<BusinessExperience> businessExperienceDetails = (await ServerRequests().getBusinessExperince(context));
    businessExperienceDetails.forEach((element) async {
      try {
        await EntrepreneurDb.instance.InsertBusinessExperience(element);
        businessExperienceCount = businessExperienceDetails.length;
        setState(() {});
        print("done");
      } catch (error) {
        print(error.toString());
      }
    });
    EasyLoading.dismiss();
  }

  Future loadExpectedSupport(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing Expected Support from SED Data");
    List<ExpectedSupport> expectedSupportDetails =
        (await ServerRequests().getExpectedSupport(context));
    expectedSupportDetails.forEach((element) async {
      try {
        await EntrepreneurDb.instance.InsertExpectedSupport(element);
        expectedSupportCount = expectedSupportDetails.length;
        setState(() {});
        print("done");
      } catch (error) {
        print(error.toString());
      }
    });
    EasyLoading.dismiss();
  }

  Future loadBusinessProblems(BuildContext context) async {
    EasyLoading.show(
        dismissOnTap: false, status: "Synchronizing Business Related Problems Data");
    List<BusinessRelatedProblem> businessRelatedProblemDetails = (await ServerRequests().getBusinessProblems(context));
    businessRelatedProblemDetails.forEach((element) async {
      try {
        await EntrepreneurDb.instance.InsertBusinessRelatedProblem(element);
        businessRelatedProblemCount = businessRelatedProblemDetails.length;
        setState(() {});
        print("done");
      } catch (error) {
        print(error.toString());
      }
    });
    EasyLoading.dismiss();
  }

  Future loadBusinessNature(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing Business Nature Data");
    List<NatureDetails> natureDetailsDetails =
        (await ServerRequests().getNature(context));
    natureDetailsDetails.forEach((element) async {
      try {
        await EntrepreneurDb.instance.InsertNatureDetails(element);
        businessNatureCount = natureDetailsDetails.length;
        setState(() {});
        print("done");
      } catch (error) {
        print(error.toString());
      }
    });
    EasyLoading.dismiss();
  }

  Future loadProductServiceCategory(BuildContext context) async {
    EntrepreneurProductService entrepreneurProductService;
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing Product Service Category Data");
    List<ServiceCategoryDetails> serviceCategoryDetailsDetails = (await ServerRequests().getServiceCategory(context));
    await EntrepreneurDb.instance.InsertServiceCategoryDetails(serviceCategoryDetailsDetails);
    productServiceCategoryCount = serviceCategoryDetailsDetails.length;
    EasyLoading.dismiss();
  }

  Future loadEntrepreneurProductService(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing Entrepreneur Product Service Category Data");
    List<EntrepreneurProductService> entrepreneurProductServiceDetails = await ServerRequests().getEntrepreneurProductService(context,widget.userDetails.DistrictId);
    entrepreneurProductServiceDetails = await setAddData(entrepreneurProductServiceDetails);
    entrepreneurProductServiceDetails.forEach((element) { print("---------------");print(element.toJson().toString());});
    await EntrepreneurDb.instance.InsertEntrepreneurProductService(entrepreneurProductServiceDetails);

    print(entrepreneurProductServiceDetails.toString());
    entrepreneurProSerCount = entrepreneurProductServiceDetails.length;
    EasyLoading.dismiss();
  }

  Future loadEntrepreneurMainProductService(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing Entrepreneur MainProduct Service Data");
    List<EntrepreneurMainProductService> entrepreneurMainProductServiceDetails = (await ServerRequests().getEntrepreneurMainProductService(context,widget.userDetails.DistrictId));
    await EntrepreneurDb.instance.InsertEntrepreneurMainProductService(entrepreneurMainProductServiceDetails);
    entrepreneurMainProSerCount = entrepreneurMainProductServiceDetails.length;
    EasyLoading.dismiss();
  }

  Future<List<EntrepreneurProductService>> setAddData(List<EntrepreneurProductService> entrepreneurProductServiceDetails)async{
    for (var element in entrepreneurProductServiceDetails){
      ServiceCategoryDetails serviceCategoryDetails=await EntrepreneurDb.instance.getProductServiceItemFromCode(element.code);
      print("service category obj is"+serviceCategoryDetails.categoryLevelId);
      element.categoryLevel3Id=serviceCategoryDetails.categoryLevelId;
      print("category code is"+element.categoryLevel3Id);
      element.status=serviceCategoryDetails.status;
      element.isSync=1;
      element.businessType=0;
    }
    return entrepreneurProductServiceDetails;
  }

  Future loadTrainingNeeds(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing Training Needs Data");
    List<TrainingNeeds> trainingNeedsDetails = (await ServerRequests().getTrainingNeeds(context));
    trainingNeedsDetails.forEach((element) async {
      try {
        await EntrepreneurDb.instance.InsertTrainingNeeds(element);
        trainingNeedsCount = trainingNeedsDetails.length;
        setState(() {});
        print("done");
      } catch (error) {
        print(error.toString());
      }
    });
    EasyLoading.dismiss();
  }

  Future loadEntrepreneurs(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing Entrepreneurs Data");
    List<EntrepreneurDetails> entrepreneurDetails = (await ServerRequests().getEntrepreneurs(context,widget.userDetails.DistrictId));
    await EntrepreneurDb.instance.InsertEntreprenuers(entrepreneurDetails);
    /// insert exp sup
    entrepreneurDetails.forEach((element) async{
      // element.expectedSupport.forEach((element) async{
        await EntrepreneurDb.instance.InsertEntExpectedSupport(element.expectedSupport);
      // });
    });
    entrepreneurDetails.forEach((element) async{
      // element.expectedSupport.forEach((element) async{
      await EntrepreneurDb.instance.InsertEntTrainingPrograms(element.trainingProgram);
      // });
    });
    entrepreneurDetails.forEach((element) async{
      // element.expectedSupport.forEach((element) async{
      await EntrepreneurDb.instance.InsertEntBusinessRelatedProblem(element.BusinessRelatedProblem);
      // });
    });
    entrepreneurDetails.forEach((element) async{
      // element.expectedSupport.forEach((element) async{
      await EntrepreneurDb.instance.InsertEntQualification(element.Qualifications);
      // });
    });

    entrepreneurDetails.forEach((element) async{
      // element.expectedSupport.forEach((element) async{
      await EntrepreneurDb.instance.InsertEntCollectedOfficer(element.CollectedOfficerDetails);
      // });
    });

    await EntrepreneurDb.instance.InsertWayofAwareSED(wayOfAwareSed);
    await EntrepreneurDb.instance.InsertTrainingPrograms(trainingPrograms);
    await EntrepreneurDb.instance.InsertInvestments(investments);
    await EntrepreneurDb.instance.InsertOwnership(ownerShipList);
    await EntrepreneurDb.instance.InsertBusinessRegistration(businessRegistrationObjList);

    entrepreneurCount = entrepreneurDetails.length;
    setState(() {});
    EasyLoading.dismiss();

  }

  Future loadBusiness(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing Business Data");
    List<Business> businessDetails = (await ServerRequests().getBusiness(context,widget.userDetails.DistrictId));
    await EntrepreneurDb.instance.InsertBusiness(businessDetails);
    businessCount = businessDetails.length;
    setState(() {});
    print("done");
    EasyLoading.dismiss();
  }

  Future loadHaveABusiness(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing Have A Business Data");
    List<HaveABusiness> haveABusinessDetails = (await ServerRequests().getHaveABusiness(context,widget.userDetails.DistrictId));
    await EntrepreneurDb.instance.InsertHaveAbusiness(haveABusinessDetails);
    haveABusinessCount = haveABusinessDetails.length;
    setState(() {});
    print("done");
    EasyLoading.dismiss();
  }

  Future loadLikeToStartBusiness(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing like To Start Business Data");
    List<LikeToStart> likeToStartDetails = (await ServerRequests().getLikeToStartBusiness(context,widget.userDetails.DistrictId));
    await EntrepreneurDb.instance.InsertLikeToStartbusiness(likeToStartDetails);
    likeToStartBusinessCount= likeToStartDetails.length;
    setState(() {});
    print("done");
    EasyLoading.dismiss();
  }

  Future loadProfessionalQualificationLevel(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false, status: "Synchronizing ProfessionalQualificationLevel Data");
    List<ProfessionalQualificationLevel> professionalQualificationLevelDetails = (await ServerRequests().getProfessionalQualificationLevels(context));
    await EntrepreneurDb.instance.InsertProfessionalQualificationLevel(professionalQualificationLevelDetails);
    professionalQualificationLevelCount= professionalQualificationLevelDetails.length;
    setState(() {});
    print("done");
    EasyLoading.dismiss();
  }

  getCount() async {
    totalCount = await EntrepreneurDb.instance.getTotCount(tableDbCount);
    districtCount = await EntrepreneurDb.instance.getCount(tableDistrict);
    dsDivisionCount = await EntrepreneurDb.instance.getCount(tableDsDivisons);
    gnDivisionCount = await EntrepreneurDb.instance.getCount(tableGnDivision);
    educationQualificationCount = await EntrepreneurDb.instance.getCount(tableEducationalQualification);
    professionalQualificationCount = await EntrepreneurDb.instance.getCount(tableProfessionalQualification);
    professionalQualificationLevelCount = await EntrepreneurDb.instance.getCount(tableProfessionalQualificationLevels);
    businessExperienceCount = await EntrepreneurDb.instance.getCount(tableBusinessExperience);
    expectedSupportCount = await EntrepreneurDb.instance.getCount(tableExpectedSupport);
    businessRelatedProblemCount = await EntrepreneurDb.instance.getCount(tableBusinessRelatedProblem);
    businessNatureCount = await EntrepreneurDb.instance.getCount(tableNatureDetails);
    productServiceCategoryCount = await EntrepreneurDb.instance.getCount(tableServiceCategoryDetails);
    trainingNeedsCount = await EntrepreneurDb.instance.getCount(tableTrainingNeeds);
    entrepreneurCount = await EntrepreneurDb.instance.getCount(tableRegistration);
    entrepreneurMainProSerCount = await EntrepreneurDb.instance.getCount(tableEntrepreneurMainProductService);;
    entrepreneurTrainingNeedCount = await EntrepreneurDb.instance.getCount(tableEntrepreneurTrainingNeeds);;
    businessCount = await EntrepreneurDb.instance.getCount(tableBusiness);
    haveABusinessCount = await EntrepreneurDb.instance.getCount(tableHaveABusiness);
    likeToStartBusinessCount = await EntrepreneurDb.instance.getCount(tableLikeTostart);
    entrepreneurProSerCount=await EntrepreneurDb.instance.getCount(tableEntrepreneurProductService);

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      Provider.of<ConnectivityProvider>(context, listen: false)
          .startMonitoring();
      EasyLoading.show(dismissOnTap: false, status: "Synchronizing All Data Counts");
      await loadTotal(context);
      await getCount();
      setState(() {});
      EasyLoading.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                decoration: new BoxDecoration(color: Colors.blueAccent),
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Download",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Divider(),
              Container(
                child: ListTile(
                  leading: SizedBox(
                    width: 350,
                    child: Row(
                      children: [
                        Text('All'),
                        SizedBox(
                          width: 203,
                        ),
                        Text(
                          'Server Data-' +
                              (serverDataCount != null
                                  ? serverDataCount.getTotal().toString()
                                  : "0") +
                              '\nLocal Data-' +
                              totalCount.toString(),
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  trailing: SizedBox(
                    height: 20,
                    width: 30,
                    child: SvgPicture.asset(
                      'assets/Icons/sync.svg',
                      color: serverDataCount != null &&
                          (serverDataCount.getTotal() == totalCount)
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  onTap: () async {
                    bool isConnected = Provider.of<ConnectivityProvider>(
                      context,
                      listen: false,
                    ).isOnline;
                    if (isConnected) {
                      EasyLoading.show(dismissOnTap: false, status: "Syncing all data please be patient!");
                      await deleteDbTables(context,tableDbCount);
                      await deleteDbTables(context,tableEntrepreneurExpectedSupport);
                      await deleteDbTables(context,tableEntrepreneurTrainingPrograms);
                      await deleteDbTables(context,tableEntrepreneurBusinessRelatedProblem);
                      await deleteDbTables(context,tableEntrepreneurQualification);
                      await deleteDbTables(context,tableEntrepreneurCollectedOfficer);
                      await deleteDbTables(context,tableWayOfAware);
                      await deleteDbTables(context,tableTrainingProgramsFollowed);
                      await deleteDbTables(context,tableDistrict);
                      await deleteDbTables(context,tableGnDivision);
                      await deleteDbTables(context,tableDsDivisons);
                      await deleteDbTables(context,tableEducationalQualification);
                      await deleteDbTables(context,tableProfessionalQualification);
                      await deleteDbTables(context,tableProfessionalQualificationLevels);
                      await deleteDbTables(context,tableBusinessExperience);
                      await deleteDbTables(context,tableExpectedSupport);
                      await deleteDbTables(context,tableBusinessRelatedProblem);
                      await deleteDbTables(context,tableNatureDetails);
                      await deleteDbTables(context,tableServiceCategoryDetails);
                      await deleteDbTables(context,tableTrainingNeeds);
                      await deleteDbTables(context,tableRegistration);
                      await deleteDbTables(context,tableBusiness);
                      await deleteDbTables(context,tableHaveABusiness);
                      await deleteDbTables(context,tableLikeTostart);
                      await deleteDbTables(context,tableEntrepreneurProductService);
                      await deleteDbTables(context,tableInvestments);
                      await deleteDbTables(context,tableEntrepreneurMainProductService);

                      await loadTotal(context);
                      await loadDbCount(context);
                      await loadDistrict(context);
                      await loadDsDivision(context);
                      await loadGnDivision(context);
                      await loadEducationQualifications(context);
                      await loadProfessionalQualifications(context);
                      await loadBusinessExperience(context);
                      await loadExpectedSupport(context);
                      await loadBusinessProblems(context);
                      await loadBusinessNature(context);
                      await loadProductServiceCategory(context);
                      await loadTrainingNeeds(context);
                      await loadEntrepreneurs(context);
                      await loadBusiness(context);
                      await loadHaveABusiness(context);
                      await loadLikeToStartBusiness(context);
                      await loadProfessionalQualificationLevel(context);
                      await loadEntrepreneurProductService(context);
                      await loadEntrepreneurMainProductService(context);

                      setState(() {});
                      EasyLoading.dismiss();

                      // entrepreneurDetails = (await ServerRequests().getEntrepreneurs(context));
                      // districtDetails = (await ServerRequests().getDistricts(context));
                      // dsDivisionDetails = (await ServerRequests().getDsDivision(context));
                      // businessExperienceDetails = (await ServerRequests().getBusinessExperince(context));
                      // businessRelatedProblemDetails = (await ServerRequests().getBusinessProblems(context));
                      // educationalQualificationDetails= (await ServerRequests().getEducationQualifications(context));
                      // professionalQualificationDetails= (await ServerRequests().getProfessionalQualifications(context));
                      // gnDivisionDetails= (await ServerRequests().getGnDivision(context));
                      // expectedSupportDetails= (await ServerRequests().getExpectedSupport(context));
                      // natureDetailsDetails= (await ServerRequests().getNature(context));
                      // serviceCategoryDetailsDetails= (await ServerRequests().getServiceCategory(context));
                      // trainingNeedsDetails= (await ServerRequests().getTrainingNeeds(context));
                      // businessDetails= (await ServerRequests().getBusiness(context));
                      // haveABusinessDetails= (await ServerRequests().getHaveABusiness(context));
                      // likeToStartDetails= (await ServerRequests().getLikeToStartBusiness(context));

                    } else {
                      print('No internet');
                    }
                  },
                ),
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text('District'),
                      SizedBox(
                        width: 172,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.districtCount.toString()
                                : "0") +
                            '\nLocal Data-' +
                            districtCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.districtCount == districtCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading Districts");
                  await deleteDbTables(context,tableDistrict);
                  await loadTotal(context);
                  await loadDistrict(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text('DS Division'),
                      SizedBox(
                        width: 146,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.dsDivisionCount.toString()
                                : "0") +
                            '\nLocal Data-' +
                            dsDivisionCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.dsDivisionCount == dsDivisionCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading Ds Divisions");
                  await deleteDbTables(context,tableDsDivisons);
                  await loadTotal(context);
                  await loadDsDivision(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text('GN Division'),
                      SizedBox(
                        width: 143,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.gnDivisionCount.toString()
                                : "0") +
                            '\nLocal Data-' +
                            gnDivisionCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.gnDivisionCount == gnDivisionCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading Gn Divisions");
                  await deleteDbTables(context,tableGnDivision);
                  await loadTotal(context);
                  await loadGnDivision(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text('Education Qualification'),
                      SizedBox(
                        width: 68,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.educationQualificationCount
                                    .toString()
                                : "0") +
                            '\nLocal Data-' +
                            educationQualificationCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.educationQualificationCount ==
                                educationQualificationCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading Education Qualification");
                  await deleteDbTables(context,tableEducationalQualification);
                  await loadTotal(context);
                  await loadEducationQualifications(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text('Professional Qualification'),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.professionalQualificationCount
                                    .toString()
                                : "0") +
                            '\nLocal Data-' +
                            professionalQualificationCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.professionalQualificationCount ==
                                professionalQualificationCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading Professional Qualification");
                  await deleteDbTables(context,tableProfessionalQualification);
                  await loadTotal(context);
                  await loadProfessionalQualifications(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text('Professional Qualification Level'),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount
                                    .professionalQualificationLevelCount
                                    .toString()
                                : "0") +
                            '\nLocal Data-' +
                            professionalQualificationLevelCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount
                                    .professionalQualificationLevelCount ==
                                professionalQualificationLevelCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading Professional Qualification Level");
                  await deleteDbTables(context,tableProfessionalQualificationLevels);
                  await loadTotal(context);
                  await loadProfessionalQualificationLevel(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text('Business Experience'),
                      SizedBox(
                        width: 82,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.businessExperienceCount
                                    .toString()
                                : "0") +
                            '\nLocal Data-' +
                            businessExperienceCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.businessExperienceCount ==
                                businessExperienceCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading Business Experience");
                  await deleteDbTables(context,tableBusinessExperience);
                  await loadTotal(context);
                  await loadBusinessExperience(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text('Expected Support from SED'),
                      SizedBox(
                        width: 35,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.expectedSupportCount
                                    .toString()
                                : "0") +
                            '\nLocal Data-' +
                            expectedSupportCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.expectedSupportCount ==
                                expectedSupportCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading Expected Support");
                  await deleteDbTables(context,tableExpectedSupport);
                  await loadTotal(context);
                  await loadExpectedSupport(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text('Business Related Problems'),
                      SizedBox(
                        width: 35,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.businessRelatedProblemCount
                                    .toString()
                                : "0") +
                            '\nLocal Data-' +
                            businessRelatedProblemCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.businessRelatedProblemCount ==
                                businessRelatedProblemCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading Business Related Problem");
                  await deleteDbTables(context,tableBusinessRelatedProblem);
                  await loadTotal(context);
                  await loadBusinessProblems(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text('Business Nature'),
                      SizedBox(
                        width: 105,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.productNatureCount.toString()
                                : "0") +
                            '\nLocal Data-' +
                            businessNatureCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.productNatureCount ==
                                businessNatureCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading Business Nature");
                  await deleteDbTables(context,tableNatureDetails);
                  await loadTotal(context);
                  await loadBusinessNature(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text('Product Service Category'),
                      SizedBox(
                        width: 47,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.productServiceCategoryCount
                                    .toString()
                                : "0") +
                            '\nLocal Data-' +
                            productServiceCategoryCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.productServiceCategoryCount ==
                                productServiceCategoryCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading Product Service Category");
                  await deleteDbTables(context,tableServiceCategoryDetails);
                  await loadTotal(context);
                  await loadProductServiceCategory(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text('Training Needs'),
                      SizedBox(
                        width: 113,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.trainingNeedsCount.toString()
                                : "0") +
                            '\nLocal Data-' +
                            trainingNeedsCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.trainingNeedsCount ==
                                trainingNeedsCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading TrainingNeeds");
                  await deleteDbTables(context,tableTrainingNeeds);
                  await loadTotal(context);
                  await loadTrainingNeeds(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text('Entrepreneur'),
                      SizedBox(
                        width: 127,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.entrepreneurCount.toString()
                                : "0") +
                            '\nLocal Data-' +
                            entrepreneurCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.entrepreneurCount ==
                                entrepreneurCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading Entrepreneurs");
                  await deleteDbTables(context,tableEntrepreneurExpectedSupport);
                  await deleteDbTables(context,tableEntrepreneurTrainingPrograms);
                  await deleteDbTables(context,tableEntrepreneurBusinessRelatedProblem);
                  await deleteDbTables(context,tableEntrepreneurQualification);
                  await deleteDbTables(context,tableEntrepreneurCollectedOfficer);
                  await deleteDbTables(context,tableWayOfAware);
                  await deleteDbTables(context,tableTrainingProgramsFollowed);
                  await deleteDbTables(context,tableInvestments);
                  await deleteDbTables(context,tableRegistration);
                  await loadTotal(context);
                  await loadEntrepreneurs(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text("Entrepreneur's Main Product/\nService Details"),
                      SizedBox(
                        width: 19,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.entrepreneurMainProSerCount
                                    .toString()
                                : "0") +
                            '\nLocal Data-' +
                            entrepreneurMainProSerCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.entrepreneurMainProSerCount ==
                                entrepreneurMainProSerCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading Entrepreneur's Main Product Service");
                  await deleteDbTables(context,tableEntrepreneurMainProductService);
                  await loadTotal(context);
                  await loadEntrepreneurMainProductService(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text("Entrepreneur's Product/Service\nDetails"),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.entrepreneurProSerCount
                                    .toString()
                                : "0") +
                            '\nLocal Data-' +
                            entrepreneurProSerCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.entrepreneurProSerCount ==
                                entrepreneurProSerCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading EntrepreneurProductService");
                  await deleteDbTables(context,tableEntrepreneurProductService);
                  await loadTotal(context);
                  await loadEntrepreneurProductService(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text("Entrepreneur's Training Need\nDetails"),
                      SizedBox(
                        width: 22,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.entrepreneurTrainingNeedCount
                                    .toString()
                                : "0") +
                            '\nLocal Data-' +
                            entrepreneurTrainingNeedCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.entrepreneurTrainingNeedCount ==
                                entrepreneurTrainingNeedCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text("Business"),
                      SizedBox(
                        width: 148,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.businessCount.toString()
                                : "0") +
                            '\nLocal Data-' +
                            businessCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.businessCount == businessCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading Business");
                  await deleteDbTables(context,tableBusiness);
                  await loadTotal(context);
                  await loadBusiness(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text("Have a Business"),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.haveABusinessCount.toString()
                                : "0") +
                            '\nLocal Data-' +
                            haveABusinessCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.haveABusinessCount ==
                                haveABusinessCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading HaveABusiness");
                  await deleteDbTables(context,tableHaveABusiness);
                  await loadTotal(context);
                  await loadHaveABusiness(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text("Like to Start Business"),
                      SizedBox(
                        width: 66,
                      ),
                      Text(
                        'Server Data-' +
                            (serverDataCount != null
                                ? serverDataCount.likeToStartBusinessCount
                                    .toString()
                                : "0") +
                            '\nLocal Data-' +
                            likeToStartBusinessCount.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: serverDataCount != null &&
                            (serverDataCount.likeToStartBusinessCount ==
                                likeToStartBusinessCount)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                onTap: () async {
                  EasyLoading.show(dismissOnTap: false, status: "Loading LikeToStartBusiness");
                  await deleteDbTables(context,tableLikeTostart);
                  await loadTotal(context);
                  await loadLikeToStartBusiness(context);
                  setState(() {});
                  EasyLoading.dismiss();
                },
              ),
              Divider(),
              Container(
                decoration: new BoxDecoration(color: Colors.blueAccent),
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Upload",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Text("Newly Registered Entrepreneurs"),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Synced Data-0\nTo Sync Data-0',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/Icons/sync.svg',
                    color: Colors.green,
                  ),
                ),
                onTap: () {},
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        bool checkData=checkSyncTotCount();
                        if(checkData){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainMenuScreen(widget.userDetails)));
                        }else{
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text("Alert!"),
                              content: Text("Please Sync all the data before continuing!"),
                              actions: <Widget>[
                                SizedBox(width: 10,),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Text("Ok"),
                                ),
                              ],
                            ),
                          );
                        }

                      } catch (error) {}
                    },
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
