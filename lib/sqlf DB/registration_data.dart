


// class EntrepreneurDataFields {
//
//   static final String id = '_id';
//   static final String COL_ENTREPRENEUR_NIC = "Nic";
//   static final String COL_ENTREPRENEUR_EXPERIANCE_FIELD_ID = "ExperienceFieldId";
//   static final String COL_ENTREPRENEUR_ENTREPRENEURSHIP_LEVEL_ID = "EntrepreneurshipLevelId";
//   static final String COL_ENTREPRENEUR_PROFESSIONAL_QUALIFICATION_LEVEL_ID = "ProfessionalQualificationLevelId";
//   static final String COL_ENTREPRENEUR_ENTREPRENEURSHIP_ID = "EntrepreneurshipId";
//   static final String COL_ENTREPRENEUR_PROFESSIONAL_QUALIFICATION_ID = "ProfessionalQualificationId";
//   static final String COL_ENTREPRENEUR_DS_DIVISION_DIVISION_ID = "DsDivisionDivisionId";
//   static final String COL_ENTREPRENEUR_DISTRICT_ID = "DistrictId";
//   static final String COL_ENTREPRENEUR_EDUCATION_QUALIFICATION_QUALIFICATION_ID = "educationQualificationQualificationId";
//   static final String COL_ENTREPRENEUR_NAME = "Name";
//   static final String COL_ENTREPRENEUR_INITIALS = "Initials";
//   static final String COL_ENTREPRENEUR_ADDRESS = "Address";
//   static final String COL_ENTREPRENEUR_CONTACT_NO = "ContactNo";
//   static final String COL_ENTREPRENEUR_EMAIL = "Email";
//   static final String COL_ENTREPRENEUR_GENDER = "Gender";
//   static final String COL_ENTREPRENEUR_BIRTHDAY = "Birthday";
//   static final String COL_ENTREPRENEUR_CATEGORY = "Category";
//   static final String COL_ENTREPRENEUR_STATE = "State";
//   static final String COL_ENTREPRENEUR_IMAGE = "Image";
//   static final String COL_ENTREPRENEUR_REGISTERED_DATE_TIME = "RegisteredDateTime";
//   static final String COL_ENTREPRENEUR_EXPECTED_SUPPORT_DESCRIBE = "ExpectedSupportDescribe";
//   static final String COL_ENTREPRENEUR_EXPECTED_SUPPORT_ID = "ExpectedSupportId";
//   static final String COL_ENTREPRENEUR_BUSINESS_RELATED_PROBLEM_ID = "BusinessRelatedProblemId";
//   static final String COL_ENTREPRENEUR_OFFICER_NIC = "OfficerNic";
//   static final String COL_ENTREPRENEUR_B_TYPE = "BType";
//   static final String COL_ENTREPRENEUR_EDUCATION_LEVEL_TEXT = "EducationLevelText";
//   static final String COL_ENTREPRENEUR_CONTACT_NO2 = "ContactNo2";
//   static final String COL_ENTREPRENEUR_FULLNAME = "Fullname";
//   static final String COL_ENTREPRENEUR_GN_GN_DIVISION_ID = "GnGnDivisionId";
//   static final String COL_ENTREPRENEUR_ENTERED_OFFICER = "EnteredOfficer";
//   static final String COL_ENTREPRENEUR_UPDATED_OFFICER = "UpdatedOfficer";
//   static final String COL_ENTREPRENEUR_ENTERED_TIME = "EnteredTime";
//   static final String COL_ENTREPRENEUR_UPDATED_TIME = "UpdatedTime";
//   static final String COL_ENTREPRENEUR_WAY_OF_AWARE_ID = "WayOfAwareId";
//   static final String COL_ENTREPRENEUR_WAY_OF_AWARE_TEXT = "WayOfAwareText";
//   static final String COL_ENTREPRENEUR_IS_SAME_OFFICER = "IsSameOfficer";
//   static final String COL_ENTREPRENEUR_OTHER_NOTES = "OtherNotes";
//   static final String COL_ENTREPRENEUR_TITLE = "Title";
//   static final String COL_ENTREPRENEUR_COLLECTED_OFFICER_NAME = "CollectedOfficerName";
//   static final String COL_ENTREPRENEUR_COLLECTED_OFFICER_NIC = "CollectedOfficerNic";
//   static final String COL_ENTREPRENEUR_COLLECTED_OFFICER_DESIGNATION = "CollectedOfficerDesignation";
//   static final String COL_ENTREPRENEUR_IS_SYNC = "IsSync";
//
// }
//
// class EntrepreneurData {
//   int id;
//   String nic;
//   String experienceFieldId;
//   String entrepreneurshipLevelId;
//   String professionalQualificationLevelId;
//   String entrepreneurshipId;
//   String professionalQualificationId;
//   String dsDivisionDivisionId;
//   String districtId;
//   String educationQualificationQualificationId;
//   String name;
//   String initials;
//   String address;
//   String contactNo;
//   String email;
//   String gender;
//   String birthday;
//   String category;
//   String state;
//   String image;
//   String registeredDateTime;
//   String expectedSupportDescribe;
//   String expectedSupportId;
//   String businessRelatedProblemId;
//   String officerNic;
//   String bType;
//   String educationLevelText;
//   String contactNo2;
//   String fullname;
//   String gnGnDivisionId;
//   String enteredOfficer;
//   String updatedOfficer;
//   String enteredTime;
//   String updatedTime;
//   String wayOfAwareId;
//   String wayOfAwareText;
//   String isSameOfficer;
//   String otherNotes;
//   String title;
//   String collectedOfficerName;
//   String collectedOfficerNic;
//   String collectedOfficerDesignation;
//   int isSync;
//
//
//   EntrepreneurData({this.id, this.nic, this.experienceFieldId,
//     this.entrepreneurshipLevelId, this.professionalQualificationLevelId,
//     this.entrepreneurshipId, this.professionalQualificationId,
//     this.dsDivisionDivisionId, this.districtId,
//     this.educationQualificationQualificationId, this.name, this.initials,
//     this.address, this.contactNo, this.email, this.gender, this.birthday,
//     this.category, this.state, this.image, this.registeredDateTime,
//     this.expectedSupportDescribe, this.expectedSupportId,
//     this.businessRelatedProblemId, this.officerNic, this.bType,
//     this.educationLevelText, this.contactNo2, this.fullname,
//     this.gnGnDivisionId, this.enteredOfficer, this.updatedOfficer,
//     this.enteredTime, this.updatedTime, this.wayOfAwareId,
//     this.wayOfAwareText, this.isSameOfficer, this.otherNotes, this.title,
//     this.collectedOfficerName, this.collectedOfficerNic,
//     this.collectedOfficerDesignation, this.isSync});
//
//   EntrepreneurData copy({
//     int id,
//     String nic,
//     String experienceFieldId,
//     String entrepreneurshipLevelId,
//     String professionalQualificationLevelId,
//     String entrepreneurshipId,
//     String professionalQualificationId,
//     String dsDivisionDivisionId,
//     String districtId,
//     String educationQualificationQualificationId,
//     String name,
//     String initials,
//     String address,
//     String contactNo,
//     String email,
//     String gender,
//     String birthday,
//     String category,
//     String state,
//     String image,
//     String registeredDateTime,
//     String expectedSupportDescribe,
//     String expectedSupportId,
//     String businessRelatedProblemId,
//     String officerNic,
//     String bType,
//     String educationLevelText,
//     String contactNo2,
//     String fullname,
//     String gnGnDivisionId,
//     String enteredOfficer,
//     String updatedOfficer,
//     String enteredTime,
//     String updatedTime,
//     String wayOfAwareId,
//     String wayOfAwareText,
//     String isSameOfficer,
//     String otherNotes,
//     String title,
//     String collectedOfficerName,
//     String collectedOfficerNic,
//     String collectedOfficerDesignation,
//     int isSync,
//   }) =>
//       EntrepreneurData(
//         id: id ?? this.id,
//         nic: nic ?? this.nic,
//         experienceFieldId: experienceFieldId ?? this.experienceFieldId,
//         entrepreneurshipLevelId: entrepreneurshipLevelId ?? this.entrepreneurshipLevelId,
//         professionalQualificationLevelId:professionalQualificationLevelId ?? this.professionalQualificationLevelId,
//         entrepreneurshipId:entrepreneurshipId ?? this.entrepreneurshipId,
//         professionalQualificationId:professionalQualificationId ?? this.professionalQualificationId,
//         dsDivisionDivisionId:dsDivisionDivisionId ?? this.dsDivisionDivisionId,
//         districtId:districtId ?? this.districtId,
//         educationQualificationQualificationId:educationQualificationQualificationId ?? this.educationQualificationQualificationId,
//         name:name ?? this.name,
//         initials:initials ?? this.initials,
//         address: address ?? this.address,
//         contactNo: contactNo ?? this.contactNo,
//         email:email ?? this.email,
//         gender:gender ?? this.gender,
//         birthday:birthday ?? this.birthday,
//         category:category ?? this.category,
//         state:state ?? this.state,
//         image:image ?? this.image,
//         registeredDateTime:registeredDateTime ?? this.registeredDateTime,
//         expectedSupportDescribe:expectedSupportDescribe ?? this.registeredDateTime,
//         expectedSupportId:expectedSupportId ?? this.expectedSupportId,
//         businessRelatedProblemId:businessRelatedProblemId ?? this.expectedSupportId,
//         officerNic:officerNic ?? this.officerNic,
//         bType:bType ?? this.bType,
//         educationLevelText:educationLevelText ?? this.educationLevelText,
//         contactNo2:contactNo2 ?? this.contactNo2,
//         fullname:fullname ?? this.fullname,
//         gnGnDivisionId:gnGnDivisionId ?? this.gnGnDivisionId,
//         enteredOfficer:enteredOfficer ?? this.enteredOfficer,
//         updatedOfficer:updatedOfficer ?? this.updatedOfficer,
//         enteredTime:enteredTime ?? this.enteredTime,
//         updatedTime:updatedTime ?? this.updatedTime,
//         wayOfAwareId:wayOfAwareId ?? this.wayOfAwareId,
//         wayOfAwareText:wayOfAwareText ?? this.wayOfAwareText,
//         isSameOfficer:isSameOfficer ?? this.isSameOfficer,
//         otherNotes:otherNotes ?? this.otherNotes,
//         title:title ?? this.title,
//         collectedOfficerName:collectedOfficerName ?? this.collectedOfficerName,
//         collectedOfficerNic:collectedOfficerNic ?? this.collectedOfficerNic,
//         collectedOfficerDesignation:collectedOfficerDesignation ?? this.collectedOfficerDesignation,
//         isSync:isSync ?? this.isSync,
//       );
//
//   Map<String, Object> toJson() =>{
//         EntrepreneurDataFields.id: id ,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_NIC: nic ,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_EXPERIANCE_FIELD_ID: experienceFieldId ,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_ENTREPRENEURSHIP_LEVEL_ID: entrepreneurshipLevelId ,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_PROFESSIONAL_QUALIFICATION_LEVEL_ID:professionalQualificationLevelId,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_ENTREPRENEURSHIP_ID:entrepreneurshipId ,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_PROFESSIONAL_QUALIFICATION_ID:professionalQualificationId,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_DS_DIVISION_DIVISION_ID:dsDivisionDivisionId,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_DISTRICT_ID:districtId,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_EDUCATION_QUALIFICATION_QUALIFICATION_ID:educationQualificationQualificationId,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_NAME:name,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_INITIALS:initials,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_ADDRESS: address,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_CONTACT_NO:contactNo ,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_EMAIL:email,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_GENDER:gender,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_BIRTHDAY:birthday,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_CATEGORY:category,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_STATE:state,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_IMAGE:image,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_REGISTERED_DATE_TIME:registeredDateTime,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_EXPECTED_SUPPORT_DESCRIBE:expectedSupportDescribe,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_EXPECTED_SUPPORT_ID:expectedSupportId,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_BUSINESS_RELATED_PROBLEM_ID:businessRelatedProblemId,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_OFFICER_NIC:officerNic,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_B_TYPE:bType,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_EDUCATION_LEVEL_TEXT:educationLevelText,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_CONTACT_NO2:contactNo2,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_FULLNAME:fullname,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_GN_GN_DIVISION_ID:gnGnDivisionId,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_ENTERED_OFFICER:enteredOfficer,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_UPDATED_OFFICER:updatedOfficer,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_ENTERED_TIME:enteredTime,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_UPDATED_TIME:updatedTime,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_WAY_OF_AWARE_ID:wayOfAwareId,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_WAY_OF_AWARE_TEXT:wayOfAwareText,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_IS_SAME_OFFICER:isSameOfficer,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_OTHER_NOTES:otherNotes ,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_TITLE:title,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_COLLECTED_OFFICER_NAME:collectedOfficerName,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_COLLECTED_OFFICER_NIC:collectedOfficerNic,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_COLLECTED_OFFICER_DESIGNATION:collectedOfficerDesignation,
//         EntrepreneurDataFields.COL_ENTREPRENEUR_IS_SYNC:isSync,
//       };
//
//   static EntrepreneurData fromJson(Map<String, Object>json) =>EntrepreneurData(
//         id: json[EntrepreneurDataFields.id] as int,
//         nic: json[EntrepreneurDataFields.COL_ENTREPRENEUR_NIC] as String,
//         experienceFieldId: json[EntrepreneurDataFields.COL_ENTREPRENEUR_EXPERIANCE_FIELD_ID] as String,
//         entrepreneurshipLevelId: json[EntrepreneurDataFields.COL_ENTREPRENEUR_ENTREPRENEURSHIP_LEVEL_ID] as String,
//         professionalQualificationLevelId: json[EntrepreneurDataFields.COL_ENTREPRENEUR_PROFESSIONAL_QUALIFICATION_LEVEL_ID] as String,
//         entrepreneurshipId: json[EntrepreneurDataFields.COL_ENTREPRENEUR_ENTREPRENEURSHIP_ID] as String,
//         professionalQualificationId: json[EntrepreneurDataFields.COL_ENTREPRENEUR_PROFESSIONAL_QUALIFICATION_ID] as String,
//         dsDivisionDivisionId: json[EntrepreneurDataFields.COL_ENTREPRENEUR_DS_DIVISION_DIVISION_ID] as String,
//         districtId: json[EntrepreneurDataFields.COL_ENTREPRENEUR_DISTRICT_ID] as String,
//         educationQualificationQualificationId: json[EntrepreneurDataFields.COL_ENTREPRENEUR_EDUCATION_QUALIFICATION_QUALIFICATION_ID] as String,
//         name: json[EntrepreneurDataFields.COL_ENTREPRENEUR_NAME] as String,
//         initials: json[EntrepreneurDataFields.COL_ENTREPRENEUR_INITIALS] as String,
//         address: json[EntrepreneurDataFields.COL_ENTREPRENEUR_ADDRESS] as String,
//         contactNo: json[EntrepreneurDataFields.COL_ENTREPRENEUR_CONTACT_NO] as String,
//         email:json[EntrepreneurDataFields.COL_ENTREPRENEUR_EMAIL] as String,
//         gender: json[EntrepreneurDataFields.COL_ENTREPRENEUR_GENDER] as String,
//         birthday: json[EntrepreneurDataFields.COL_ENTREPRENEUR_BIRTHDAY] as String,
//         category: json[EntrepreneurDataFields.COL_ENTREPRENEUR_CATEGORY] as String,
//         state: json[EntrepreneurDataFields.COL_ENTREPRENEUR_STATE] as String,
//         image: json[EntrepreneurDataFields.COL_ENTREPRENEUR_IMAGE] as String,
//         registeredDateTime: json[EntrepreneurDataFields.COL_ENTREPRENEUR_REGISTERED_DATE_TIME] as String,
//         expectedSupportDescribe:json[EntrepreneurDataFields.COL_ENTREPRENEUR_EXPECTED_SUPPORT_DESCRIBE] as String,
//         expectedSupportId: json[EntrepreneurDataFields.COL_ENTREPRENEUR_EXPECTED_SUPPORT_ID] as String,
//         businessRelatedProblemId: json[ EntrepreneurDataFields.COL_ENTREPRENEUR_BUSINESS_RELATED_PROBLEM_ID] as String,
//         officerNic: json[EntrepreneurDataFields.COL_ENTREPRENEUR_OFFICER_NIC] as String,
//         bType: json[EntrepreneurDataFields.COL_ENTREPRENEUR_B_TYPE] as String,
//         educationLevelText: json[EntrepreneurDataFields.COL_ENTREPRENEUR_EDUCATION_LEVEL_TEXT] as String,
//         contactNo2:json[EntrepreneurDataFields.COL_ENTREPRENEUR_CONTACT_NO2] as String,
//         fullname:json[EntrepreneurDataFields.COL_ENTREPRENEUR_FULLNAME] as String,
//         gnGnDivisionId:json[EntrepreneurDataFields.COL_ENTREPRENEUR_GN_GN_DIVISION_ID] as String,
//         enteredOfficer:json[EntrepreneurDataFields.COL_ENTREPRENEUR_ENTERED_OFFICER] as String,
//         updatedOfficer: json[EntrepreneurDataFields.COL_ENTREPRENEUR_UPDATED_OFFICER] as String,
//         enteredTime: json[EntrepreneurDataFields.COL_ENTREPRENEUR_ENTERED_TIME] as String,
//         updatedTime:json[EntrepreneurDataFields.COL_ENTREPRENEUR_UPDATED_TIME] as String,
//         wayOfAwareId: json[EntrepreneurDataFields.COL_ENTREPRENEUR_WAY_OF_AWARE_ID] as String,
//         wayOfAwareText: json[EntrepreneurDataFields.COL_ENTREPRENEUR_WAY_OF_AWARE_TEXT] as String,
//         isSameOfficer: json[EntrepreneurDataFields.COL_ENTREPRENEUR_IS_SAME_OFFICER] as String,
//         otherNotes: json[EntrepreneurDataFields.COL_ENTREPRENEUR_OTHER_NOTES] as String,
//         title: json[EntrepreneurDataFields.COL_ENTREPRENEUR_TITLE] as String,
//         collectedOfficerName:json[EntrepreneurDataFields.COL_ENTREPRENEUR_COLLECTED_OFFICER_NAME] as String,
//         collectedOfficerNic: json[EntrepreneurDataFields.COL_ENTREPRENEUR_COLLECTED_OFFICER_NIC] as String,
//         collectedOfficerDesignation: json[EntrepreneurDataFields.COL_ENTREPRENEUR_COLLECTED_OFFICER_DESIGNATION] as String,
//         isSync: json[EntrepreneurDataFields.COL_ENTREPRENEUR_IS_SYNC] as int,
//
//       );
//
// }
//
