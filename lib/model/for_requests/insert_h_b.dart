
class InsertHB {
  InsertHB({
      String businessId, 
      int businessType, 
      String category, 
      String entrepreneurNic, 
      Hb hb, 
      int isSync, 
      int localId, 
      String natureId,}){
    _businessId = businessId;
    _businessType = businessType;
    _category = category;
    _entrepreneurNic = entrepreneurNic;
    _hb = hb;
    _isSync = isSync;
    _localId = localId;
    _natureId = natureId;
}

  InsertHB.fromJson(dynamic json) {
    _businessId = json['businessId'];
    _businessType = json['businessType'];
    _category = json['category'];
    _entrepreneurNic = json['entrepreneurNic'];
    _hb = json['hb'] != null ? Hb.fromJson(json['hb']) : null;
    _isSync = json['isSync'];
    _localId = json['localId'];
    _natureId = json['natureId'];
  }
  String _businessId;
  int _businessType;
  String _category;
  String _entrepreneurNic;
  Hb _hb;
  int _isSync;
  int _localId;
  String _natureId;

  String get businessId => _businessId;
  int get businessType => _businessType;
  String get category => _category;
  String get entrepreneurNic => _entrepreneurNic;
  Hb get hb => _hb;
  int get isSync => _isSync;
  int get localId => _localId;
  String get natureId => _natureId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['businessId'] = _businessId;
    map['businessType'] = _businessType;
    map['category'] = _category;
    map['entrepreneurNic'] = _entrepreneurNic;
    if (_hb != null) {
      map['hb'] = _hb.toJson();
    }
    map['isSync'] = _isSync;
    map['localId'] = _localId;
    map['natureId'] = _natureId;
    return map;
  }

}

class Hb {
  Hb({
      String address1, 
      String address2, 
      int businessId, 
      String businessName, 
      String businessRegistrationPlace, 
      String contact, 
      int converted, 
      int count, 
      int districtId, 
      String expectedSupport, 
      int haveusinessModalId, 
      int initialInvestment, 
      int isSync, 
      int localId, 
      String mainProduct, 
      List<MainProductServiceList> mainProductServiceList, 
      int natureId, 
      int ownershipId, 
      List<ProductServiceCategoryList> productServiceCategoryList, 
      String registeredDate, 
      String businessRegistration, 
      int id, 
      String startDate, 
      List<TrainingNeedsList> trainingNeedsList,}){
    _address1 = address1;
    _address2 = address2;
    _businessId = businessId;
    _businessName = businessName;
    _businessRegistrationPlace = businessRegistrationPlace;
    _contact = contact;
    _converted = converted;
    _count = count;
    _districtId = districtId;
    _expectedSupport = expectedSupport;
    _haveusinessModalId = haveusinessModalId;
    _initialInvestment = initialInvestment;
    _isSync = isSync;
    _localId = localId;
    _mainProduct = mainProduct;
    _mainProductServiceList = mainProductServiceList;
    _natureId = natureId;
    _ownershipId = ownershipId;
    _productServiceCategoryList = productServiceCategoryList;
    _registeredDate = registeredDate;
    _businessRegistration = businessRegistration;
    _id = id;
    _startDate = startDate;
    _trainingNeedsList = trainingNeedsList;
}

  Hb.fromJson(dynamic json) {
    _address1 = json['address1'];
    _address2 = json['address2'];
    _businessId = json['businessId'];
    _businessName = json['businessName'];
    _businessRegistrationPlace = json['businessRegistrationPlace'];
    _contact = json['contact'];
    _converted = json['converted'];
    _count = json['count'];
    _districtId = json['districtId'];
    _expectedSupport = json['expectedSupport'];
    _haveusinessModalId = json['haveusinessModalId'];
    _initialInvestment = json['initialInvestment'];
    _isSync = json['isSync'];
    _localId = json['localId'];
    _mainProduct = json['mainProduct'];
    if (json['mainProductServiceList'] != null) {
      _mainProductServiceList = [];
      json['mainProductServiceList'].forEach((v) {
        _mainProductServiceList.add(MainProductServiceList.fromJson(v));
      });
    }
    _natureId = json['natureId'];
    _ownershipId = json['ownershipId'];
    if (json['productServiceCategoryList'] != null) {
      _productServiceCategoryList = [];
      json['productServiceCategoryList'].forEach((v) {
        _productServiceCategoryList.add(ProductServiceCategoryList.fromJson(v));
      });
    }
    _registeredDate = json['registeredDate'];
    _businessRegistration = json['businessRegistration'];
    _id = json['id'];
    _startDate = json['startDate'];
    if (json['trainingNeedsList'] != null) {
      _trainingNeedsList = [];
      json['trainingNeedsList'].forEach((v) {
        _trainingNeedsList.add(TrainingNeedsList.fromJson(v));
      });
    }
  }
  String _address1;
  String _address2;
  int _businessId;
  String _businessName;
  String _businessRegistrationPlace;
  String _contact;
  int _converted;
  int _count;
  int _districtId;
  String _expectedSupport;
  int _haveusinessModalId;
  int _initialInvestment;
  int _isSync;
  int _localId;
  String _mainProduct;
  List<MainProductServiceList> _mainProductServiceList;
  int _natureId;
  int _ownershipId;
  List<ProductServiceCategoryList> _productServiceCategoryList;
  String _registeredDate;
  String _businessRegistration;
  int _id;
  String _startDate;
  List<TrainingNeedsList> _trainingNeedsList;

