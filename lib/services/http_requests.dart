import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:sed_project/model/business.dart';
import 'package:sed_project/model/business_experience.dart';
import 'package:sed_project/model/business_related_problem.dart';
import 'package:sed_project/model/db_count.dart';
import 'package:sed_project/model/district.dart';
import 'package:sed_project/model/ds_division.dart';
import 'package:sed_project/model/education_qualification.dart';
import 'package:sed_project/model/entrepreneur_details.dart';
import 'package:sed_project/model/entrepreneur_mainproduct_service.dart';
import 'package:sed_project/model/entrepreneur_product_service.dart';
import 'package:sed_project/model/expected_support.dart';
import 'package:sed_project/model/for_requests/insert_entrepreneur.dart' as entImport;
import 'package:sed_project/model/for_requests/insert_converted_l_s.dart' as entConvImport;
import 'package:sed_project/model/for_requests/insert_entrepreneur_evaluation.dart';
import 'package:sed_project/model/for_requests/insert_evaluation_new.dart';
import 'package:sed_project/model/for_requests/insert_l_s.dart' as entImplts;
import 'package:sed_project/model/for_requests/insert_h_b.dart' as entImpHvb;
import 'package:sed_project/model/gn_division.dart';
import 'package:sed_project/model/have_a_business.dart';
import 'package:sed_project/model/like_to_start_business.dart';
import 'package:sed_project/model/nature_details.dart';
import 'package:sed_project/model/professional_qualification.dart';
import 'package:sed_project/model/professional_qualification_level.dart';
import 'package:sed_project/model/service_category_details.dart';
import 'package:sed_project/model/training_needs.dart';
import 'package:sed_project/model/user_details.dart';
import 'api_endpoints.dart';
import 'http_service.dart';



class ServerRequests{

  HttpBase _base =HttpBase();

  Future<Response> addEntrepreneur(BuildContext context,entImport.InsertEntrepreneur object)async{
    Response res = await _base.postRequest(jsonEncode(object),Endpoints.insertEntrepreneur);
    return res;
  }

  Future<Response> addLikeToStartBusiness(BuildContext context,entImplts.InsertLS object)async{
    Response res = await _base.postRequest(jsonEncode(object),Endpoints.insertLikeToStartBusiness);
    print('Like to start Upload Url is '+Endpoints.insertLikeToStartBusiness);
    return res;
  }

  Future<Response> addHaveABusiness(BuildContext context,entImpHvb.InsertHB object)async{
    Response res = await _base.postRequest(jsonEncode(object),Endpoints.insertLikeHaveABusiness);
    return res;
  }

  Future<Response> addConvertedLikeToStart(BuildContext context,entConvImport.InsertConvertedLS object)async{
    Response res = await _base.postRequest(jsonEncode(object),Endpoints.insertConvertedToLs);
    return res;
  }

  Future<Response> sendEvaluation(BuildContext context,InsertEvaluationNew object)async{
    Response res = await _base.postRequest(jsonEncode(object),Endpoints.sendEvaluation);
    return res;
  }



  Future<UserDetails> getLoginInfo(BuildContext context,String url)async{
    Response res = await _base.getRequest(url);
    print(res.statusCode.toString()+"body of login");
    UserDetails resObject;
    int id=0;
    try {
      Map map = jsonDecode(res.body);
      print('Map');
      print(map);
      print('done');
      id=map['ID'];
      print('Value is'+id.toString());
      map['DATA'].forEach((value) {
        resObject =UserDetails.fromJson(value);
      });
    }catch(e){
      print(e.toString());
    }
    return resObject;
  }

