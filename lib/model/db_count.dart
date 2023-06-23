final String tableDbCount = 'Counts';

class DbCountDataFields {

  static final String id = 'id';
  static final String COL_COUNTS_DISTRICTCOUNT = "DistrictCount";
  static final String COL_COUNTS_DSDIVISIONCOUNT = "DsDivisionCount";
  static final String COL_COUNTS_GNDIVISIONCOUNT = "GnDivisionCount";
  static final String COL_COUNTS_EDUCATIONQUALIFICATIONCOUNT = "EducationQualificationCount";
  static final String COL_COUNTS_PROFESSIONALQUALIFICATIONCOUNT = "ProfessionalQualificationCount";
  static final String COL_COUNTS_PROFESSIONALQUALIFICATIONLEVELCOUNT = "ProfessionalQualificationLevelCount";
  static final String COL_COUNTS_BUSINESSEXPERIENCECOUNT = "BusinessExperienceCount";
  static final String COL_COUNTS_EXPECTEDSUPPORTCOUNT = "ExpectedSupportCount";
  static final String COL_COUNTS_BUSINESSRELATEDPROBLEMCOUNT = "BusinessRelatedProblemCount";
  static final String COL_COUNTS_PRODUCTNATURECOUNT = "ProductNatureCount";
  static final String COL_COUNTS_PRODUCTSERVICECATEGORYCOUNT = "ProductServiceCategoryCount";
  static final String COL_COUNTS_TRAININGNEEDSCOUNT = "TrainingNeedsCount";
  static final String COL_COUNTS_ENTREPRENEURSCOUNT = "EntrepreneursCount";
  static final String COL_COUNTS_ENTREPRENEURMAINPROSERCOUNT = "EntrepreneurMainProductServiceCount";
  static final String COL_COUNTS_ENTREPRENEURPROSERCOUNT = "EntrepreneurProductServiceCount";
  static final String COL_COUNTS_BUSINESSCOUNT = "BusinessCount";
  static final String COL_COUNTS_HAVEABUSINESSCOUNT = "HaveABusinessCount";
  static final String COL_COUNTS_LIKETOSTARTBUSINESSCOUNT = "LikeToStartBusinessCount";
  static final String COL_COUNTS_ENTREPRENEURTRAININGNEEDCOUNT = "EntrepreneurTrainingNeedCount";

}

class DbCount {
  int id;
  int districtCount;
  int dsDivisionCount;
  int gnDivisionCount;
  int educationQualificationCount;
  int professionalQualificationCount;
  int professionalQualificationLevelCount;
  int businessExperienceCount;
  int expectedSupportCount;
  int businessRelatedProblemCount;
  int productNatureCount;
  int productServiceCategoryCount;
  int trainingNeedsCount;
  int entrepreneurCount;
  int entrepreneurMainProSerCount;
  int entrepreneurProSerCount;
  int entrepreneurTrainingNeedCount;
  int businessCount;
  int haveABusinessCount;
  int likeToStartBusinessCount;


  DbCount({
      this.id,
      this.districtCount,
      this.dsDivisionCount,
      this.gnDivisionCount,
      this.educationQualificationCount,
      this.professionalQualificationCount,
      this.professionalQualificationLevelCount,
      this.businessExperienceCount,
      this.expectedSupportCount,
      this.businessRelatedProblemCount,
      this.productNatureCount,
      this.productServiceCategoryCount,
      this.trainingNeedsCount,
      this.entrepreneurCount,
      this.entrepreneurMainProSerCount,
      this.entrepreneurProSerCount,
      this.entrepreneurTrainingNeedCount,
      this.businessCount,
      this.haveABusinessCount,
      this.likeToStartBusinessCount});

  DbCount copy({
    int id,
    int districtCount,
    int dsDivisionCount,
    int gnDivisionCount,
    int educationQualificationCount,
    int professionalQualificationCount,
    int professionalQualificationLevelCount,
    int businessExperienceCount,
    int expectedSupportCount,
    int businessRelatedProblemCount,
    int productNatureCount,
    int productServiceCategoryCount,
    int trainingNeedsCount,
    int entrepreneurCount,
    int entrepreneurMainProSerCount,
    int entrepreneurProSerCount,
    int entrepreneurTrainingNeedCount,
    int businessCount,
    int haveABusinessCount,
    int likeToStartBusinessCount,
  }) => DbCount(
    id: id ?? this.id,
    districtCount: districtCount ?? this.districtCount,
    dsDivisionCount: dsDivisionCount ?? this.dsDivisionCount,
    gnDivisionCount: gnDivisionCount ?? this.gnDivisionCount,
    educationQualificationCount: educationQualificationCount ?? this.educationQualificationCount,
    professionalQualificationCount: professionalQualificationCount ?? this.professionalQualificationCount,
    professionalQualificationLevelCount: professionalQualificationLevelCount ?? this.professionalQualificationLevelCount,
    businessExperienceCount: businessExperienceCount ?? this.businessExperienceCount,
    expectedSupportCount: expectedSupportCount ?? this.expectedSupportCount,
    businessRelatedProblemCount: businessRelatedProblemCount ?? this.businessRelatedProblemCount,
    productNatureCount: productNatureCount ?? this.productNatureCount,
    productServiceCategoryCount: productServiceCategoryCount ?? this.productServiceCategoryCount,
    trainingNeedsCount: trainingNeedsCount ?? this.trainingNeedsCount,
    entrepreneurCount: entrepreneurCount ?? this.entrepreneurCount,
    entrepreneurMainProSerCount: entrepreneurMainProSerCount ?? this.entrepreneurMainProSerCount,
    entrepreneurProSerCount: entrepreneurProSerCount ?? this.entrepreneurProSerCount,
    entrepreneurTrainingNeedCount: entrepreneurTrainingNeedCount ?? this.entrepreneurTrainingNeedCount,
    businessCount: businessCount ?? this.businessCount,
    haveABusinessCount: haveABusinessCount ?? this.haveABusinessCount,
    likeToStartBusinessCount: likeToStartBusinessCount ?? this.likeToStartBusinessCount,
  );





