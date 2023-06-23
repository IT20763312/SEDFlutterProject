class InsertLS {
  InsertLS({
      String businessId, 
      int businessType, 
      String category, 
      String entrepreneurNic, 
      int isSync,
      String localId,
      Lts lts, 
      String natureId,}){
    _businessId = businessId;
    _businessType = businessType;
    _category = category;
    _entrepreneurNic = entrepreneurNic;
    _isSync = isSync;
    _localId = localId;
    _lts = lts;
    _natureId = natureId;
}

  InsertLS.fromJson(dynamic json) {
    _businessId = json['businessId'];
    _businessType = json['businessType'];
    _category = json['category'];
    _entrepreneurNic = json['entrepreneurNic'];
    _isSync = json['isSync'];
    _localId = json['localId'];
    _lts = json['lts'] != null ? Lts.fromJson(json['lts']) : null;
    _natureId = json['natureId'];
  }
  String _businessId;
  int _businessType;
  String _category;
  String _entrepreneurNic;
  int _isSync;
  String _localId;
  Lts _lts;
  String _natureId;

  String get businessId => _businessId;
  int get businessType => _businessType;
  String get category => _category;
  String get entrepreneurNic => _entrepreneurNic;
  int get isSync => _isSync;
  String get localId => _localId;
  Lts get lts => _lts;
  String get natureId => _natureId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['businessId'] = _businessId;
    map['businessType'] = _businessType;
    map['category'] = _category;
    map['entrepreneurNic'] = _entrepreneurNic;
    map['isSync'] = _isSync;
    map['localId'] = _localId;
    if (_lts != null) {
      map['lts'] = _lts.toJson();
    }
    map['natureId'] = _natureId;
    return map;
  }

}

class Lts {
  Lts({
      int addedtoconvert, 
      int businessid, 
      String describebusiness, 
      int expectedinvestment, 
      String expectedtostart, 
      int isSync, 
      int localId, 
      int natureId, 
      List<ProductServiceCategoryList> productServiceCategoryList, 
      int id, 
      String state, 
      List<TrainingNeedsList> trainingNeedsList,}){
    _addedtoconvert = addedtoconvert;
    _businessid = businessid;
    _describebusiness = describebusiness;
    _expectedinvestment = expectedinvestment;
    _expectedtostart = expectedtostart;
    _isSync = isSync;
    _localId = localId;
    _natureId = natureId;
    _productServiceCategoryList = productServiceCategoryList;
    _id = id;
    _state = state;
    _trainingNeedsList = trainingNeedsList;
}

  Lts.fromJson(dynamic json) {
    _addedtoconvert = json['ADDED_TO_CONVERT'];
    _businessid = json['BUSINESS_ID'];
    _describebusiness = json['DESCRIBE_BUSINESS'];
    _expectedinvestment = json['EXPECTED_INVESTMENT'];
    _expectedtostart = json['EXPECTED_TO_START'];
    _isSync = json['isSync'];
    _localId = json['localId'];
    _natureId = json['natureId'];
    if (json['productServiceCategoryList'] != null) {
      _productServiceCategoryList = [];
      json['productServiceCategoryList'].forEach((v) {
        _productServiceCategoryList.add(ProductServiceCategoryList.fromJson(v));
      });
    }
    _id = json['ID'];
    _state = json['STATE'];
    if (json['trainingNeedsList'] != null) {
      _trainingNeedsList = [];
      json['trainingNeedsList'].forEach((v) {
        _trainingNeedsList.add(TrainingNeedsList.fromJson(v));
      });
    }
  }
  int _addedtoconvert;
  int _businessid;
  String _describebusiness;
  int _expectedinvestment;
  String _expectedtostart;
  int _isSync;
  int _localId;
  int _natureId;
  List<ProductServiceCategoryList> _productServiceCategoryList;
  int _id;
  String _state;
  List<TrainingNeedsList> _trainingNeedsList;

