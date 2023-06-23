 class InsertEntrepreneur {
  InsertEntrepreneur({
      List<BusinessRelatedProblem> businessRelatedProblem, 
      List<CollectedOfficerDetails> collectedOfficerDetails, 
      List<Qualifications> qualifications, 
      String address, 
      String btype, 
      String birthday, 
      String businessrelatedproblemid, 
      String category, 
      String contactno, 
      String contactno2, 
      String districtid, 
      String dsdivisiondivisionid, 
      String educationLevelText, 
      String educationqualificationqualificationid, 
      String email, 
      String enteredofficer, 
      String enteredtime, 
      String entrepreneurshipid, 
      String entrepreneurshiplevelid, 
      List<ExpectedSupport> expectedSupport, 
      String expectedsupportdescribe, 
      String expectedsupportid, 
      String experiancefieldid, 
      String fullname, 
      String gender, 
      String gngndivisionid, 
      String image, 
      String initials, 
      String issameofficer, 
      int isSync, 
      String name, 
      String nic, 
      String officernic, 
      String othernotes, 
      String professionalqualificationid, 
      String professionalqualificationlevelid, 
      String registereddatetime, 
      String state, 
      String title, 
      List<TrainingProgram> trainingProgram, 
      String updatedofficer, 
      String updatedtime, 
      String wayofawareid, 
      String wayOfAwareText,}){
    _businessRelatedProblem = businessRelatedProblem;
    _collectedOfficerDetails = collectedOfficerDetails;
    _qualifications = qualifications;
    _address = address;
    _btype = btype;
    _birthday = birthday;
    _businessrelatedproblemid = businessrelatedproblemid;
    _category = category;
    _contactno = contactno;
    _contactno2 = contactno2;
    _districtid = districtid;
    _dsdivisiondivisionid = dsdivisiondivisionid;
    _educationLevelText = educationLevelText;
    _educationqualificationqualificationid = educationqualificationqualificationid;
    _email = email;
    _enteredofficer = enteredofficer;
    _enteredtime = enteredtime;
    _entrepreneurshipid = entrepreneurshipid;
    _entrepreneurshiplevelid = entrepreneurshiplevelid;
    _expectedSupport = expectedSupport;
    _expectedsupportdescribe = expectedsupportdescribe;
    _expectedsupportid = expectedsupportid;
    _experiancefieldid = experiancefieldid;
    _fullname = fullname;
    _gender = gender;
    _gngndivisionid = gngndivisionid;
    _image = image;
    _initials = initials;
    _issameofficer = issameofficer;
    _isSync = isSync;
    _name = name;
    _nic = nic;
    _officernic = officernic;
    _othernotes = othernotes;
    _professionalqualificationid = professionalqualificationid;
    _professionalqualificationlevelid = professionalqualificationlevelid;
    _registereddatetime = registereddatetime;
    _state = state;
    _title = title;
    _trainingProgram = trainingProgram;
    _updatedofficer = updatedofficer;
    _updatedtime = updatedtime;
    _wayofawareid = wayofawareid;
    _wayOfAwareText = wayOfAwareText;
}

  InsertEntrepreneur.fromJson(dynamic json) {
    if (json['BusinessRelatedProblem'] != null) {
      _businessRelatedProblem = [];
      json['BusinessRelatedProblem'].forEach((v) {
        _businessRelatedProblem.add(BusinessRelatedProblem.fromJson(v));
      });
    }
    if (json['CollectedOfficerDetails'] != null) {
      _collectedOfficerDetails = [];
      json['CollectedOfficerDetails'].forEach((v) {
        _collectedOfficerDetails.add(CollectedOfficerDetails.fromJson(v));
      });
    }
    if (json['Qualifications'] != null) {
      _qualifications = [];
      json['Qualifications'].forEach((v) {
        _qualifications.add(Qualifications.fromJson(v));
      });
    }
    _address = json['ADDRESS'];
    _btype = json['B_TYPE'];
    _birthday = json['BIRTHDAY'];
    _businessrelatedproblemid = json['BUSINESS_RELATED_PROBLEM_ID'];
    _category = json['CATEGORY'];
    _contactno = json['CONTACT_NO'];
    _contactno2 = json['CONTACT_NO2'];
    _districtid = json['DISTRICT_ID'];
    _dsdivisiondivisionid = json['DS_DIVISION_DIVISION_ID'];
    _educationLevelText = json['education_level_text'];
    _educationqualificationqualificationid = json['EDUCATION_QUALIFICATION_QUALIFICATION_ID'];
    _email = json['EMAIL'];
    _enteredofficer = json['ENTERED_OFFICER'];
    _enteredtime = json['ENTERED_TIME'];
    _entrepreneurshipid = json['ENTREPRENEURSHIP_ID'];
    _entrepreneurshiplevelid = json['ENTREPRENEURSHIP_LEVEL_ID'];
    if (json['ExpectedSupport'] != null) {
      _expectedSupport = [];
      json['ExpectedSupport'].forEach((v) {
        _expectedSupport.add(ExpectedSupport.fromJson(v));
      });
    }
    _expectedsupportdescribe = json['EXPECTED_SUPPORT_DESCRIBE'];
    _expectedsupportid = json['EXPECTED_SUPPORT_ID'];
    _experiancefieldid = json['EXPERIANCE_FIELD_ID'];
    _fullname = json['FULLNAME'];
    _gender = json['GENDER'];
    _gngndivisionid = json['GN_GN_DIVISION_ID'];
    _image = json['IMAGE'];
    _initials = json['INITIALS'];
    _issameofficer = json['issameofficer'];
    _isSync = json['isSync'];
    _name = json['NAME'];
    _nic = json['NIC'];
    _officernic = json['OFFICER_NIC'];
    _othernotes = json['OTHER_NOTES'];
    _professionalqualificationid = json['PROFESSIONAL_QUALIFICATION_ID'];
    _professionalqualificationlevelid = json['PROFESSIONAL_QUALIFICATION_LEVEL_ID'];
    _registereddatetime = json['REGISTERED_DATE_TIME'];
    _state = json['STATE'];
    _title = json['TITLE'];
    if (json['TrainingProgram'] != null) {
      _trainingProgram = [];
      json['TrainingProgram'].forEach((v) {
        _trainingProgram.add(TrainingProgram.fromJson(v));
      });
    }
    _updatedofficer = json['UPDATED_OFFICER'];
    _updatedtime = json['UPDATED_TIME'];
    _wayofawareid = json['WAY_OF_AWARE_ID'];
    _wayOfAwareText = json['way_of_aware_text'];
  }

  List<BusinessRelatedProblem> _businessRelatedProblem;
  List<CollectedOfficerDetails> _collectedOfficerDetails;
  List<Qualifications> _qualifications;
  String _address;
  String _btype;
  String _birthday;
  String _businessrelatedproblemid;
  String _category;
  String _contactno;
  String _contactno2;
  String _districtid;
  String _dsdivisiondivisionid;
  String _educationLevelText;
  String _educationqualificationqualificationid;
  String _email;
  String _enteredofficer;
  String _enteredtime;
  String _entrepreneurshipid;
  String _entrepreneurshiplevelid;
  List<ExpectedSupport> _expectedSupport;
  String _expectedsupportdescribe;
  String _expectedsupportid;
  String _experiancefieldid;
  String _fullname;
  String _gender;
  String _gngndivisionid;
  String _image;
  String _initials;
  String _issameofficer;
  int _isSync;
  String _name;
  String _nic;
  String _officernic;
  String _othernotes;
  String _professionalqualificationid;
  String _professionalqualificationlevelid;
  String _registereddatetime;
  String _state;
  String _title;
  List<TrainingProgram> _trainingProgram;
  String _updatedofficer;
  String _updatedtime;
  String _wayofawareid;
  String _wayOfAwareText;

  List<BusinessRelatedProblem> get businessRelatedProblem => _businessRelatedProblem;
  List<CollectedOfficerDetails> get collectedOfficerDetails => _collectedOfficerDetails;
  List<Qualifications> get qualifications => _qualifications;
  String get address => _address;
  String get btype => _btype;
  String get birthday => _birthday;
  String get businessrelatedproblemid => _businessrelatedproblemid;
  String get category => _category;
  String get contactno => _contactno;
  String get contactno2 => _contactno2;
  String get districtid => _districtid;
  String get dsdivisiondivisionid => _dsdivisiondivisionid;
  String get educationLevelText => _educationLevelText;
  String get educationqualificationqualificationid => _educationqualificationqualificationid;
  String get email => _email;
  String get enteredofficer => _enteredofficer;
  String get enteredtime => _enteredtime;
  String get entrepreneurshipid => _entrepreneurshipid;
  String get entrepreneurshiplevelid => _entrepreneurshiplevelid;
  List<ExpectedSupport> get expectedSupport => _expectedSupport;
  String get expectedsupportdescribe => _expectedsupportdescribe;
  String get expectedsupportid => _expectedsupportid;
  String get experiancefieldid => _experiancefieldid;
  String get fullname => _fullname;
  String get gender => _gender;
  String get gngndivisionid => _gngndivisionid;
  String get image => _image;
  String get initials => _initials;
  String get issameofficer => _issameofficer;
  int get isSync => _isSync;
  String get name => _name;
  String get nic => _nic;
  String get officernic => _officernic;
  String get othernotes => _othernotes;
  String get professionalqualificationid => _professionalqualificationid;
  String get professionalqualificationlevelid => _professionalqualificationlevelid;
  String get registereddatetime => _registereddatetime;
  String get state => _state;
  String get title => _title;
  List<TrainingProgram> get trainingProgram => _trainingProgram;
  String get updatedofficer => _updatedofficer;
  String get updatedtime => _updatedtime;
  String get wayofawareid => _wayofawareid;
  String get wayOfAwareText => _wayOfAwareText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_businessRelatedProblem != null) {
      map['BusinessRelatedProblem'] = _businessRelatedProblem.map((v) => v.toJson()).toList();
    }
    if (_collectedOfficerDetails != null) {
      map['CollectedOfficerDetails'] = _collectedOfficerDetails.map((v) => v.toJson()).toList();
    }
    if (_qualifications != null) {
      map['Qualifications'] = _qualifications.map((v) => v.toJson()).toList();
    }
    map['ADDRESS'] = _address;
    map['B_TYPE'] = _btype;
    map['BIRTHDAY'] = _birthday;
    map['BUSINESS_RELATED_PROBLEM_ID'] = _businessrelatedproblemid;
    map['CATEGORY'] = _category;
    map['CONTACT_NO'] = _contactno;
    map['CONTACT_NO2'] = _contactno2;
    map['DISTRICT_ID'] = _districtid;
    map['DS_DIVISION_DIVISION_ID'] = _dsdivisiondivisionid;
    map['education_level_text'] = _educationLevelText;
    map['EDUCATION_QUALIFICATION_QUALIFICATION_ID'] = _educationqualificationqualificationid;
    map['EMAIL'] = _email;
    map['ENTERED_OFFICER'] = _enteredofficer;
    map['ENTERED_TIME'] = _enteredtime;
    map['ENTREPRENEURSHIP_ID'] = _entrepreneurshipid;
    map['ENTREPRENEURSHIP_LEVEL_ID'] = _entrepreneurshiplevelid;
    if (_expectedSupport != null) {
      map['ExpectedSupport'] = _expectedSupport.map((v) => v.toJson()).toList();
    }
    map['EXPECTED_SUPPORT_DESCRIBE'] = _expectedsupportdescribe;
    map['EXPECTED_SUPPORT_ID'] = _expectedsupportid;
    map['EXPERIANCE_FIELD_ID'] = _experiancefieldid;
    map['FULLNAME'] = _fullname;
    map['GENDER'] = _gender;
    map['GN_GN_DIVISION_ID'] = _gngndivisionid;
    map['IMAGE'] = _image;
    map['INITIALS'] = _initials;
    map['issameofficer'] = _issameofficer;
    map['isSync'] = _isSync;
    map['NAME'] = _name;
    map['NIC'] = _nic;
    map['OFFICER_NIC'] = _officernic;
    map['OTHER_NOTES'] = _othernotes;
    map['PROFESSIONAL_QUALIFICATION_ID'] = _professionalqualificationid;
    map['PROFESSIONAL_QUALIFICATION_LEVEL_ID'] = _professionalqualificationlevelid;
    map['REGISTERED_DATE_TIME'] = _registereddatetime;
    map['STATE'] = _state;
    map['TITLE'] = _title;
    if (_trainingProgram != null) {
      map['TrainingProgram'] = _trainingProgram.map((v) => v.toJson()).toList();
    }
    map['UPDATED_OFFICER'] = _updatedofficer;
    map['UPDATED_TIME'] = _updatedtime;
    map['WAY_OF_AWARE_ID'] = _wayofawareid;
    map['way_of_aware_text'] = _wayOfAwareText;
    return map;
  }

}

