import 'package:sed_project/model/service_category_details.dart';
import 'package:sed_project/model/training_needs.dart';

final String tableLikeTostart = 'LikeTostart';

class LikeToStartFields {
  static final String COL_LIKE_TO_START_LOCAL_ID = "LocalId";
  static final String COL_LIKE_TO_START_SERVER_ID = "Id";
  static final String COL_LIKE_TO_START_BUSINESS_ID = "BusinessId";
  static final String COL_LIKE_TO_START_EXPECTED_START = "ExpectedStartDate";
  static final String COL_LIKE_TO_START_DESCRIBE_BUSINESS = "DescribeBusiness";
  static final String COL_LIKE_TO_START_STATE = "State";
  static final String COL_LIKE_TO_START_EXPECTED_INVESTMENT = "ExpectedInvestmentId";
  static final String COL_LIKE_TO_START_ADDED_TO_CONVERT = "AddedToConvert";
}

class LikeToStart {
  int id;
  String serverId;
  String businessId;
  String natureId;
  String describeBusiness;
  String expectedInvestmentId;
  String expectedStartDate;
  String addToConvert;
  String state;
  List<ServiceCategoryDetails> productServiceCategoryList = [];
  List<TrainingNeeds> trainingNeedsList = [];


  LikeToStart({
      this.id,
      this.serverId,
      this.businessId,
      this.natureId,
      this.describeBusiness,
      this.expectedInvestmentId,
      this.expectedStartDate,
      this.addToConvert,
      this.state,
      this.productServiceCategoryList,
      this.trainingNeedsList});

  LikeToStart copy({
    int id,
    String serverId,
    String businessId,
    int natureId,
    String describeBusiness,
    String expectedInvestmentId,
    String expectedStartDate,
    String addToConvert,
    String state,
    List<ServiceCategoryDetails> productServiceCategoryList,
    List<TrainingNeeds> trainingNeedsList,
  }) =>
      LikeToStart(
        id: id ?? this.id,
        serverId: serverId ?? this.serverId,
        businessId: businessId ?? this.businessId,
        natureId: natureId ?? this.natureId,
        describeBusiness: describeBusiness ?? this.describeBusiness,
        expectedInvestmentId: expectedInvestmentId ?? this.expectedInvestmentId,
        expectedStartDate: expectedStartDate ?? this.expectedStartDate,
        addToConvert: addToConvert ?? this.addToConvert,
        state: state ?? this.state,
        productServiceCategoryList: productServiceCategoryList ?? this.productServiceCategoryList,
        trainingNeedsList: trainingNeedsList ?? this.trainingNeedsList,
      );

  LikeToStart.fromJson(Map<String, dynamic> json) {
    serverId = json['ID'];
    businessId = json['BUSINESS_ID'];
    expectedStartDate = json['EXPECTED_TO_START'];
    describeBusiness = json['DESCRIBE_BUSINESS'];
    state = json['STATE'];
    expectedInvestmentId = json['EXPECTED_INVESTMENT'];
    addToConvert = json['ADDED_TO_CONVERT'];
  }

  Map<String, Object> toJson() => {
        LikeToStartFields.COL_LIKE_TO_START_SERVER_ID: serverId,
        LikeToStartFields.COL_LIKE_TO_START_BUSINESS_ID: businessId,
        LikeToStartFields.COL_LIKE_TO_START_EXPECTED_START: expectedStartDate,
        LikeToStartFields.COL_LIKE_TO_START_DESCRIBE_BUSINESS: describeBusiness,
        LikeToStartFields.COL_LIKE_TO_START_STATE: state,
        LikeToStartFields.COL_LIKE_TO_START_EXPECTED_INVESTMENT: expectedInvestmentId,
        LikeToStartFields.COL_LIKE_TO_START_ADDED_TO_CONVERT: addToConvert,
  };

  static LikeToStart fromJsonDb(Map<String,Object>json) =>LikeToStart(
    id: json[ LikeToStartFields.COL_LIKE_TO_START_LOCAL_ID] as int,
    serverId: json[ LikeToStartFields.COL_LIKE_TO_START_SERVER_ID] as String,
    businessId: json[ LikeToStartFields.COL_LIKE_TO_START_BUSINESS_ID] as String,
    expectedStartDate: json[ LikeToStartFields.COL_LIKE_TO_START_EXPECTED_START] as String,
    describeBusiness: json[ LikeToStartFields.COL_LIKE_TO_START_DESCRIBE_BUSINESS] as String,
    state: json[ LikeToStartFields.COL_LIKE_TO_START_STATE] as String,
    expectedInvestmentId: json[ LikeToStartFields.COL_LIKE_TO_START_EXPECTED_INVESTMENT] as String,
    addToConvert: json[ LikeToStartFields.COL_LIKE_TO_START_ADDED_TO_CONVERT] as String,

  );
}