  int get addedtoconvert => _addedtoconvert;
  int get businessid => _businessid;
  String get describebusiness => _describebusiness;
  int get expectedinvestment => _expectedinvestment;
  String get expectedtostart => _expectedtostart;
  int get isSync => _isSync;
  int get localId => _localId;
  int get natureId => _natureId;
  List<ProductServiceCategoryList> get productServiceCategoryList => _productServiceCategoryList;
  int get id => _id;
  String get state => _state;
  List<TrainingNeedsList> get trainingNeedsList => _trainingNeedsList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ADDED_TO_CONVERT'] = _addedtoconvert;
    map['BUSINESS_ID'] = _businessid;
    map['DESCRIBE_BUSINESS'] = _describebusiness;
    map['EXPECTED_INVESTMENT'] = _expectedinvestment;
    map['EXPECTED_TO_START'] = _expectedtostart;
    map['isSync'] = _isSync;
    map['localId'] = _localId;
    map['natureId'] = _natureId;
    if (_productServiceCategoryList != null) {
      map['productServiceCategoryList'] = _productServiceCategoryList.map((v) => v.toJson()).toList();
    }
    map['ID'] = _id;
    map['STATE'] = _state;
    if (_trainingNeedsList != null) {
      map['trainingNeedsList'] = _trainingNeedsList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class TrainingNeedsList {
  TrainingNeedsList({
      String bussinessId, 
      int businessType, 
      String id, 
      int isSync, 
      String localId, 
      String refno, 
      String trainingDescription, 
      String trainingNeedId,}){
    _bussinessId = bussinessId;
    _businessType = businessType;
    _id = id;
    _isSync = isSync;
    _localId = localId;
    _refno = refno;
    _trainingDescription = trainingDescription;
    _trainingNeedId = trainingNeedId;
}

  TrainingNeedsList.fromJson(dynamic json) {
    _bussinessId = json['bussiness_id'];
    _businessType = json['businessType'];
    _id = json['id'];
    _isSync = json['isSync'];
    _localId = json['localId'];
    _refno = json['REF_NO'];
    _trainingDescription = json['training_description'];
    _trainingNeedId = json['training_need_id'];
  }
  String _bussinessId;
  int _businessType;
  String _id;
  int _isSync;
  String _localId;
  String _refno;
  String _trainingDescription;
  String _trainingNeedId;

  String get bussinessId => _bussinessId;
  int get businessType => _businessType;
  String get id => _id;
  int get isSync => _isSync;
  String get localId => _localId;
  String get refno => _refno;
  String get trainingDescription => _trainingDescription;
  String get trainingNeedId => _trainingNeedId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bussiness_id'] = _bussinessId;
    map['businessType'] = _businessType;
    map['id'] = _id;
    map['isSync'] = _isSync;
    map['localId'] = _localId;
    map['REF_NO'] = _refno;
    map['training_description'] = _trainingDescription;
    map['training_need_id'] = _trainingNeedId;
    return map;
  }

}

class ProductServiceCategoryList {
  ProductServiceCategoryList({
      String businessId, 
      int businessType, 
      String category, 
      String categorylevel3id, 
      String code, 
      String id, 
      int isSync, 
      String localId, 
      String refno, 
      String status,}){
    _businessId = businessId;
    _businessType = businessType;
    _category = category;
    _categorylevel3id = categorylevel3id;
    _code = code;
    _id = id;
    _isSync = isSync;
    _localId = localId;
    _refno = refno;
    _status = status;
}

  ProductServiceCategoryList.fromJson(dynamic json) {
    _businessId = json['business_id'];
    _businessType = json['businessType'];
    _category = json['CATEGORY'];
    _categorylevel3id = json['CATEGORY_LEVEL_3_ID'];
    _code = json['CODE'];
    _id = json['id'];
    _isSync = json['isSync'];
    _localId = json['localId'];
    _refno = json['REF_NO'];
    _status = json['STATUS'];
  }
  String _businessId;
  int _businessType;
  String _category;
  String _categorylevel3id;
  String _code;
  String _id;
  int _isSync;
  String _localId;
  String _refno;
  String _status;

  String get businessId => _businessId;
  int get businessType => _businessType;
  String get category => _category;
  String get categorylevel3id => _categorylevel3id;
  String get code => _code;
  String get id => _id;
  int get isSync => _isSync;
  String get localId => _localId;
  String get refno => _refno;
  String get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['business_id'] = _businessId;
    map['businessType'] = _businessType;
    map['CATEGORY'] = _category;
    map['CATEGORY_LEVEL_3_ID'] = _categorylevel3id;
    map['CODE'] = _code;
    map['id'] = _id;
    map['isSync'] = _isSync;
    map['localId'] = _localId;
    map['REF_NO'] = _refno;
    map['STATUS'] = _status;
    return map;
  }

}