class TrainingProgram {
  TrainingProgram({
      String id, 
      int isSync, 
      String localId, 
      String nic, 
      String trnFlw, 
      String trnFlwId,}){
    _id = id;
    _isSync = isSync;
    _localId = localId;
    _nic = nic;
    _trnFlw = trnFlw;
    _trnFlwId = trnFlwId;
}

  TrainingProgram.fromJson(dynamic json) {
    _id = json['id'];
    _isSync = json['isSync'];
    _localId = json['localId'];
    _nic = json['NIC'];
    _trnFlw = json['trn_flw'];
    _trnFlwId = json['trn_flw_id'];
  }
  String _id;
  int _isSync;
  String _localId;
  String _nic;
  String _trnFlw;
  String _trnFlwId;

  String get id => _id;
  int get isSync => _isSync;
  String get localId => _localId;
  String get nic => _nic;
  String get trnFlw => _trnFlw;
  String get trnFlwId => _trnFlwId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['isSync'] = _isSync;
    map['localId'] = _localId;
    map['NIC'] = _nic;
    map['trn_flw'] = _trnFlw;
    map['trn_flw_id'] = _trnFlwId;
    return map;
  }

}

class ExpectedSupport {
  ExpectedSupport({
      String expSupport, 
      String expSupportId, 
      String id, 
      int isSync, 
      String localId, 
      String nic,}){
    _expSupport = expSupport;
    _expSupportId = expSupportId;
    _id = id;
    _isSync = isSync;
    _localId = localId;
    _nic = nic;
}

