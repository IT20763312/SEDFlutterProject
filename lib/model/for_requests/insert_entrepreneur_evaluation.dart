class InsertEntrepreneurEvaluation {
  InsertEntrepreneurEvaluation({
      int loginId, 
      int accountandRe, 
      int bankSavingACAvailability, 
      int barcode, 
      List<int> branchAvailability, 
      String brandName, 
      int brandRegistration, 
      int businessId, 
      int cashTotalValue, 
      int costingMethodAvailability, 
      int costingMethodRating, 
      int creditorsTotalValue, 
      int customerCare, 
      int debtorsTotalValue, 
      int fbPage, 
      int finalGoodQuality, 
      int finishedStockTotalValue, 
      int furnitureAndFittingsTotalValue, 
      int hrStrategy, 
      int insuranceCover, 
      int issuingAppoinmentLetter, 
      int issuingSalarySlip, 
      int lable, 
      int landAndBuildingTotalValue, 
      int loanObtained, 
      int machinesTotalValue, 
      String marketArea, 
      List<int> marketChannel, 
      String marketStrategy, 
      int monthlyExpenses, 
      int monthlySalesIncomeCat, 
      int motorVehiclesTotalValue, 
      int nameBoard, 
      int noOfNotTrainedEMP, 
      int noOfPaidEmployees, 
      int noOfSalaryReceivedEmployees, 
      int noOfTrainedEMP, 
      int onlineSales, 
      int packing, 
      int payingEpfEtf, 
      int pricingMethod, 
      int pricingMethodRating, 
      int productAppearance, 
      int productionTechnology, 
      int qualityStandard, 
      int raw,
      int rawMaterialStockMaintain, 
      int rawMaterial, 
      int serviceAgreementSiging, 
      int targetCustomer, 
      int totalAssets, 
      int visitingCard, 
      int webSite, 
      String sedOfficerComments,
      int csrActivites, 
      int customerComplains, 
      int hrwelfare, 
      int maintainingServiceManual, 
      int managingCurrentAcount, 
      int marketingObjective, 
      int minimumPhysicalfacility, 
      int otherAssets, 
      int productProcesses, 
      int timeConsuming, 
      int transportfacilities, 
      int visionMission, 
      int salesIncomeNo,}){
    _loginId = loginId;
    _accountandRe = accountandRe;
    _bankSavingACAvailability = bankSavingACAvailability;
    _barcode = barcode;
    _branchAvailability = branchAvailability;
    _brandName = brandName;
    _brandRegistration = brandRegistration;
    _businessId = businessId;
    _cashTotalValue = cashTotalValue;
    _costingMethodAvailability = costingMethodAvailability;
    _costingMethodRating = costingMethodRating;
    _creditorsTotalValue = creditorsTotalValue;
    _customerCare = customerCare;
    _debtorsTotalValue = debtorsTotalValue;
    _fbPage = fbPage;
    _finalGoodQuality = finalGoodQuality;
    _finishedStockTotalValue = finishedStockTotalValue;
    _furnitureAndFittingsTotalValue = furnitureAndFittingsTotalValue;
    _hrStrategy = hrStrategy;
    _insuranceCover = insuranceCover;
    _issuingAppoinmentLetter = issuingAppoinmentLetter;
    _issuingSalarySlip = issuingSalarySlip;
    _lable = lable;
    _landAndBuildingTotalValue = landAndBuildingTotalValue;
    _loanObtained = loanObtained;
    _machinesTotalValue = machinesTotalValue;
    _marketArea = marketArea;
    _marketChannel = marketChannel;
    _marketStrategy = marketStrategy;
    _monthlyExpenses = monthlyExpenses;
    _monthlySalesIncomeCat = monthlySalesIncomeCat;
    _motorVehiclesTotalValue = motorVehiclesTotalValue;
    _nameBoard = nameBoard;
    _noOfNotTrainedEMP = noOfNotTrainedEMP;
    _noOfPaidEmployees = noOfPaidEmployees;
    _noOfSalaryReceivedEmployees = noOfSalaryReceivedEmployees;
    _noOfTrainedEMP = noOfTrainedEMP;
    _onlineSales = onlineSales;
    _packing = packing;
    _payingEpfEtf = payingEpfEtf;
    _pricingMethod = pricingMethod;
    _pricingMethodRating = pricingMethodRating;
    _productAppearance = productAppearance;
    _productionTechnology = productionTechnology;
    _qualityStandard = qualityStandard;
    _rawMaterialQuality = rawMaterialQuality;
    _rawMaterialStockMaintain = rawMaterialStockMaintain;
    _rawMaterial = rawMaterial;
    _serviceAgreementSiging = serviceAgreementSiging;
    _targetCustomer = targetCustomer;
    _totalAssets = totalAssets;
    _visitingCard = visitingCard;
    _webSite = webSite;
    _sedOfficerComments = sedOfficerComments;
    _csrActivites = csrActivites;
    _customerComplains = customerComplains;
    _hrwelfare = hrwelfare;
    _maintainingServiceManual = maintainingServiceManual;
    _managingCurrentAcount = managingCurrentAcount;
    _marketingObjective = marketingObjective;
    _minimumPhysicalfacility = minimumPhysicalfacility;
    _otherAssets = otherAssets;
    _productProcesses = productProcesses;
    _timeConsuming = timeConsuming;
    _transportfacilities = transportfacilities;
    _visionMission = visionMission;
    _salesIncomeNo = salesIncomeNo;
}

  InsertEntrepreneurEvaluation.fromJson(dynamic json) {
    _loginId = json['loginId'];
    _accountandRe = json['accountandRe'];
    _bankSavingACAvailability = json['bankSavingACAvailability'];
    _barcode = json['barcode'];
    _branchAvailability = json['branchAvailability'] != null ? json['branchAvailability'].cast<int>() : [];
    _brandName = json['brandName'];
    _brandRegistration = json['brandRegistration'];
    _businessId = json['business_Id'];
    _cashTotalValue = json['cashTotalValue'];
    _costingMethodAvailability = json['costingMethodAvailability'];
    _costingMethodRating = json['costingMethodRating'];
    _creditorsTotalValue = json['creditorsTotalValue'];
    _customerCare = json['customerCare'];
    _debtorsTotalValue = json['debtorsTotalValue'];
    _fbPage = json['fbPage'];
    _finalGoodQuality = json['finalGoodQuality'];
    _finishedStockTotalValue = json['finishedStockTotalValue'];
    _furnitureAndFittingsTotalValue = json['furnitureAndFittingsTotalValue'];
    _hrStrategy = json['hrStrategy'];
    _insuranceCover = json['insuranceCover'];
    _issuingAppoinmentLetter = json['issuingAppoinmentLetter'];
    _issuingSalarySlip = json['issuingSalarySlip'];
    _lable = json['lable'];
    _landAndBuildingTotalValue = json['landAndBuildingTotalValue'];
    _loanObtained = json['loan_Obtained'];
    _machinesTotalValue = json['machinesTotalValue'];
    _marketArea = json['marketArea'];
    _marketChannel = json['marketChannel'] != null ? json['marketChannel'].cast<int>() : [];
    _marketStrategy = json['marketStrategy'];
    _monthlyExpenses = json['monthlyExpenses'];
    _monthlySalesIncomeCat = json['monthlySalesIncomeCat'];
    _motorVehiclesTotalValue = json['motorVehiclesTotalValue'];
    _nameBoard = json['nameBoard'];
    _noOfNotTrainedEMP = json['noOfNotTrainedEMP'];
    _noOfPaidEmployees = json['noOfPaidEmployees'];
    _noOfSalaryReceivedEmployees = json['noOfSalaryReceivedEmployees'];
    _noOfTrainedEMP = json['noOfTrainedEMP'];
    _onlineSales = json['onlineSales'];
    _packing = json['packing'];
    _payingEpfEtf = json['payingEpfEtf'];
    _pricingMethod = json['pricingMethod'];
    _pricingMethodRating = json['pricingMethodRating'];
    _productAppearance = json['productAppearance'];
    _productionTechnology = json['productionTechnology'];
    _qualityStandard = json['quality_Standard'];
    _rawMaterialQuality = json['rawMaterialQuality'];
    _rawMaterialStockMaintain = json['rawMaterialStockMaintain'];
    _rawMaterial = json['raw_material'];
    _serviceAgreementSiging = json['serviceAgreementSiging'];
    _targetCustomer = json['targetCustomer'];
    _totalAssets = json['totalAssets'];
    _visitingCard = json['visitingCard'];
    _webSite = json['webSite'];
    _sedOfficerComments = json['sedOfficerComments'];
    _csrActivites = json['csrActivites'];
    _customerComplains = json['customerComplains'];
    _hrwelfare = json['hrwelfare'];
    _maintainingServiceManual = json['maintainingServiceManual'];
    _managingCurrentAcount = json['managingCurrentAcount'];
    _marketingObjective = json['marketingObjective'];
    _minimumPhysicalfacility = json['minimumPhysicalfacility'];
    _otherAssets = json['otherAssets'];
    _productProcesses = json['productProcesses'];
    _timeConsuming = json['timeConsuming'];
    _transportfacilities = json['transportfacilities'];
    _visionMission = json['visionMission'];
    _salesIncomeNo = json['salesIncomeNo'];
  }
  int _loginId;
  int _accountandRe;
  int _bankSavingACAvailability;
  int _barcode;
  List<int> _branchAvailability;
  String _brandName;
  int _brandRegistration;
  int _businessId;
  int _cashTotalValue;
  int _costingMethodAvailability;
  int _costingMethodRating;
  int _creditorsTotalValue;
  int _customerCare;
  int _debtorsTotalValue;
  int _fbPage;
  int _finalGoodQuality;
  int _finishedStockTotalValue;
  int _furnitureAndFittingsTotalValue;
  int _hrStrategy;
  int _insuranceCover;
  int _issuingAppoinmentLetter;
  int _issuingSalarySlip;
  int _lable;
  int _landAndBuildingTotalValue;
  int _loanObtained;
  int _machinesTotalValue;
  String _marketArea;
  List<int> _marketChannel;
  String _marketStrategy;
  int _monthlyExpenses;
  int _monthlySalesIncomeCat;
  int _motorVehiclesTotalValue;
  int _nameBoard;
  int _noOfNotTrainedEMP;
  int _noOfPaidEmployees;
  int _noOfSalaryReceivedEmployees;
  int _noOfTrainedEMP;
  int _onlineSales;
  int _packing;
  int _payingEpfEtf;
  int _pricingMethod;
  int _pricingMethodRating;
  int _productAppearance;
  int _productionTechnology;
  int _qualityStandard;
  int _rawMaterialQuality;
  int _rawMaterialStockMaintain;
  int _rawMaterial;
  int _serviceAgreementSiging;
  int _targetCustomer;
  int _totalAssets;
  int _visitingCard;
  int _webSite;
  String _sedOfficerComments;
  int _csrActivites;
  int _customerComplains;
  int _hrwelfare;
  int _maintainingServiceManual;
  int _managingCurrentAcount;
  int _marketingObjective;
  int _minimumPhysicalfacility;
  int _otherAssets;
  int _productProcesses;
  int _timeConsuming;
  int _transportfacilities;
  int _visionMission;
  int _salesIncomeNo;

  int get loginId => _loginId;
  int get accountandRe => _accountandRe;
  int get bankSavingACAvailability => _bankSavingACAvailability;
  int get barcode => _barcode;
  List<int> get branchAvailability => _branchAvailability;
  String get brandName => _brandName;
  int get brandRegistration => _brandRegistration;
  int get businessId => _businessId;
  int get cashTotalValue => _cashTotalValue;
  int get costingMethodAvailability => _costingMethodAvailability;
  int get costingMethodRating => _costingMethodRating;
  int get creditorsTotalValue => _creditorsTotalValue;
  int get customerCare => _customerCare;
  int get debtorsTotalValue => _debtorsTotalValue;
  int get fbPage => _fbPage;
  int get finalGoodQuality => _finalGoodQuality;
  int get finishedStockTotalValue => _finishedStockTotalValue;
  int get furnitureAndFittingsTotalValue => _furnitureAndFittingsTotalValue;
  int get hrStrategy => _hrStrategy;
  int get insuranceCover => _insuranceCover;
  int get issuingAppoinmentLetter => _issuingAppoinmentLetter;
  int get issuingSalarySlip => _issuingSalarySlip;
  int get lable => _lable;
  int get landAndBuildingTotalValue => _landAndBuildingTotalValue;
  int get loanObtained => _loanObtained;
  int get machinesTotalValue => _machinesTotalValue;
  String get marketArea => _marketArea;
  List<int> get marketChannel => _marketChannel;
  String get marketStrategy => _marketStrategy;
  int get monthlyExpenses => _monthlyExpenses;
  int get monthlySalesIncomeCat => _monthlySalesIncomeCat;
  int get motorVehiclesTotalValue => _motorVehiclesTotalValue;
  int get nameBoard => _nameBoard;
  int get noOfNotTrainedEMP => _noOfNotTrainedEMP;
  int get noOfPaidEmployees => _noOfPaidEmployees;
  int get noOfSalaryReceivedEmployees => _noOfSalaryReceivedEmployees;
  int get noOfTrainedEMP => _noOfTrainedEMP;
  int get onlineSales => _onlineSales;
  int get packing => _packing;
  int get payingEpfEtf => _payingEpfEtf;
  int get pricingMethod => _pricingMethod;
  int get pricingMethodRating => _pricingMethodRating;
  int get productAppearance => _productAppearance;
  int get productionTechnology => _productionTechnology;
  int get qualityStandard => _qualityStandard;
  int get rawMaterialQuality => _rawMaterialQuality;
  int get rawMaterialStockMaintain => _rawMaterialStockMaintain;
  int get rawMaterial => _rawMaterial;
  int get serviceAgreementSiging => _serviceAgreementSiging;
  int get targetCustomer => _targetCustomer;
  int get totalAssets => _totalAssets;
  int get visitingCard => _visitingCard;
  int get webSite => _webSite;
  String get sedOfficerComments => _sedOfficerComments;
  int get csrActivites => _csrActivites;
  int get customerComplains => _customerComplains;
  int get hrwelfare => _hrwelfare;
  int get maintainingServiceManual => _maintainingServiceManual;
  int get managingCurrentAcount => _managingCurrentAcount;
  int get marketingObjective => _marketingObjective;
  int get minimumPhysicalfacility => _minimumPhysicalfacility;
  int get otherAssets => _otherAssets;
  int get productProcesses => _productProcesses;
  int get timeConsuming => _timeConsuming;
  int get transportfacilities => _transportfacilities;
  int get visionMission => _visionMission;
  int get salesIncomeNo => _salesIncomeNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['loginId'] = _loginId;
    map['accountandRe'] = _accountandRe;
    map['bankSavingACAvailability'] = _bankSavingACAvailability;
    map['barcode'] = _barcode;
    map['branchAvailability'] = _branchAvailability;
    map['brandName'] = _brandName;
    map['brandRegistration'] = _brandRegistration;
    map['business_Id'] = _businessId;
    map['cashTotalValue'] = _cashTotalValue;
    map['costingMethodAvailability'] = _costingMethodAvailability;
    map['costingMethodRating'] = _costingMethodRating;
    map['creditorsTotalValue'] = _creditorsTotalValue;
    map['customerCare'] = _customerCare;
    map['debtorsTotalValue'] = _debtorsTotalValue;
    map['fbPage'] = _fbPage;
    map['finalGoodQuality'] = _finalGoodQuality;
    map['finishedStockTotalValue'] = _finishedStockTotalValue;
    map['furnitureAndFittingsTotalValue'] = _furnitureAndFittingsTotalValue;
    map['hrStrategy'] = _hrStrategy;
    map['insuranceCover'] = _insuranceCover;
    map['issuingAppoinmentLetter'] = _issuingAppoinmentLetter;
    map['issuingSalarySlip'] = _issuingSalarySlip;
    map['lable'] = _lable;
    map['landAndBuildingTotalValue'] = _landAndBuildingTotalValue;
    map['loan_Obtained'] = _loanObtained;
    map['machinesTotalValue'] = _machinesTotalValue;
    map['marketArea'] = _marketArea;
    map['marketChannel'] = _marketChannel;
    map['marketStrategy'] = _marketStrategy;
    map['monthlyExpenses'] = _monthlyExpenses;
    map['monthlySalesIncomeCat'] = _monthlySalesIncomeCat;
    map['motorVehiclesTotalValue'] = _motorVehiclesTotalValue;
    map['nameBoard'] = _nameBoard;
    map['noOfNotTrainedEMP'] = _noOfNotTrainedEMP;
    map['noOfPaidEmployees'] = _noOfPaidEmployees;
    map['noOfSalaryReceivedEmployees'] = _noOfSalaryReceivedEmployees;
    map['noOfTrainedEMP'] = _noOfTrainedEMP;
    map['onlineSales'] = _onlineSales;
    map['packing'] = _packing;
    map['payingEpfEtf'] = _payingEpfEtf;
    map['pricingMethod'] = _pricingMethod;
    map['pricingMethodRating'] = _pricingMethodRating;
    map['productAppearance'] = _productAppearance;
    map['productionTechnology'] = _productionTechnology;
    map['quality_Standard'] = _qualityStandard;
    map['rawMaterialQuality'] = _rawMaterialQuality;
    map['rawMaterialStockMaintain'] = _rawMaterialStockMaintain;
    map['raw_material'] = _rawMaterial;
    map['serviceAgreementSiging'] = _serviceAgreementSiging;
    map['targetCustomer'] = _targetCustomer;
    map['totalAssets'] = _totalAssets;
    map['visitingCard'] = _visitingCard;
    map['webSite'] = _webSite;
    map['sedOfficerComments'] = _sedOfficerComments;
    map['csrActivites'] = _csrActivites;
    map['customerComplains'] = _customerComplains;
    map['hrwelfare'] = _hrwelfare;
    map['maintainingServiceManual'] = _maintainingServiceManual;
    map['managingCurrentAcount'] = _managingCurrentAcount;
    map['marketingObjective'] = _marketingObjective;
    map['minimumPhysicalfacility'] = _minimumPhysicalfacility;
    map['otherAssets'] = _otherAssets;
    map['productProcesses'] = _productProcesses;
    map['timeConsuming'] = _timeConsuming;
    map['transportfacilities'] = _transportfacilities;
    map['visionMission'] = _visionMission;
    map['salesIncomeNo'] = _salesIncomeNo;
    return map;
  }

}