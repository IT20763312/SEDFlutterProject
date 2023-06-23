final String tableEntrepreneurProductService = 'EntrepreneurProductService';

class EntrepreneurProductServiceFields {

  static final String LOCAL_ID = 'id';
  static final String SERVER_ID = 'ServerId';
  static final String BUSINESS_ID = 'BusinessId';
  static final String CODE = 'Code';
  static final String CATEGORY = "Category";
  static final String REFERENCE_NO = "RefNo";
  static final String CATEGORY_LEVEL3_ID = "CategoryLevel3Id";
  static final String STATUS = "Status";
  static final String ISSYNC = "IsSync";
  static final String BUSINESS_TYPE = "BusinessType";

}

class EntrepreneurProductService {
  int id;
  String localId;
  String businessId;
  String code;
  String category;
  String referenceNo;
  String categoryLevel3Id;
  String status;
  int isSync;
  int businessType;


  EntrepreneurProductService({this.id, this.localId, this.businessId, this.code,
      this.category, this.referenceNo, this.categoryLevel3Id, this.status,
      this.isSync, this.businessType});

  EntrepreneurProductService.fromJson(Map<String, dynamic> json) {
    localId = json['id'];
    businessId = json['business_id'];
    code =json['CODE'];
    category=json['CATEGORY'];
    referenceNo = json['REF_NO'];
  }

  Map<String, Object> toJson() =>{
    EntrepreneurProductServiceFields.SERVER_ID:localId ,
    EntrepreneurProductServiceFields.BUSINESS_ID:businessId ,
    EntrepreneurProductServiceFields.CODE:code ,
    EntrepreneurProductServiceFields.CATEGORY:category ,
    EntrepreneurProductServiceFields.REFERENCE_NO:referenceNo,
    EntrepreneurProductServiceFields.CATEGORY_LEVEL3_ID:categoryLevel3Id,
    EntrepreneurProductServiceFields.STATUS:status,
    EntrepreneurProductServiceFields.ISSYNC:isSync,
    EntrepreneurProductServiceFields.BUSINESS_TYPE:businessType,
  };

  static EntrepreneurProductService fromJsonDb(Map<String, Object>json) => EntrepreneurProductService(
      id: json[EntrepreneurProductServiceFields.LOCAL_ID] as int,
      localId: json[EntrepreneurProductServiceFields.SERVER_ID] as String,
      businessId: json[EntrepreneurProductServiceFields.BUSINESS_ID] as String,
      code: json[EntrepreneurProductServiceFields.CODE] as String,
      category: json[EntrepreneurProductServiceFields.CATEGORY] as String,
      referenceNo: json[EntrepreneurProductServiceFields.REFERENCE_NO] as String,
      categoryLevel3Id: json[EntrepreneurProductServiceFields.CATEGORY_LEVEL3_ID] as String,
      status: json[EntrepreneurProductServiceFields.STATUS] as String,
      isSync: int.tryParse(json[EntrepreneurProductServiceFields.ISSYNC]) as int,
      businessType: int.tryParse(json[EntrepreneurProductServiceFields.BUSINESS_TYPE]) as int,

  );

}