  ExpectedSupport.fromJson(dynamic json) {
    _expSupport = json['exp_support'];
    _expSupportId = json['exp_support_id'];
    _id = json['id'];
    _isSync = json['isSync'];
    _localId = json['localId'];
    _nic = json['NIC'];
  }
  String _expSupport;
  String _expSupportId;
  String _id;
  int _isSync;
  String _localId;
  String _nic;

  String get expSupport => _expSupport;
  String get expSupportId => _expSupportId;
  String get id => _id;
  int get isSync => _isSync;
  String get localId => _localId;
  String get nic => _nic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['exp_support'] = _expSupport;
    map['exp_support_id'] = _expSupportId;
    map['id'] = _id;
    map['isSync'] = _isSync;
    map['localId'] = _localId;
    map['NIC'] = _nic;
    return map;
  }

}

class Qualifications {
  Qualifications({
      String entrepreneurnic, 
      String id, 
      int isSync, 
      String localId, 
      String proLvl, 
      String proQulifi, 
      String professionalqualificationlevelid,}){
    _entrepreneurnic = entrepreneurnic;
    _id = id;
    _isSync = isSync;
    _localId = localId;
    _proLvl = proLvl;
    _proQulifi = proQulifi;
    _professionalqualificationlevelid = professionalqualificationlevelid;
}