  DbCount.fromJson (Map<String,dynamic> json) {
    districtCount= json['DATA']['DistrictCount'];
    dsDivisionCount= json['DATA']['DsDivisionCount'];
    gnDivisionCount= json['DATA']['GnDivisionCount'];
    educationQualificationCount= json['DATA']['EducationQualificationCount'];
    professionalQualificationCount= json['DATA']['ProfesionalQualificationCount'];
    professionalQualificationLevelCount= json['DATA']['ProfessionalQulificatioLevelount'];
    businessExperienceCount= json['DATA']['ExperienceFieldCount'];
    expectedSupportCount= json['DATA']['ExpectedSuportSEDCount'];
    businessRelatedProblemCount= int.parse(json['DATA']['BusinessRelatedProblemCount']);
    productNatureCount= json['DATA']['NatureofProductCount'];
    productServiceCategoryCount= json['DATA']['PrductServiceCategoryCount'];
    trainingNeedsCount= int.parse(json['DATA']['TrainingNeedsCount']);
    entrepreneurCount= json['DATA']['AllEntrepreneurCount'];
    entrepreneurMainProSerCount= json['DATA']['AllMainProductUploadedCount'];
    entrepreneurProSerCount= json['DATA']['AllPRODUCT_SERVICE_CATEGORY_Count'];
    entrepreneurTrainingNeedCount= json['DATA']['AllTRAINING_NEEDS_Count'];
    businessCount= int.parse(json['DATA']['BusinessDetailsCount']);
    haveABusinessCount= int.parse(json['DATA']['HaveABusinessCount']);
    likeToStartBusinessCount= json['DATA']['AllLSCount'];
  }

  Map<String, Object> toJson() =>{
    DbCountDataFields.COL_COUNTS_DISTRICTCOUNT: districtCount,
    DbCountDataFields.COL_COUNTS_DSDIVISIONCOUNT: dsDivisionCount ,
    DbCountDataFields.COL_COUNTS_GNDIVISIONCOUNT: gnDivisionCount ,
    DbCountDataFields.COL_COUNTS_EDUCATIONQUALIFICATIONCOUNT: educationQualificationCount ,
    DbCountDataFields.COL_COUNTS_PROFESSIONALQUALIFICATIONCOUNT: professionalQualificationCount ,
    DbCountDataFields.COL_COUNTS_PROFESSIONALQUALIFICATIONLEVELCOUNT: professionalQualificationLevelCount ,
    DbCountDataFields.COL_COUNTS_BUSINESSEXPERIENCECOUNT: businessExperienceCount ,
    DbCountDataFields.COL_COUNTS_EXPECTEDSUPPORTCOUNT: expectedSupportCount ,
    DbCountDataFields.COL_COUNTS_BUSINESSRELATEDPROBLEMCOUNT: businessRelatedProblemCount ,
    DbCountDataFields.COL_COUNTS_PRODUCTNATURECOUNT: productNatureCount ,
    DbCountDataFields.COL_COUNTS_PRODUCTSERVICECATEGORYCOUNT: productServiceCategoryCount ,
    DbCountDataFields.COL_COUNTS_TRAININGNEEDSCOUNT: trainingNeedsCount ,
    DbCountDataFields.COL_COUNTS_ENTREPRENEURSCOUNT: entrepreneurCount ,
    DbCountDataFields.COL_COUNTS_ENTREPRENEURMAINPROSERCOUNT: entrepreneurMainProSerCount ,
    DbCountDataFields.COL_COUNTS_ENTREPRENEURPROSERCOUNT : entrepreneurProSerCount ,
    DbCountDataFields.COL_COUNTS_BUSINESSCOUNT: businessCount ,
    DbCountDataFields.COL_COUNTS_HAVEABUSINESSCOUNT : haveABusinessCount ,
    DbCountDataFields.COL_COUNTS_LIKETOSTARTBUSINESSCOUNT: likeToStartBusinessCount ,
    DbCountDataFields.COL_COUNTS_ENTREPRENEURTRAININGNEEDCOUNT: entrepreneurTrainingNeedCount ,
  };

  getTotal() {
    int totalCount=0;
    totalCount=districtCount +
        dsDivisionCount +
        gnDivisionCount +
        educationQualificationCount +
        professionalQualificationCount +
        professionalQualificationLevelCount +
        businessExperienceCount +
        expectedSupportCount +
        businessRelatedProblemCount +
        productNatureCount +
        productServiceCategoryCount +
        trainingNeedsCount +
        entrepreneurCount +
        entrepreneurMainProSerCount +
        entrepreneurProSerCount +
        entrepreneurTrainingNeedCount+
        businessCount +
        haveABusinessCount +
        likeToStartBusinessCount;
    return totalCount;
  }





}
