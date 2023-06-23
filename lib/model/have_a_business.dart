import 'package:sed_project/model/service_category_details.dart';
import 'package:sed_project/model/training_needs.dart';

import 'main_product_service.dart';

final String tableHaveABusiness = 'HaveABusiness';

class HaveABusinessFields {
  static final String COL_HAVE_A_BUSINESS_LOCAL_ID = "LocalId";
  static final String COL_HAVE_A_BUSINESS_SERVER_ID = "Id";
  static final String COL_HAVE_A_BUSINESS_BUSINESS_ID = "BusinessId";
  static final String COL_HAVE_A_BUSINESS_DISTRICT_ID = "DistrictId";
  static final String COL_HAVE_A_BUSINESS_MAIN_PRODUCT = "MainProduct";
  static final String COL_HAVE_A_BUSINESS_OWNERSHIP = "OwnershipId";
  static final String COL_HAVE_A_BUSINESS_BUSINESS_NAME = "BusinessName";
  static final String COL_HAVE_A_BUSINESS_START_DATE = "StartDate";
  static final String COL_HAVE_A_BUSINESS_CONTACT = "Contact";
  static final String COL_HAVE_A_BUSINESS_BUSINESS_REGISTRATION = "BusinessRegistration";
  static final String COL_HAVE_A_BUSINESS_EXPECTED_SUPPORT = "ExpectedSupport";
  static final String COL_HAVE_A_BUSINESS_ADDRESS1 = "Address1";
  static final String COL_HAVE_A_BUSINESS_ADDRESS2 = "Address2";
  static final String COL_HAVE_A_BUSINESS_INITIAL_INVESTMENT = "InitialInvestment";
  static final String COL_HAVE_A_BUSINESS_BUSINESS_REGISTRATION_DATE = "RegistrationDate";
  static final String COL_HAVE_A_BUSINESS_BUSINESS_REGISTRATION_PLACE = "BusinessRegistrationPlace";
  static final String COL_HAVE_A_BUSINESS_NATURE_ID = "NatureId";
  static final String COL_HAVE_A_BUSINESS_COUNT = "Count";
  static final String COL_HAVE_A_BUSINESS_HAVE_A_BUSINESS_MODAL_ID = "HaveusinessModalId";
  static final String COL_HAVE_A_BUSINESS_CONVERTED = "Converted";
  static final String COL_HAVE_A_BUSINESS_IS_SYNC = "IsSync";
}

class HaveABusiness {
  int id;
  String serverId;
  String businessId;
  String mainProduct;
  String contact;
  String expectedSupport;
  String businessRegistration;
  String businessRegistrationPlace;
  String count;
  String haveBusinessModalId;
  String converted;
  String businessName;
  String startDate;
  String initialInvestmentId;
  String address1;
  String address2;
  String districtId;
  String ownershipId;
  String registrationNumber;
  String registrationDate;
  String natureId;
  List<ServiceCategoryDetails> productServiceCategoryList;
  List<MainProductService> mainProductServiceList;
  List<TrainingNeeds> trainingNeedsList;


  HaveABusiness({
      this.id,
      this.serverId,
      this.businessId,
      this.mainProduct,
      this.contact,
      this.expectedSupport,
      this.businessRegistration,
      this.businessRegistrationPlace,
      this.count,
      this.haveBusinessModalId,
      this.converted,
      this.businessName,
      this.startDate,
      this.initialInvestmentId,
      this.address1,
      this.address2,
      this.districtId,
      this.ownershipId,
      this.registrationDate,
      this.natureId,
      this.productServiceCategoryList,
      this.mainProductServiceList,
      this.trainingNeedsList,
      this.registrationNumber
  });

