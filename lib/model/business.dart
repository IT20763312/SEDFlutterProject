final String tableBusiness = 'Business';

class BusinessFields {

  static final String id = 'LocalId';
  static final String BUSINESS_ID = "BusinessId";
  static final String ECONOMIC_CATEGORY_ID= "EconomicCategoryId";
  static final String NATURE_ID = "NatureId";
  static final String PRODUCT_SERVICE_CATEGORY_SERVICE_ID= "productServiceCategoryServiceId";
  static final String ENTREPRENEUR_NIC = 'EntreprenuerNic';
  static final String CATEGORY = "Category";
  static final String EXPECTED_SUPPORT_DESCRIBE= "ExpectedSupportDescribe";
  static final String TRAINING_NEEDS_ID = "TrainingNeedsId";
  static final String TRAINING_PROGRAMME_ID= "TrainingProgrammeId";
  static final String REF_NO= "RefNo";
  static final String BUSINESS_TYPE= "BusinessType";
}

class Business {
  int id;
  String businessId;
  String economicCategoryId;
  String natureId;
  String productServiceCategoryServiceId;
  String entrepreneurNic;
  String category;
  String expectedSupportDescribe;
  String trainingNeedsId;
  String trainingProgrammeId;
  String refNo;
  String businessType;

  Business({
      this.id,
      this.businessId,
      this.economicCategoryId,
      this.natureId,
      this.productServiceCategoryServiceId,
      this.entrepreneurNic,
      this.category,
      this.expectedSupportDescribe,
      this.trainingNeedsId,
      this.trainingProgrammeId,
      this.refNo,
      this.businessType
  });

  Business copy({
    int id,
    String businessId,
    String economicCategoryId,
    String natureId,
    String productServiceCategoryServiceId,
    String entrepreneurNic,
    String category,
    String expectedSupportDescribe,
    String trainingNeedsId,
    String trainingProgrammeId,
    String refNo,
    String businessType,
  }) => Business(
    id: id ?? this.id,
    businessId: businessId ?? this.businessId,
    economicCategoryId:economicCategoryId ?? this.economicCategoryId,
    natureId: natureId ?? this.natureId,
    productServiceCategoryServiceId: productServiceCategoryServiceId ?? this.productServiceCategoryServiceId,
    entrepreneurNic:entrepreneurNic ?? this.entrepreneurNic,
    category: category ?? this.category,
    expectedSupportDescribe:expectedSupportDescribe ?? this.expectedSupportDescribe,
    trainingNeedsId:trainingNeedsId ?? this.trainingNeedsId,
    trainingProgrammeId: trainingProgrammeId ?? this.trainingProgrammeId,
    refNo: refNo ?? this.refNo,
    businessType: businessType ?? this.businessType,

  );


  Business.fromJson(Map<String, dynamic> json) {
    businessId= json['businessId'];
    economicCategoryId= json['economicCategoryId'];
    natureId= json['natureId'];
    productServiceCategoryServiceId= json['productServiceCategoryServiceId'];
    entrepreneurNic= json['entrepreneurNic'];
    category= json['category'];
    expectedSupportDescribe= json['expectedSupportDescribe'];
    trainingNeedsId= json['trainingNeedsId'];
    trainingProgrammeId= json['trainingProgrammeId'];
    refNo= json['refNo'];
    businessType=json['category'];
  }

  Map<String, Object> toJson() =>{
    BusinessFields.BUSINESS_ID: businessId ,
    BusinessFields.ECONOMIC_CATEGORY_ID: economicCategoryId ,
    BusinessFields.NATURE_ID: natureId ,
    BusinessFields.PRODUCT_SERVICE_CATEGORY_SERVICE_ID: productServiceCategoryServiceId ,
    BusinessFields.ENTREPRENEUR_NIC: entrepreneurNic ,
    BusinessFields.CATEGORY:category ,
    BusinessFields.EXPECTED_SUPPORT_DESCRIBE: expectedSupportDescribe ,
    BusinessFields.TRAINING_NEEDS_ID: trainingNeedsId ,
    BusinessFields.TRAINING_PROGRAMME_ID: trainingProgrammeId ,
    BusinessFields.REF_NO: refNo ,
    BusinessFields.BUSINESS_TYPE:businessType
  };

  static Business fromJsonDb(Map<String,Object>json) => Business(
    id:json[BusinessFields.id] as int ,
    businessId:json[BusinessFields.BUSINESS_ID] as String ,
    economicCategoryId:json[BusinessFields.ECONOMIC_CATEGORY_ID] as String ,
    natureId:json[BusinessFields.NATURE_ID] as String,
    productServiceCategoryServiceId:json[BusinessFields.PRODUCT_SERVICE_CATEGORY_SERVICE_ID] as String,
    entrepreneurNic:json[BusinessFields.ENTREPRENEUR_NIC] as String ,
    category:json[BusinessFields.CATEGORY] as String,
    expectedSupportDescribe:json[BusinessFields.EXPECTED_SUPPORT_DESCRIBE] as String,
    trainingNeedsId:json[BusinessFields.TRAINING_NEEDS_ID] as String,
    trainingProgrammeId:json[BusinessFields.TRAINING_PROGRAMME_ID] as String ,
    refNo:json[BusinessFields.REF_NO] as String,
    businessType:json[BusinessFields.BUSINESS_TYPE] as String,
  );
}