  String get address1 => _address1;
  String get address2 => _address2;
  int get businessId => _businessId;
  String get businessName => _businessName;
  String get businessRegistrationPlace => _businessRegistrationPlace;
  String get contact => _contact;
  int get converted => _converted;
  int get count => _count;
  int get districtId => _districtId;
  String get expectedSupport => _expectedSupport;
  int get haveusinessModalId => _haveusinessModalId;
  int get initialInvestment => _initialInvestment;
  int get isSync => _isSync;
  int get localId => _localId;
  String get mainProduct => _mainProduct;
  List<MainProductServiceList> get mainProductServiceList => _mainProductServiceList;
  int get natureId => _natureId;
  int get ownershipId => _ownershipId;
  List<ProductServiceCategoryList> get productServiceCategoryList => _productServiceCategoryList;
  String get registeredDate => _registeredDate;
  String get businessRegistration => _businessRegistration;
  int get id => _id;
  String get startDate => _startDate;
  List<TrainingNeedsList> get trainingNeedsList => _trainingNeedsList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address1'] = _address1;
    map['address2'] = _address2;
    map['businessId'] = _businessId;
    map['businessName'] = _businessName;
    map['businessRegistrationPlace'] = _businessRegistrationPlace;
    map['contact'] = _contact;
    map['converted'] = _converted;
    map['count'] = _count;
    map['districtId'] = _districtId;
    map['expectedSupport'] = _expectedSupport;
    map['haveusinessModalId'] = _haveusinessModalId;
    map['initialInvestment'] = _initialInvestment;
    map['isSync'] = _isSync;
    map['localId'] = _localId;
    map['mainProduct'] = _mainProduct;
    if (_mainProductServiceList != null) {
      map['mainProductServiceList'] = _mainProductServiceList.map((v) => v.toJson()).toList();
    }
    map['natureId'] = _natureId;
    map['ownershipId'] = _ownershipId;
    if (_productServiceCategoryList != null) {
      map['productServiceCategoryList'] = _productServiceCategoryList.map((v) => v.toJson()).toList();
    }
    map['registeredDate'] = _registeredDate;
    map['businessRegistration'] = _businessRegistration;
    map['id'] = _id;
    map['startDate'] = _startDate;
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

class MainProductServiceList {
  MainProductServiceList({
      String entrepreneurnic, 
      String havemodalid, 
      String id, 
      String imgarr, 
      int isSync, 
      String localId, 
      String mainproductname, 
      String storagefilename, 
      String uploadeddate,}){
    _entrepreneurnic = entrepreneurnic;
    _havemodalid = havemodalid;
    _id = id;
    _imgarr = imgarr;
    _isSync = isSync;
    _localId = localId;
    _mainproductname = mainproductname;
    _storagefilename = storagefilename;
    _uploadeddate = uploadeddate;
}

  MainProductServiceList.fromJson(dynamic json) {
    _entrepreneurnic = json['ENTREPRENEUR_NIC'];
    _havemodalid = json['HAVE_MODAL_ID'];
    _id = json['ID'];
    _imgarr = json['IMG_ARR'];
    _isSync = json['isSync'];
    _localId = json['localId'];
    _mainproductname = json['MAIN_PRODUCT_NAME'];
    _storagefilename = json['STORAGE_FILE_NAME'];
    _uploadeddate = json['UPLOADED_DATE'];
  }
  String _entrepreneurnic;
  String _havemodalid;
  String _id;
  String _imgarr;
  int _isSync;
  String _localId;
  String _mainproductname;
  String _storagefilename;
  String _uploadeddate;

  String get entrepreneurnic => _entrepreneurnic;
  String get havemodalid => _havemodalid;
  String get id => _id;
  String get imgarr => _imgarr;
  int get isSync => _isSync;
  String get localId => _localId;
  String get mainproductname => _mainproductname;
  String get storagefilename => _storagefilename;
  String get uploadeddate => _uploadeddate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ENTREPRENEUR_NIC'] = _entrepreneurnic;
    map['HAVE_MODAL_ID'] = _havemodalid;
    map['ID'] = _id;
    map['IMG_ARR'] = _imgarr;
    map['isSync'] = _isSync;
    map['localId'] = _localId;
    map['MAIN_PRODUCT_NAME'] = _mainproductname;
    map['STORAGE_FILE_NAME'] = _storagefilename;
    map['UPLOADED_DATE'] = _uploadeddate;
    return map;
  }

}