  Future<int> getStatusCode(BuildContext context,String url)async{
    Response res = await _base.getRequest(url);
    print(res.body);
    int id=0;
    try {
      Map map = jsonDecode(res.body);
      id=map['ID'];
      print('Value is'+id.toString());
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return id;
  }

  Future<DbCount> getAllInfo(BuildContext context,String userId ,String districtId)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getDbCount.php?"+"user_id="+userId+"&district_id="+districtId);
    print(res.body+"body");
    DbCount resObject;
    try {
      resObject = DbCount.fromJson(jsonDecode(res.body));
      print('respbject testing');
      print(resObject);
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return resObject;
  }

  Future<List<District>> getDistricts(BuildContext context)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getDistrict.php");
    print(res.body+"body");
    List<District> districtList=[];

    try {
      Map map = jsonDecode(res.body);
      print('Map');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        District district =District.fromJson(value);
        districtList.add(district);
      });

    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return districtList;
  }

  Future<List<EducationalQualification>> getEducationQualifications(BuildContext context)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getEducationQulification.php");
    print(res.body+"body");
    List<EducationalQualification> educationList=[];

    try {
      Map map = jsonDecode(res.body);
      print('Map');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        EducationalQualification educationalQualification =EducationalQualification.fromJson(value);
        educationList.add(educationalQualification);
      });

    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return educationList;
  }

  Future<List<ProfessionalQualification>> getProfessionalQualifications(BuildContext context)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getProfesionalQualification.php");
    print(res.body+"body");
    List<ProfessionalQualification> professionalList=[];

    try {
      Map map = jsonDecode(res.body);
      print('Map');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        ProfessionalQualification professionalQualification =ProfessionalQualification.fromJson(value);
        professionalList.add(professionalQualification);
      });

    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return professionalList;
  }

  Future<List<ProfessionalQualificationLevel>> getProfessionalQualificationLevels(BuildContext context)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getProfesionalQualificationLevels.php");
    print(res.body+"body");
    List< ProfessionalQualificationLevel> professionalLevelList=[];

    try {
      Map map = jsonDecode(res.body);
      print('Map');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        ProfessionalQualificationLevel professionalQualificationLevel = ProfessionalQualificationLevel.fromJson(value);
        professionalLevelList.add(professionalQualificationLevel);
      });

    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return professionalLevelList;
  }

  Future<List<BusinessExperience>> getBusinessExperince(BuildContext context)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getExperienceOfField.php");
    print(res.body+"body");
    List<BusinessExperience> businessExpList=[];

    try {
      Map map = jsonDecode(res.body);
      print('Map');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        BusinessExperience businessExperience = BusinessExperience.fromJson(value);
        businessExpList.add(businessExperience);
      });

    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return businessExpList;
  }


  Future<List<ExpectedSupport>> getExpectedSupport(BuildContext context)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getExpectedSuportDetails.php");
    print(res.body+"body");
    List<ExpectedSupport> expSupList=[];

    try {
      Map map = jsonDecode(res.body);
      print('Map');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        ExpectedSupport expectedSupport = ExpectedSupport.fromJson(value);
        expSupList.add(expectedSupport);
      });

    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return expSupList;
  }

  Future<List<BusinessRelatedProblem>> getBusinessProblems(BuildContext context)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getBusinessRelatedProblem.php");
    print(res.body+"body");
    List<BusinessRelatedProblem> bussinessProblemList=[];
    try {
      Map map = jsonDecode(res.body);
      print('Map');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        BusinessRelatedProblem businessRelatedProblem = BusinessRelatedProblem.fromJson(value);
        bussinessProblemList.add(businessRelatedProblem);
      });

    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return bussinessProblemList;
  }

  Future<List<NatureDetails>> getNature(BuildContext context)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getNatureDetails.php");
    print(res.body+"body");
    List<NatureDetails> natureList=[];
    try {
      Map map = jsonDecode(res.body);
      print('Map');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        NatureDetails natureDetails = NatureDetails.fromJson(value);
        natureList.add(natureDetails);
      });

    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return natureList;
  }

  Future<List<ServiceCategoryDetails>> getServiceCategory(BuildContext context)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getProductServiceCategory.php");
    print(res.body+"body");
    List<ServiceCategoryDetails> serviceCategoryList=[];
    try {
      Map map = jsonDecode(res.body);
      print('Map');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        ServiceCategoryDetails serviceCategoryDetails = ServiceCategoryDetails.fromJson(value);
        serviceCategoryList.add(serviceCategoryDetails);
      });

    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return serviceCategoryList;
  }

  Future<List<EntrepreneurProductService>> getEntrepreneurProductService(BuildContext context,String districtId)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getAllProductService.php?district_id="+districtId);
    print(res.body+"body");
    List<EntrepreneurProductService> entrepreneurServiceCategoryList=[];
    try {
      Map map = jsonDecode(res.body);
      print('Map');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        EntrepreneurProductService entrepreneurProductService = EntrepreneurProductService.fromJson(value);
        entrepreneurServiceCategoryList.add(entrepreneurProductService);
      });

    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return entrepreneurServiceCategoryList;
  }

  Future<List<EntrepreneurMainProductService>> getEntrepreneurMainProductService(BuildContext context,String districtId)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getAllMainProductService.php?district_id="+districtId);
    print(res.body+"body");
    List<EntrepreneurMainProductService> entrepreneurEntrepreneurMainProductServiceList=[];
    try {
      Map map = jsonDecode(res.body);
      print('Map');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        EntrepreneurMainProductService entrepreneurMainProductService = EntrepreneurMainProductService.fromJson(value);
        entrepreneurEntrepreneurMainProductServiceList.add(entrepreneurMainProductService);
      });

    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return entrepreneurEntrepreneurMainProductServiceList;
  }

  Future<List<DsDivision>> getDsDivision(BuildContext context)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getDivision.php");
    print(res.body+"body");
    List<DsDivision> dsDivisionList=[];
    try {
      Map map = jsonDecode(res.body);
      print('Map');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        DsDivision dsDivision = DsDivision.fromJson(value);
        dsDivisionList.add(dsDivision);
      });

    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return dsDivisionList;
  }

  Future<List<GnDivision>> getGnDivision(BuildContext context)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getGnDivision.php");
    print(res.body+"body");
    List<GnDivision> gnDivisionList=[];
    try {
      Map map = jsonDecode(res.body);
      print('Map');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        GnDivision gnDivision = GnDivision.fromJson(value);
        gnDivisionList.add(gnDivision);
      });

    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return gnDivisionList;
  }

  Future<List<EntrepreneurDetails>> getEntrepreneurs(BuildContext context,String districtId)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getEntrepreneurs.php?district_id="+districtId);
    // print(res.body+"body");
    List<EntrepreneurDetails> entrepreneurDetailsList=[];
    try {
      Map map = jsonDecode(res.body);
      // print('Entrepreneur Details Receiving ');
      // print(map);
      // print('done');
      map['DATA'].forEach((value) {
        EntrepreneurDetails entrepreneurDetails = EntrepreneurDetails.fromJson(value);
        entrepreneurDetailsList.add(entrepreneurDetails);
      });
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return entrepreneurDetailsList;
  }

  Future<List<TrainingNeeds>> getTrainingNeeds(BuildContext context)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getTrainingProgramsDetails.php");
    print(res.body+"body");
    List<TrainingNeeds> trainingNeedsDetailsList=[];
    try {
      Map map = jsonDecode(res.body);
      print('Entrepreneur Details Receiving ');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        TrainingNeeds trainingNeeds = TrainingNeeds.fromJson(value);
        trainingNeedsDetailsList.add(trainingNeeds);
      });
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return trainingNeedsDetailsList;
  }

  Future<List<Business>> getBusiness(BuildContext context,String districtId)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getBusiness.php?district_id="+districtId);
    print(res.body+"body");
    List<Business> businessList=[];
    try {
      Map map = jsonDecode(res.body);
      print('Entrepreneur Details Receiving ');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        Business business = Business.fromJson(value);
        businessList.add(business);
      });
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return businessList;
  }

  Future<List<HaveABusiness>> getHaveABusiness(BuildContext context,String districtId)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getHaveABusiness.php?district_id="+districtId);
    print(res.body+"body");
    List<HaveABusiness> haveABusinessList=[];
    try {
      Map map = jsonDecode(res.body);
      print('Entrepreneur Details Receiving ');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        HaveABusiness haveABusiness = HaveABusiness.fromJson(value);
        haveABusinessList.add(haveABusiness);
      });
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return haveABusinessList;
  }

  Future<List<LikeToStart>> getLikeToStartBusiness(BuildContext context,String districtId)async{
    Response res = await _base.getRequest(Endpoints.SERVICE_URL + "getLikeToStart.php?district_id="+districtId);
    print(res.body+"body");
    List<LikeToStart> likeToStartList=[];
    try {
      Map map = jsonDecode(res.body);
      print('Entrepreneur Details Receiving ');
      print(map);
      print('done');
      map['DATA'].forEach((value) {
        LikeToStart likeToStart = LikeToStart.fromJson(value);
        likeToStartList.add(likeToStart);
      });
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(
          msg: "CODE 003 ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return likeToStartList;
  }



}


class HttpResponse{
  int code;
  dynamic object;
  HttpResponse(this.code, this.object);
}

class Token{
  DateTime date;
  String token;
  Token({this.date, this.token});

  Token.fromJson(Map<String, dynamic> json) {
    date = DateTime.fromMillisecondsSinceEpoch(json['date'] as int);
    token = json['token'];
    print(date.toString());
  }

  Map<String, dynamic> toJson(){
    print(date.toString());
    return{
      "date":date.millisecondsSinceEpoch,
      "token":token
    };
  }

  bool isExpire(){
    if(date!=null){
      print(date.toString());
      return DateTime.now().isAfter(date);
    }
    return true;
  }

}