  Qualifications.fromJson(dynamic json) {
    _entrepreneurnic = json['ENTREPRENEUR_NIC'];
    _id = json['ID'];
    _isSync = json['isSync'];
    _localId = json['localId'];
    _proLvl = json['pro_lvl'];
    _proQulifi = json['pro_qulifi'];
    _professionalqualificationlevelid = json['PROFESSIONAL_QUALIFICATION_LEVEL_ID'];
  }
  String _entrepreneurnic;
  String _id;
  int _isSync;
  String _localId;
  String _proLvl;
  String _proQulifi;
  String _professionalqualificationlevelid;

  String get entrepreneurnic => _entrepreneurnic;
  String get id => _id;
  int get isSync => _isSync;
  String get localId => _localId;
  String get proLvl => _proLvl;
  String get proQulifi => _proQulifi;
  String get professionalqualificationlevelid => _professionalqualificationlevelid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ENTREPRENEUR_NIC'] = _entrepreneurnic;
    map['ID'] = _id;
    map['isSync'] = _isSync;
    map['localId'] = _localId;
    map['pro_lvl'] = _proLvl;
    map['pro_qulifi'] = _proQulifi;
    map['PROFESSIONAL_QUALIFICATION_LEVEL_ID'] = _professionalqualificationlevelid;
    return map;
  }

}

