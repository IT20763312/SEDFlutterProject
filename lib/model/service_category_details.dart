final String tableServiceCategoryDetails = 'ServiceCategoryDetails';

class ServiceCategoryDetailsFields {
  static final String id = 'id';
  static final String SERVICE_ID = "ServiceId";
  static final String CODE = "Code";
  static final String CATEGORY = 'Category';
  static final String CATEGORY_LEVEL_ID = "CategoryLevelId";
  static final String STATUS = "Status";
}

class ServiceCategoryDetails {
  int id;
  String serviceId;
  String code;
  String category;
  String categoryLevelId;
  String status;

  ServiceCategoryDetails(
      {this.id,
      this.serviceId,
      this.code,
      this.category,
      this.categoryLevelId,
      this.status});

  ServiceCategoryDetails copy({
    int id,
    String serviceId,
    String code,
    String category,
    String categoryLevelId,
    String status,
  }) =>
      ServiceCategoryDetails(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        code: code ?? this.code,
        category: category ?? this.category,
        categoryLevelId: categoryLevelId ?? this.categoryLevelId,
        status: status ?? this.status,
      );

  ServiceCategoryDetails.fromJson(Map<String, dynamic> json) {
    serviceId = json['SERVICE_ID'];
    code = json['CODE'];
    category = json['CATEGORY'];
    categoryLevelId = json['CATEGORY_LEVEL_3_ID'];
    status = json['STATUS'];
  }

  Map<String, Object> toJson() =>{
    ServiceCategoryDetailsFields.SERVICE_ID: serviceId ,
    ServiceCategoryDetailsFields.CODE: code ,
    ServiceCategoryDetailsFields.CATEGORY: category ,
    ServiceCategoryDetailsFields.CATEGORY_LEVEL_ID: categoryLevelId ,
    ServiceCategoryDetailsFields.STATUS: status ,
  };

  static ServiceCategoryDetails fromJsonDb(Map<String,Object>json) =>ServiceCategoryDetails(
    id: json[ServiceCategoryDetailsFields.id] as int,
    serviceId: json[ServiceCategoryDetailsFields.SERVICE_ID] as String,
    code: json[ServiceCategoryDetailsFields.CODE] as String,
    category: json[ServiceCategoryDetailsFields.CATEGORY] as String,
    categoryLevelId: json[ServiceCategoryDetailsFields.CATEGORY_LEVEL_ID] as String,
    status: json[ServiceCategoryDetailsFields.STATUS] as String,

  );
}