  HaveABusiness copy({
    int id,
    String serverId,
    String businessId,
    String mainProduct,
    String contact,
    String expectedSupport,
    String businessRegistration,
    String businessRegistrationPlace,
    String count,
    String haveBusinessModalId,
    String converted,
    String businessName,
    String startDate,
    String initialInvestmentId,
    String address1,
    String address2,
    String districtId,
    String ownershipId,
    String registrationNumber,
    String registrationDate,
    String natureId,
    List<ServiceCategoryDetails> productServiceCategoryList ,
    List<MainProductService> mainProductServiceList,
    List<TrainingNeeds> trainingNeedsList,
  }) =>
      HaveABusiness(
        id: id ?? this.id,
        serverId:  serverId ?? this. serverId,
        businessId: businessId ?? this.businessId,
        mainProduct: mainProduct ?? this.mainProduct,
        contact: contact ?? this.contact,
        expectedSupport: expectedSupport ?? this.expectedSupport,
        businessRegistration: businessRegistration ?? this.businessRegistration,
        businessRegistrationPlace: businessRegistrationPlace ?? this.businessRegistrationPlace,
        count: count ?? this.count,
        haveBusinessModalId: haveBusinessModalId ?? this.haveBusinessModalId,
        converted: converted ?? this.converted,
        businessName: businessName ?? this.businessName,
        startDate: startDate ?? this.startDate,
        initialInvestmentId: initialInvestmentId ?? this.initialInvestmentId,
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        districtId: districtId ?? this.districtId,
        ownershipId: ownershipId ?? this.ownershipId,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        registrationDate: registrationDate ?? this.registrationDate,
        natureId: natureId ?? this.natureId,
        productServiceCategoryList: productServiceCategoryList ?? this.productServiceCategoryList,
        mainProductServiceList: mainProductServiceList ?? this.mainProductServiceList,
        trainingNeedsList: trainingNeedsList ?? this.trainingNeedsList,
      );

  HaveABusiness.fromJson(Map<String, dynamic> json) {
    serverId= json['id'];
    districtId = json['districtId'];
    businessId = json['businessId'];
    mainProduct = json['mainProduct'];
    ownershipId = json['ownershipId'];
    businessName = json['businessName'];
    startDate = json['startDate'];
    contact = json['contact'];
    businessRegistration = json['businessRegistration'];
    expectedSupport = json['expectedSupport'];
    address1 = json['address1'];
    address2 = json['address2'];
    registrationDate = json['registeredDate'];
    initialInvestmentId = json['initialInvestment'];
    businessRegistrationPlace = json['businessRegistrationPlace'];
    natureId = json['natureId'];
    count = json['count'];
    haveBusinessModalId = json['haveusinessModalId'];
    converted = json['converted'];
  }

  Map<String, Object> toJson() => {
    HaveABusinessFields.COL_HAVE_A_BUSINESS_SERVER_ID: serverId,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_ID: businessId,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_DISTRICT_ID: districtId,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_MAIN_PRODUCT: mainProduct,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_OWNERSHIP:ownershipId,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_NAME: businessName,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_START_DATE: startDate,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_CONTACT: contact,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_REGISTRATION: businessRegistration,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_EXPECTED_SUPPORT: expectedSupport,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_ADDRESS1: address1,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_ADDRESS2: address2,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_INITIAL_INVESTMENT: initialInvestmentId,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_REGISTRATION_DATE: registrationDate,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_REGISTRATION_PLACE:businessRegistrationPlace,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_NATURE_ID: natureId,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_COUNT: count,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_HAVE_A_BUSINESS_MODAL_ID: haveBusinessModalId,
    HaveABusinessFields.COL_HAVE_A_BUSINESS_CONVERTED: converted,
  };

  static HaveABusiness fromJsonDb(Map<String,Object>json) =>HaveABusiness(
    id: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_LOCAL_ID] as int,
    serverId: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_SERVER_ID] as String,
    businessId: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_ID] as String,
    districtId: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_DISTRICT_ID] as String,
    mainProduct: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_MAIN_PRODUCT] as String,
    ownershipId: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_OWNERSHIP] as String,
    businessName: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_NAME] as String,
    startDate: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_START_DATE] as String,
    contact: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_CONTACT] as String,
    businessRegistration: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_REGISTRATION] as String,
    expectedSupport: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_EXPECTED_SUPPORT] as String,
    address1: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_ADDRESS1] as String,
    address2: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_ADDRESS2] as String,
    initialInvestmentId: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_INITIAL_INVESTMENT] as String,
    registrationDate: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_REGISTRATION_DATE] as String,
    businessRegistrationPlace: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_REGISTRATION_PLACE] as String,
    natureId: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_NATURE_ID] as String,
    count: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_COUNT] as String,
    haveBusinessModalId: json[ HaveABusinessFields.COL_HAVE_A_BUSINESS_HAVE_A_BUSINESS_MODAL_ID] as String,
    converted: json[ HaveABusinessFields. COL_HAVE_A_BUSINESS_CONVERTED] as String,
  );
}