class CollectedOfficerDetails {
  CollectedOfficerDetails({
      int isSync, 
      String cofficerdesignation, 
      String cofficer, 
      String cofficernic,}){
    _isSync = isSync;
    _cofficerdesignation = cofficerdesignation;
    _cofficer = cofficer;
    _cofficernic = cofficernic;
}

  CollectedOfficerDetails.fromJson(dynamic json) {
    _isSync = json['isSync'];
    _cofficerdesignation = json['C_OFFICER_DESIGNATION'];
    _cofficer = json['C_OFFICER'];
    _cofficernic = json['C_OFFICER_NIC'];
  }
  int _isSync;
  String _cofficerdesignation;
  String _cofficer;
  String _cofficernic;

  int get isSync => _isSync;
  String get cofficerdesignation => _cofficerdesignation;
  String get cofficer => _cofficer;
  String get cofficernic => _cofficernic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isSync'] = _isSync;
    map['C_OFFICER_DESIGNATION'] = _cofficerdesignation;
    map['C_OFFICER'] = _cofficer;
    map['C_OFFICER_NIC'] = _cofficernic;
    return map;
  }

}

class BusinessRelatedProblem {
  BusinessRelatedProblem({
      String businessrelatedproblemid, 
      String entrepreneurnic, 
      String id, 
      int isSync, 
      String localId,}){
    _businessrelatedproblemid = businessrelatedproblemid;
    _entrepreneurnic = entrepreneurnic;
    _id = id;
    _isSync = isSync;
    _localId = localId;
}

  BusinessRelatedProblem.fromJson(dynamic json) {
    _businessrelatedproblemid = json['BUSINESS_RELATED_PROBLEM_ID'];
    _entrepreneurnic = json['ENTREPRENEUR_NIC'];
    _id = json['id'];
    _isSync = json['isSync'];
    _localId = json['localId'];
  }
  String _businessrelatedproblemid;
  String _entrepreneurnic;
  String _id;
  int _isSync;
  String _localId;

  String get businessrelatedproblemid => _businessrelatedproblemid;
  String get entrepreneurnic => _entrepreneurnic;
  String get id => _id;
  int get isSync => _isSync;
  String get localId => _localId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BUSINESS_RELATED_PROBLEM_ID'] = _businessrelatedproblemid;
    map['ENTREPRENEUR_NIC'] = _entrepreneurnic;
    map['id'] = _id;
    map['isSync'] = _isSync;
    map['localId'] = _localId;
    return map;
  }

}