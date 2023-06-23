import 'package:path/path.dart';
import 'package:sed_project/model/business.dart';
import 'package:sed_project/model/business_experience.dart';
import 'package:sed_project/model/business_registration.dart';
import 'package:sed_project/model/business_related_problem.dart';
import 'package:sed_project/model/db_count.dart';
import 'package:sed_project/model/district.dart';
import 'package:sed_project/model/ds_division.dart';
import 'package:sed_project/model/education_qualification.dart';
import 'package:sed_project/model/entrepreneur_business_related_problem.dart';
import 'package:sed_project/model/entrepreneur_collected_officer.dart';
import 'package:sed_project/model/entrepreneur_details.dart';
import 'package:sed_project/model/entrepreneur_expected_support.dart';
import 'package:sed_project/model/entrepreneur_mainproduct_service.dart';
import 'package:sed_project/model/entrepreneur_product_service.dart';
import 'package:sed_project/model/entrepreneur_qualification.dart';
import 'package:sed_project/model/entrepreneur_training_needs.dart';
import 'package:sed_project/model/entrepreneur_training_program.dart';
import 'package:sed_project/model/expected_support.dart';
import 'package:sed_project/model/gn_division.dart';
import 'package:sed_project/model/have_a_business.dart';
import 'package:sed_project/model/investments.dart';
import 'package:sed_project/model/like_to_start_business.dart';
import 'package:sed_project/model/nature_details.dart';
import 'package:sed_project/model/ownership.dart';
import 'package:sed_project/model/professional_qualification.dart';
import 'package:sed_project/model/professional_qualification_level.dart';
import 'package:sed_project/model/service_category_details.dart';
import 'package:sed_project/model/training_needs.dart';
import 'package:sed_project/model/training_programs_followed.dart';
import 'package:sed_project/model/way_of_aware_sed.dart';
import 'package:sqflite/sqflite.dart';

class EntrepreneurDb {
  static final EntrepreneurDb instance = EntrepreneurDb._init();

  static Database _database;

  EntrepreneurDb._init();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('Entrepreneurs_DB.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT';
    final boolType = 'BOOLEAN';

    await db.execute('''
CREATE TABLE $tableRegistration ( 
    ${EntrepreneurDataFields.id} $idType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_NIC} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_EXPERIANCE_FIELD_ID} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_ENTREPRENEURSHIP_LEVEL_ID} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_PROFESSIONAL_QUALIFICATION_LEVEL_ID} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_ENTREPRENEURSHIP_ID} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_PROFESSIONAL_QUALIFICATION_ID} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_DS_DIVISION_DIVISION_ID} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_DISTRICT_ID} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_EDUCATION_QUALIFICATION_QUALIFICATION_ID} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_NAME} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_INITIALS} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_ADDRESS} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_CONTACT_NO} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_EMAIL} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_GENDER} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_BIRTHDAY} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_CATEGORY} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_STATE} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_IMAGE} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_REGISTERED_DATE_TIME} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_EXPECTED_SUPPORT_DESCRIBE} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_EXPECTED_SUPPORT_ID} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_BUSINESS_RELATED_PROBLEM_ID} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_OFFICER_NIC} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_B_TYPE} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_EDUCATION_LEVEL_TEXT} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_CONTACT_NO2} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_FULLNAME} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_GN_GN_DIVISION_ID} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_ENTERED_OFFICER} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_UPDATED_OFFICER} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_ENTERED_TIME} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_UPDATED_TIME} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_WAY_OF_AWARE_ID} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_WAY_OF_AWARE_TEXT} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_IS_SAME_OFFICER} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_OTHER_NOTES} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_TITLE} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_COLLECTED_OFFICER_NAME} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_COLLECTED_OFFICER_NIC} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_COLLECTED_OFFICER_DESIGNATION} $textType,
    ${EntrepreneurDataFields.COL_ENTREPRENEUR_IS_SYNC} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableDistrict (
    ${DistrictDataFields.id} $idType,
    ${DistrictDataFields.DISTRICT_ID} $textType,
    ${DistrictDataFields.DISTRICT_NAME} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableDsDivisons (
    ${DsDivisionDataFields.id} $idType,
    ${DsDivisionDataFields.DISTRICT_ID} $textType,
    ${DsDivisionDataFields.DIVISION_ID} $textType,
    ${DsDivisionDataFields.DIVISION} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableBusinessExperience (
    ${BusinessExperienceFields.id} $idType,
    ${BusinessExperienceFields.EXPERIENCE_ID} $textType,
    ${BusinessExperienceFields.EXPERIENCE_NAME} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableBusinessRelatedProblem (
    ${BusinessRelatedProblemDataFields.id} $idType,
    ${BusinessRelatedProblemDataFields.PROBLEM_ID} $textType,
    ${BusinessRelatedProblemDataFields.PROBLEM_NAME} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableDbCount (
    ${DbCountDataFields.id} $idType,
    ${DbCountDataFields.COL_COUNTS_DISTRICTCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_DSDIVISIONCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_GNDIVISIONCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_EDUCATIONQUALIFICATIONCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_PROFESSIONALQUALIFICATIONCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_PROFESSIONALQUALIFICATIONLEVELCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_BUSINESSEXPERIENCECOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_EXPECTEDSUPPORTCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_BUSINESSRELATEDPROBLEMCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_PRODUCTNATURECOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_PRODUCTSERVICECATEGORYCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_TRAININGNEEDSCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_ENTREPRENEURSCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_ENTREPRENEURMAINPROSERCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_ENTREPRENEURPROSERCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_BUSINESSCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_HAVEABUSINESSCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_LIKETOSTARTBUSINESSCOUNT} $textType,
    ${DbCountDataFields.COL_COUNTS_ENTREPRENEURTRAININGNEEDCOUNT} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableEducationalQualification (
    ${EducationalQualificationDataFields.id} $idType,
    ${EducationalQualificationDataFields.QUALIFICATION_ID} $textType,
    ${EducationalQualificationDataFields.QUALIFICATION_NAME} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableProfessionalQualification(
    ${ProfessionalQualificationDataFields.id} $idType,
    ${ProfessionalQualificationDataFields.QUALIFICATION_ID} $textType,
    ${ProfessionalQualificationDataFields.QUALIFICATION_NAME} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableGnDivision(
    ${GnDivisionDataFields.dBid} $idType,
     ${GnDivisionDataFields.id} $textType,
    ${GnDivisionDataFields.DS_DIVISION_ID} $textType,
    ${GnDivisionDataFields.GN_DIVISION_NAME} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableExpectedSupport(
    ${ExpectedSupportDataFields.id} $idType,
    ${ExpectedSupportDataFields.SUPPORT_ID} $textType,
    ${ExpectedSupportDataFields.SUPPORT_NAME} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableNatureDetails(
    ${NatureDetailsFields.id} $idType,
    ${NatureDetailsFields.NATURE_ID} $textType,
    ${NatureDetailsFields.NATURE} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableServiceCategoryDetails(
    ${ServiceCategoryDetailsFields.id} $idType,
    ${ServiceCategoryDetailsFields.SERVICE_ID} $textType,
    ${ServiceCategoryDetailsFields.CODE} $textType,
    ${ServiceCategoryDetailsFields.CATEGORY} $textType,
    ${ServiceCategoryDetailsFields.CATEGORY_LEVEL_ID} $textType,
    ${ServiceCategoryDetailsFields.STATUS} $textType

  )
''');

    await db.execute('''
CREATE TABLE $tableTrainingNeeds(
    ${TrainingNeedsFields.id} $idType,
    ${TrainingNeedsFields.ID} $textType,
    ${TrainingNeedsFields.PROGRAMME_NAME} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableBusiness(
    ${BusinessFields.id} $idType,
    ${BusinessFields.BUSINESS_ID} $textType,
    ${BusinessFields.ECONOMIC_CATEGORY_ID} $textType,
    ${BusinessFields.NATURE_ID} $textType,
    ${BusinessFields.PRODUCT_SERVICE_CATEGORY_SERVICE_ID} $textType,
    ${BusinessFields.ENTREPRENEUR_NIC} $textType,
    ${BusinessFields.CATEGORY} $textType,
    ${BusinessFields.EXPECTED_SUPPORT_DESCRIBE} $textType,
    ${BusinessFields.TRAINING_NEEDS_ID} $textType,
    ${BusinessFields.TRAINING_PROGRAMME_ID} $textType,
    ${BusinessFields.REF_NO} $textType,
    ${BusinessFields.BUSINESS_TYPE} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableHaveABusiness(
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_LOCAL_ID} $idType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_SERVER_ID} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_ID} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_DISTRICT_ID} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_MAIN_PRODUCT} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_OWNERSHIP} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_NAME} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_START_DATE} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_CONTACT} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_REGISTRATION} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_EXPECTED_SUPPORT} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_ADDRESS1} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_ADDRESS2} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_INITIAL_INVESTMENT} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_REGISTRATION_DATE} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_REGISTRATION_PLACE} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_NATURE_ID} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_COUNT} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_HAVE_A_BUSINESS_MODAL_ID} $textType,
    ${HaveABusinessFields.COL_HAVE_A_BUSINESS_CONVERTED} $textType             
  )
''');

    await db.execute('''
CREATE TABLE $tableLikeTostart(
    ${LikeToStartFields.COL_LIKE_TO_START_LOCAL_ID} $idType,
    ${LikeToStartFields.COL_LIKE_TO_START_SERVER_ID} $textType,
    ${LikeToStartFields.COL_LIKE_TO_START_BUSINESS_ID} $textType,
    ${LikeToStartFields.COL_LIKE_TO_START_EXPECTED_START} $textType,
    ${LikeToStartFields.COL_LIKE_TO_START_DESCRIBE_BUSINESS} $textType,
    ${LikeToStartFields.COL_LIKE_TO_START_STATE} $textType,
    ${LikeToStartFields.COL_LIKE_TO_START_EXPECTED_INVESTMENT} $textType,
    ${LikeToStartFields.COL_LIKE_TO_START_ADDED_TO_CONVERT} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableProfessionalQualificationLevels(
    ${ProfessionalQualificationLevelFields.DbId} $idType,
    ${ProfessionalQualificationLevelFields.id} $textType,
    ${ProfessionalQualificationLevelFields.PROFESSIONAL_QUALIFICATION_ID} $textType,
    ${ProfessionalQualificationLevelFields.LEVEL_NAME} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableEntrepreneurExpectedSupport(
    ${EntrepreneurExpectedSupportDataFields.LOCAL_ID} $idType,
    ${EntrepreneurExpectedSupportDataFields.SERVER_ID} $textType,
    ${EntrepreneurExpectedSupportDataFields.SUPPORT_NAME} $textType,
    ${EntrepreneurExpectedSupportDataFields.SUPPORT_ID} $textType,
    ${EntrepreneurExpectedSupportDataFields.isSync} $textType,
    ${EntrepreneurExpectedSupportDataFields.Nic} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableEntrepreneurTrainingPrograms(
    ${EntrepreneurTrainingProgramsDataFields.LOCAL_ID} $idType,
    ${EntrepreneurTrainingProgramsDataFields.SERVER_ID} $textType,
    ${EntrepreneurTrainingProgramsDataFields.trnFlw} $textType,
    ${EntrepreneurTrainingProgramsDataFields.trnFlwId} $textType,
    ${EntrepreneurTrainingProgramsDataFields.isSync} $textType,
    ${EntrepreneurTrainingProgramsDataFields.Nic} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableEntrepreneurBusinessRelatedProblem(
    ${EntrepreneurBusinessRelatedProblemDataFields.LOCAL_ID} $idType,
    ${EntrepreneurBusinessRelatedProblemDataFields.SERVER_ID} $textType,
    ${EntrepreneurBusinessRelatedProblemDataFields.BUSINESS_RELATED_PROBLEM_ID} $textType,
    ${EntrepreneurBusinessRelatedProblemDataFields.isSync} $textType,
    ${EntrepreneurBusinessRelatedProblemDataFields.Nic} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableEntrepreneurQualification(
    ${EntrepreneurQualificationDataFields.LOCAL_ID} $idType,
    ${EntrepreneurQualificationDataFields.SERVER_ID} $textType,
    ${EntrepreneurQualificationDataFields.pro_lvl} $textType,
    ${EntrepreneurQualificationDataFields.pro_qulifi} $textType,
    ${EntrepreneurQualificationDataFields.PROFESSIONAL_QUALIFICATION_LEVEL_ID} $textType,
    ${EntrepreneurQualificationDataFields.isSync} $textType,
    ${EntrepreneurQualificationDataFields.Nic} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableEntrepreneurCollectedOfficer(
    ${EntrepreneurCollectedOfficerDataFields.LOCAL_ID} $idType,
    ${EntrepreneurCollectedOfficerDataFields.SERVER_ID} $textType,
    ${EntrepreneurCollectedOfficerDataFields.C_OFFICER} $textType,
    ${EntrepreneurCollectedOfficerDataFields.C_OFFICER_DESIGNATION} $textType,
    ${EntrepreneurCollectedOfficerDataFields.isSync} $textType,
    ${EntrepreneurCollectedOfficerDataFields.C_OFFICER_NIC} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableWayOfAware(
    ${ WayOfAwareFields.id} $idType,
    ${ WayOfAwareFields.ID} $textType,
    ${ WayOfAwareFields.WAY_OF_AWARE} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableTrainingProgramsFollowed(
    ${ TrainingProgramsFollowedFields.id} $idType,
    ${ TrainingProgramsFollowedFields.ID} $textType,
    ${ TrainingProgramsFollowedFields.TRAINING_PROGRAM} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableEntrepreneurProductService(
    ${ EntrepreneurProductServiceFields.LOCAL_ID} $idType,
    ${ EntrepreneurProductServiceFields.SERVER_ID} $textType,
    ${ EntrepreneurProductServiceFields.BUSINESS_ID} $textType,
    ${ EntrepreneurProductServiceFields.CODE} $textType,
    ${ EntrepreneurProductServiceFields.CATEGORY} $textType,
    ${ EntrepreneurProductServiceFields.REFERENCE_NO} $textType,
    ${ EntrepreneurProductServiceFields.CATEGORY_LEVEL3_ID} $textType,
    ${ EntrepreneurProductServiceFields.STATUS} $textType,
    ${ EntrepreneurProductServiceFields.ISSYNC} $textType,
    ${ EntrepreneurProductServiceFields.BUSINESS_TYPE} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableEntrepreneurTrainingNeeds(
    ${ EntrepreneurTrainingNeedsFields.LOCAL_ID} $idType,
    ${ EntrepreneurTrainingNeedsFields.SERVER_ID} $textType,
    ${ EntrepreneurTrainingNeedsFields.BUSINESS_ID} $textType,
    ${ EntrepreneurTrainingNeedsFields.TRAINING_NEED_ID} $textType,
    ${ EntrepreneurTrainingNeedsFields.TRAINING_Description} $textType,
    ${ EntrepreneurTrainingNeedsFields.REFERENCE_NO} $textType,
    ${ EntrepreneurTrainingNeedsFields.IS_SYNC} $textType,
    ${ EntrepreneurTrainingNeedsFields.BUSINESS_TYPE} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableEntrepreneurMainProductService(
    ${ EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_LOCAL_ID} $idType,
    ${ EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_SERVER_ID} $textType,
    ${ EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_FILE_NAME} $textType,
    ${ EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_NIC} $textType,
    ${ EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_UPLOADED_DATE} $textType,
    ${ EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_NAME} $textType,
    ${ EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_HAVEMODAL_ID} $textType,
    ${ EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_IMAGE_ARRAY} $textType,
    ${ EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_IS_SYNC} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableInvestments(
    ${ InvestmentFields.id} $idType,
    ${ InvestmentFields.ID} $textType,
    ${ InvestmentFields.INVESTMENT} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableOwnership (
    ${OwnershipFields.id} $idType,
    ${OwnershipFields.ID} $textType,
    ${OwnershipFields.OWNERSHIP} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableBusinessRegistration (
    ${BusinessRegistrationFields.id} $idType,
    ${BusinessRegistrationFields.ID} $textType,
    ${BusinessRegistrationFields.BUSINESS_REGISTRATION} $textType
  )
''');

  }


  Future<DbCount> InsertDbCount(DbCount dbCount) async {
    final db = await instance.database;
    print("jason for prof : " + dbCount.toJson().toString());
    final id = await db.insert(tableDbCount, dbCount.toJson());
    return dbCount.copy(id: id);
  }

  Future<EntrepreneurDetails> InsertEntreprenuers(List<EntrepreneurDetails> entrepreneurDetails) async {
    final db = await instance.database;
    final batch = db.batch();
    entrepreneurDetails.forEach((entrepreneur) {
      print("jason for prof : " + entrepreneur.toJson().toString());
      batch.insert(tableRegistration, entrepreneur.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<EntrepreneurDetails> InsertEntExpectedSupport(List<EntrepreneurExpectedSupport> entrepreneurExpSup) async {
    final db = await instance.database;
    final batch = db.batch();
    entrepreneurExpSup.forEach((item) {
      print("jason for prof : " + item.toJson().toString());
      batch.insert(tableEntrepreneurExpectedSupport, item.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<EntrepreneurDetails> InsertEntTrainingPrograms(List<EntrepreneurTrainingPrograms> entrepreneurTrainingPrograms) async {
    final db = await instance.database;
    final batch = db.batch();
    entrepreneurTrainingPrograms.forEach((item) {
      print("jason for prof : " + item.toJson().toString());
      batch.insert(tableEntrepreneurTrainingPrograms, item.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<EntrepreneurDetails> InsertEntBusinessRelatedProblem(List<EntrepreneurBusinessRelatedProblem> entrepreneurBusinessRelatedProblem) async {
    final db = await instance.database;
    final batch = db.batch();
    entrepreneurBusinessRelatedProblem.forEach((item) {
      print("jason for prof : " + item.toJson().toString());
      batch.insert(tableEntrepreneurBusinessRelatedProblem, item.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<EntrepreneurDetails> InsertEntQualification(List<EntrepreneurQualification> entrepreneurEntrepreneurQualification) async {
    final db = await instance.database;
    final batch = db.batch();
    entrepreneurEntrepreneurQualification.forEach((item) {
      print("jason for prof : " + item.toJson().toString());
      batch.insert(tableEntrepreneurQualification, item.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<EntrepreneurDetails> InsertEntCollectedOfficer(List<EntrepreneurCollectedOfficer> entrepreneurCollectedOfficer) async {
    final db = await instance.database;
    final batch = db.batch();
    entrepreneurCollectedOfficer.forEach((item) {
      print("jason for prof : " + item.toJson(false,isSyncTemp: 1).toString());
      batch.insert(tableEntrepreneurCollectedOfficer, item.toJson(false,isSyncTemp: 1));
    });
    await batch.commit(noResult: true);
  }

  Future<WayOfAware> InsertWayofAwareSED(List<WayOfAware> wayOfAware) async {
    final db = await instance.database;
    final batch = db.batch();
    wayOfAware.forEach((item) {
      print("jason for prof : " + item.toJson().toString());
      batch.insert(tableWayOfAware, item.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<Investment> InsertInvestments(List<Investment> investments) async {
    final db = await instance.database;
    final batch = db.batch();
    investments.forEach((item) {
      print("jason for prof : " + item.toJson().toString());
      batch.insert(tableInvestments, item.toJson());
    });
    await batch.commit(noResult: true);
  }
  Future<Investment> InsertBusinessRegistration(List<BusinessRegistration> businessReg) async {
    final db = await instance.database;
    final batch = db.batch();
    businessReg.forEach((item) {
      print("jason for prof : " + item.toJson().toString());
      batch.insert(tableBusinessRegistration, item.toJson());
    });
    await batch.commit(noResult: true);
  }
  Future<Investment> InsertOwnership(List<Ownership> ownership) async {
    final db = await instance.database;
    final batch = db.batch();
    ownership.forEach((item) {
      print("jason for prof : " + item.toJson().toString());
      batch.insert(tableOwnership, item.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<TrainingProgramsFollowed> InsertTrainingPrograms(List<TrainingProgramsFollowed> trainingPrograms) async {
    final db = await instance.database;
    final batch = db.batch();
    trainingPrograms.forEach((item) {
      print("jason for prof : " + item.toJson().toString());
      batch.insert(tableTrainingProgramsFollowed, item.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<District> InsertDistricts(District district) async {
    final db = await instance.database;
    print("jason for prof : " + district.toJson().toString());
    final id = await db.insert(tableDistrict, district.toJson());
    return district.copy(id: id);
  }

  Future<DsDivision> InsertDsDivisions(DsDivision dsDivision) async {
    final db = await instance.database;
    print("jason for prof : " + dsDivision.toJson().toString());
    final id = await db.insert(tableDsDivisons, dsDivision.toJson());
    return dsDivision.copy(id: id);
  }

  Future<BusinessExperience> InsertBusinessExperience(BusinessExperience businessExperience) async {
    final db = await instance.database;
    print("jason for prof : " + businessExperience.toJson().toString());
    final id = await db.insert(tableBusinessExperience, businessExperience.toJson());
    return businessExperience.copy(id: id);
  }

  Future<BusinessRelatedProblem> InsertBusinessRelatedProblem(BusinessRelatedProblem businessRelatedProblem) async {
    final db = await instance.database;
    print("jason for prof : " + businessRelatedProblem.toJson().toString());
    final id = await db.insert(tableBusinessRelatedProblem, businessRelatedProblem.toJson());
    return businessRelatedProblem.copy(id: id);
  }



  Future<EducationalQualification> InsertEducationalQualification(EducationalQualification educationalQualification) async {
    final db = await instance.database;
    print("jason for prof : " + educationalQualification.toJson().toString());
    final id = await db.insert(tableEducationalQualification, educationalQualification.toJson());
    return educationalQualification.copy(id: id);
  }

  Future<ProfessionalQualification> InsertProfessionalQualification(ProfessionalQualification professionalQualification) async {
    final db = await instance.database;
    print("jason for prof : " + professionalQualification.toJson().toString());
    final id = await db.insert(tableProfessionalQualification, professionalQualification.toJson());
    return professionalQualification.copy(id: id);
  }

  Future InsertGnDivision(List<GnDivision> gnDivisionList) async {
    final db = await instance.database;
    final batch = db.batch();
    gnDivisionList.forEach((gnDivision) {
      print("jason for prof : " + gnDivision.toJson().toString());
      batch.insert(tableGnDivision, gnDivision.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<ExpectedSupport> InsertExpectedSupport(ExpectedSupport expectedSupport) async {
    final db = await instance.database;
    print("jason for prof : " + expectedSupport.toJson().toString());
    final id = await db.insert(tableExpectedSupport, expectedSupport.toJson());
    return expectedSupport.copy(id: id);
  }

  Future<NatureDetails> InsertNatureDetails(NatureDetails natureDetails) async {
    final db = await instance.database;
    print("jason for prof : " + natureDetails.toJson().toString());
    final id = await db.insert(tableNatureDetails, natureDetails.toJson());
    return natureDetails.copy(id: id);
  }

  Future<ServiceCategoryDetails> InsertServiceCategoryDetails(List<ServiceCategoryDetails>serviceCategoryDetails) async {
    final db = await instance.database;
    final batch = db.batch();
    serviceCategoryDetails.forEach((serviceCategory) {
      print("jason for prof : " + serviceCategory.toJson().toString());
      batch.insert(tableServiceCategoryDetails, serviceCategory.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<TrainingNeeds> InsertTrainingNeeds(TrainingNeeds trainingNeeds) async {
    final db = await instance.database;
    print("jason for prof : " + trainingNeeds.toJson().toString());
    final id = await db.insert(tableTrainingNeeds, trainingNeeds.toJson());
    return trainingNeeds.copy(id: id);
  }

  Future<Business> InsertBusiness(List<Business>businessList) async {
    final db = await instance.database;
    final batch = db.batch();
    businessList.forEach((business) {
      print("jason for prof : " + business.toJson().toString());
      batch.insert(tableBusiness, business.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<HaveABusiness> InsertHaveAbusiness(List<HaveABusiness> haveABusinessList) async {
    final db = await instance.database;
    final batch = db.batch();
    haveABusinessList.forEach((haveABusiness) {
      print("jason for prof : " + haveABusiness.toJson().toString());
      batch.insert(tableHaveABusiness, haveABusiness.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<LikeToStart> InsertLikeToStartbusiness(List<LikeToStart> likeToStartList) async {
    final db = await instance.database;
    final batch = db.batch();
    likeToStartList.forEach((likeToStart) {
      print("jason for prof : " + likeToStart.toJson().toString());
      batch.insert(tableLikeTostart, likeToStart.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<ProfessionalQualificationLevel> InsertProfessionalQualificationLevel(List<ProfessionalQualificationLevel> professionalQualificationLevel) async {
    final db = await instance.database;
    final batch = db.batch();
    professionalQualificationLevel.forEach((QualificationLevel) {
      print("jason for prof : " + QualificationLevel.toJson().toString());
      batch.insert(tableProfessionalQualificationLevels, QualificationLevel.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<EntrepreneurProductService> InsertEntrepreneurProductService(List<EntrepreneurProductService> entrepreneurProductService) async {
    final db = await instance.database;
    final batch = db.batch();
    entrepreneurProductService.forEach((productService) {
      print("jason for prof : " + productService.toJson().toString());
      batch.insert(tableEntrepreneurProductService, productService.toJson());
    });
    await batch.commit(noResult: true);
  }

  Future<EntrepreneurMainProductService> InsertEntrepreneurMainProductService(List<EntrepreneurMainProductService> entrepreneurMainProductService) async {
    final db = await instance.database;
    final batch = db.batch();
    entrepreneurMainProductService.forEach((productService) {
      print("jason for prof : " + productService.toJson().toString());
      batch.insert(tableEntrepreneurMainProductService, productService.toJson());
    });
    await batch.commit(noResult: true);
  }


  Future<int> getCount(String tableName) async {
    final db = await instance.database;
    int count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
    print('count is'+count.toString());
    return count;
  }

  Future<int> getTotCount(String tableName) async {
    final db = await instance.database;
    int count = Sqflite.firstIntValue(await db.rawQuery('SELECT  SUM(DistrictCount+DsDivisionCount+GnDivisionCount+EducationQualificationCount+ProfessionalQualificationCount+ProfessionalQualificationLevelCount+BusinessExperienceCount+ExpectedSupportCount+BusinessRelatedProblemCount+ProductNatureCount+ProductServiceCategoryCount+TrainingNeedsCount+EntrepreneursCount+EntrepreneurMainProductServiceCount+EntrepreneurProductServiceCount+BusinessCount+HaveABusinessCount+LikeToStartBusinessCount+EntrepreneurTrainingNeedCount) FROM $tableDbCount'));
    if(count==null){
      count=0;
    }
    print(' New count is from Db '+count.toString());
    return count;
  }

  // Future<EntrepreneurData> readSingleNotif(int id) async {
  //   final db = await instance.database;
  //   final maps = await db.query(
  //     tableRegistration,
  //     columns: EntrepreneurDataFields.values,
  //     where: '{$EntrepreneurDataFields.id} =?',
  //     whereArgs: [id], //prevent sqllite data injection
  //   );
  //   if (maps.isNotEmpty) {
  //     return EntrepreneurData.fromJson(maps.first);
  //   } else {
  //     throw Exception('ID $id not found ');
  //   }
  // }

  // Future <List<NotificationData>> readAllNotif()async{
  //   final db=await instance.database;
  //   final orderBy='${NotifDataFields.notifDate} ASC';
  //   // final result=await db.rawQuery('');
  //   final result =await db.query(tableNotification,orderBy: orderBy);
  //   return result.map((json) => NotificationData.fromJson(json)).toList();
  // }

  // Future<int>updateNotif(NotificationData notificationData)async {
  //   final db = await instance.database;
  //   return db.update(
  //     tableNotification,
  //     notificationData.toJson(),
  //     where: '${NotifDataFields.id} =?',
  //     whereArgs: [notificationData.notificId],
  //   );
  // }

  // Future<List<EntrepreneurData>> readAllNotif() async {
  //   final db = await instance.database;
  //   final orderBy = '${NotifDataFields.notifDate} ASC';
  //   // final result=await db.rawQuery('');
  //   final result = await db.query(tableNotification, orderBy: orderBy);
  //   return result.map((json) => NotificationData.fromJson(json)).toList();
  //
  //   List<dynamic> whereArguments = ["false"];
  //   final result = await db.query(tableNotification,
  //       columns: NotifDataFields.values,
  //       where: '{$NotifDataFields.notifStatus} =?',
  //       whereArgs: whereArguments);
  //   if (result.isNotEmpty) {
  //     result.forEach((row) => print(row));
  //     return result.map((json) => NotificationData.fromJson(json)).toList();
  //   } else {
  //     throw Exception(' not found ');
  //   }
  //
  //   final result = await db.rawQuery(
  //       'SELECT * FROM Notification_Data ORDER BY ' +
  //           EntrepreneurDataFields.notifDate +
  //           ' DESC');
  //   if (result.isNotEmpty) {
  //     result.forEach((row) => print(row));
  //     return result.map((json) => EntrepreneurData.fromJson(json)).toList();
  //   } else {
  //     throw Exception(' not found ');
  //   }
  // }

  // Future<int> updateNotif(NotificationData notificationData) async {
  //   final db = await instance.database;
  //   return db.update(
  //     tableNotification,
  //     notificationData.toJson(),
  //     where: '${NotifDataFields.id} =?',
  //     whereArgs: [notificationData.notificId],
  //   );
  // }

  // Future<int> updateNotif(NotificationData notificationData) async {
  //   final db = await instance.database;
  //   return db.update(
  //     tableNotification,
  //     notificationData.toJson(),
  //     where: '${NotifDataFields.id} =?',
  //     whereArgs: [notificationData.notificId],
  //   );
  // }
  Future<int> updateNotif() async {
    final db = await instance.database;
    final result = await db.rawQuery(
        'UPDATE Notification_Data SET notifStatus=true WHERE notifStatus=false');
    print(result);
    // return db.update(
    //   tableNotification,
    //   notificationData.toJson(),
    //   where: '${NotifDataFields.id} =?',
    //   whereArgs: [notificationData.notificId],
    // );
  }

  // Future<int> deleteNotif(int id) async {
  //   final db = await instance.database;
  //   return await db.delete(tableRegistration,
  //       where: '${EntrepreneurDataFields.id} =?', whereArgs: [id]);
  // }

  // Future deleteTable() async {
  //   final db = await instance.database;
  //   db.rawQuery("delete from " + tableRegistration);
  //   // final db = await instance.database;
  //   // db.close();
  //   // var databasesPath = await getDatabasesPath();
  //   // String path = join(databasesPath,tableNotification);
  //   // await deleteDatabase(path);
  // }


  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future deleteATables(String tableName) async {
    final db = await instance.database;
    final batch = db.batch();
    batch.delete(tableName);
    await batch.commit();
    // final result=await db.rawQuery("DELETE FROM" + tableName);
    // result.forEach((row) => print(row));
  }

  Future<bool> checkAvailability(String nic) async {
    bool isAvailable = false;
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableRegistration + " WHERE " + EntrepreneurDataFields.COL_ENTREPRENEUR_NIC +
        " like '" +
        nic +
        "'");
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      isAvailable = true;
      return isAvailable;
    } else {
      print("error has occured");
      return isAvailable;
    }
  }

  Future<List<District>> getDistrictList() async {
    final db = await instance.database;
    final orderBy = '${DistrictDataFields.DISTRICT_ID} ASC';
    final result = await db.query(tableDistrict, orderBy: orderBy);
    // final result = await db.rawQuery("SELECT  * FROM " +
    //     tableDistrict +
    //     " ORDER BY " +
    //     DistrictDataFields.DISTRICT_ID+
    //     "'");
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));

      return result.map((json) =>District.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<DsDivision>> getDsDivisionList(int districtId) async {
    final db = await instance.database;
    String select = " SELECT * FROM " + tableDsDivisons + " WHERE " + DsDivisionDataFields.DISTRICT_ID + " LIKE "+districtId.toString()+ " ORDER BY "+DsDivisionDataFields.DIVISION_ID;
    final result = await db.rawQuery('SELECT * FROM ' + tableDsDivisons + '  WHERE  ' + DsDivisionDataFields.DISTRICT_ID + '  LIKE  '+districtId.toString()+ ' ORDER BY ' +DsDivisionDataFields.DIVISION_ID);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return result.map((json) =>DsDivision.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<GnDivision>> getGnDivisionList(int dsDivisionId) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableGnDivision + " WHERE " + GnDivisionDataFields.DS_DIVISION_ID + " LIKE "+dsDivisionId.toString()+ " ORDER BY "+GnDivisionDataFields.id);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return result.map((json) =>GnDivision.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<EducationalQualification>>getEducationList() async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableEducationalQualification+ " ORDER BY "+EducationalQualificationDataFields.QUALIFICATION_ID);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return result.map((json) =>EducationalQualification.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<ProfessionalQualification>>getProfessionalQualifList() async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableProfessionalQualification+ " ORDER BY "+ProfessionalQualificationDataFields.QUALIFICATION_ID);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return result.map((json) =>ProfessionalQualification.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<ProfessionalQualificationLevel>> getProfessionalQualifLevelList(int qualificationId) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableProfessionalQualificationLevels + " WHERE " + ProfessionalQualificationLevelFields.PROFESSIONAL_QUALIFICATION_ID + " LIKE "+qualificationId.toString()+ " ORDER BY "+ProfessionalQualificationLevelFields.id);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return result.map((json) =>ProfessionalQualificationLevel.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<BusinessExperience>> getBusinessExpList() async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableBusinessExperience+ " ORDER BY "+BusinessExperienceFields.EXPERIENCE_ID);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return result.map((json) =>BusinessExperience.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<ExpectedSupport>> getExpSupportList() async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableExpectedSupport+ " ORDER BY "+ExpectedSupportDataFields.SUPPORT_ID);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return result.map((json) =>ExpectedSupport.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<BusinessRelatedProblem>> getBusinessProblemsList() async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableBusinessRelatedProblem+ " ORDER BY "+BusinessRelatedProblemDataFields.PROBLEM_ID);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return result.map((json) =>BusinessRelatedProblem.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<NatureDetails>> getBusinessNatureList() async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableNatureDetails);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return result.map((json) =>NatureDetails.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<ServiceCategoryDetails>> getProductServiceCategoryList() async {
    final db = await instance.database;
    String qury = "SELECT * FROM " + tableServiceCategoryDetails;
    print(qury);
    final result = await db.rawQuery(qury);
    if (result.isNotEmpty) {
      // result.forEach((row) => print(row));
      return result.map((json) =>ServiceCategoryDetails.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<TrainingNeeds>> getTrainingNeedsList() async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableTrainingNeeds);
    if (result.isNotEmpty) {
      // result.forEach((row) => print(row));
      return result.map((json) =>TrainingNeeds.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<HaveABusiness>> getBusinessListRelatedToNic(String nic) async {
    final db = await instance.database;
    // final result = await db.rawQuery("SELECT  * FROM " + tableHaveABusiness + " AS H " +
    //     "INNER JOIN " + tableBusiness + " AS B ON B." + BusinessFields.BUSINESS_ID + "=h." +
    //     HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_ID + " INNER JOIN " + tableRegistration + " AS E ON E." +
    //     EntrepreneurDataFields.COL_ENTREPRENEUR_NIC + " = B." + BusinessFields.ENTREPRENEUR_NIC + " WHERE E." +
    //     EntrepreneurDataFields.COL_ENTREPRENEUR_NIC + " = '" + nic + "'");

    String qery = "SELECT  * FROM "+ tableHaveABusiness +" AS H INNER JOIN " + tableBusiness + " AS B ON B." + BusinessFields.BUSINESS_ID
        + "=H."+HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_ID +" INNER JOIN "+ tableRegistration +" AS E ON E."+EntrepreneurDataFields.COL_ENTREPRENEUR_NIC +" = B." + BusinessFields.ENTREPRENEUR_NIC + " WHERE E."+EntrepreneurDataFields.COL_ENTREPRENEUR_NIC +" = " + nic;
    final result = await db.rawQuery(qery);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return result.map((json) =>HaveABusiness.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<EntrepreneurDetails>>getEntrepreneurList() async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableRegistration);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return result.map((json) =>EntrepreneurDetails.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<Business>>getBusinessToConvertList() async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableBusiness + " WHERE " + BusinessFields.BUSINESS_TYPE
        + " LIKE '%" + 1.toString() + "%'");
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return result.map((json) =>Business.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<Business>>getLtsBusinessesByNic(String nic) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableBusiness + " WHERE " + BusinessFields.ENTREPRENEUR_NIC
        + " LIKE " + nic + " AND " +BusinessFields.BUSINESS_TYPE+" = "+1.toString());
    // final result=await db.rawQuery("SELECT * FROM Business WHERE EntreprenuerNic LIKE '%$nic%' AND BusinessType = 1 ");
    print(result);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return result.map((json) =>Business.fromJsonDb(json)).toList();
    } else {
      throw Exception(' not found ');
    }
  }

  Future<EntrepreneurDetails>getEntrepreneur(String nic) async {
    print('nic is method'+nic);
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableRegistration + " WHERE " + EntrepreneurDataFields.COL_ENTREPRENEUR_NIC
        + " LIKE '%" +nic+ "%'");
    // final result=await db.rawQuery("SELECT * FROM Business WHERE EntreprenuerNic LIKE '%$nic%' AND BusinessType = 1 ");
    print(result);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return EntrepreneurDetails.fromJsonDb(result.first);
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<EntrepreneurExpectedSupport>>getAllSupportByNic(String nic) async {
    final db = await instance.database;
    String qur = "SELECT  * FROM " + tableEntrepreneurExpectedSupport + " WHERE " + EntrepreneurExpectedSupportDataFields.Nic
        + " LIKE '%" + nic + "%'";
    print("------------------");
    print(qur);
    final result = await db.rawQuery(qur);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return result.map((json) =>EntrepreneurExpectedSupport.fromJsonDb(json)).toList();
    } else {
      print('No expected support');
      return [];
    }
  }

  Future<List<EntrepreneurBusinessRelatedProblem>>getAllBusinessProblemsByNic(String nic) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableEntrepreneurBusinessRelatedProblem + " WHERE " + EntrepreneurBusinessRelatedProblemDataFields.Nic
        + " LIKE '%" + nic + "%'");
    print(result);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return result.map((json) =>EntrepreneurBusinessRelatedProblem.fromJsonDb(json)).toList();
    } else {
      print('No business related problems');
      return [];
    }
  }

  Future<BusinessRelatedProblem>getBusinessProblem(String problemId) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableBusinessRelatedProblem+ " WHERE " + BusinessRelatedProblemDataFields.PROBLEM_ID + " = " + problemId);
    print(result);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return BusinessRelatedProblem.fromJsonDb(result.first);
    } else {
      throw Exception(' not found ');
    }
  }

  Future<List<EntrepreneurTrainingPrograms>>getAllTrainingProgramsByNic(String nic) async {
    final db = await instance.database;
    String qur = "SELECT  * FROM " + tableEntrepreneurTrainingPrograms + " WHERE " + EntrepreneurTrainingProgramsDataFields.Nic
        + " LIKE '%" + nic + "%'";
    print("-------------------------------------------------------------------------------------------");
    print(qur);
    final result = await db.rawQuery(qur);
    print(result);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return result.map((json) =>EntrepreneurTrainingPrograms.fromJsonDb(json)).toList();
    } else {
      print('No Training programs');
      return [];
    }
  }

  Future<List<EntrepreneurQualification>>getAllQualificationByNic(String nic) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableEntrepreneurQualification + " WHERE " + EntrepreneurQualificationDataFields.Nic
        + " LIKE '%" + nic + "%'");
    print(result);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return result.map((json) =>EntrepreneurQualification.fromJsonDb(json)).toList();
    } else {
      print('No Qualifications');
      return [];
    }
  }

  Future<ProfessionalQualificationLevel>getProfessionalQualificationLevel(String levelId) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableProfessionalQualificationLevels + " WHERE " + ProfessionalQualificationLevelFields.id + " LIKE '%"+levelId+"%'");
    print(result);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return ProfessionalQualificationLevel.fromJsonDb(result.first);
    } else {
      print('ProfessionalQualificationLevel not found ');
      return null;
    }
  }

  Future<ProfessionalQualification>getProfessionalQualificationById(String id) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableProfessionalQualification+ " WHERE " + ProfessionalQualificationDataFields.QUALIFICATION_ID + " = '" + id + "'");
    print(result);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return ProfessionalQualification.fromJsonDb(result.first);
    } else {
      print('ProfessionalQualification not found ');
      return null;
    }
  }

  Future<List<Business>>getBusinessesByNic(String nic) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableBusiness + " WHERE " + BusinessFields.ENTREPRENEUR_NIC
        + " LIKE '%" + nic +  "%'");
    print(result);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return result.map((json) =>Business.fromJsonDb(json)).toList();
    } else {
     return [];
    }
  }

  Future<bool>isBusinessExist(String businessId) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableBusiness + " WHERE " +
        BusinessFields.BUSINESS_ID
        + " = '" + businessId + "'");
    print(result);
    if (result.isNotEmpty) {
      return true;
    } else {
      print("Business not found");
      return false;
    }
  }

  Future<EducationalQualification>getEducationalQualificationById(String id) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableEducationalQualification+ " WHERE "+EducationalQualificationDataFields.QUALIFICATION_ID + " = "+id);
    print(result);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return EducationalQualification.fromJsonDb(result.first);
    } else {
      throw Exception(' not found ');
    }
  }


  Future<District>getDistrictById(String id) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableDistrict + " WHERE "+DistrictDataFields.DISTRICT_ID+" = "+id);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return District.fromJsonDb(result.first);
    } else {
      throw Exception(' not found ');
    }
  }

  Future<DsDivision>getDsDivisionById(String id) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableDsDivisons + " WHERE " + DsDivisionDataFields.DIVISION_ID + " LIKE "+id);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return DsDivision.fromJsonDb(result.first);
    } else {
      throw Exception(' not found ');
    }
  }

  Future<GnDivision>getGnDivisionById(String id) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableGnDivision + " WHERE " + GnDivisionDataFields.id + " LIKE "+id);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return GnDivision.fromJsonDb(result.first);
    } else {
      throw Exception(' not found ');
    }
  }

  Future<BusinessExperience>getBusinessExperienceById(String id) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableBusinessExperience+ " WHERE "+BusinessExperienceFields.EXPERIENCE_ID + " = " + id);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return BusinessExperience.fromJsonDb(result.first);
    } else {
      throw Exception(' not found ');
    }
  }

  Future<WayOfAware>getWayOfAware(String id) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableWayOfAware + " WHERE " + WayOfAwareFields.ID + " = " + id);
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return WayOfAware.fromJsonDb(result.first);
    } else {
      throw Exception(' not found ');
    }
  }

  Future<ServiceCategoryDetails>getProductServiceItemFromCode(String code) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT * FROM " + tableServiceCategoryDetails + " WHERE "+ ServiceCategoryDetailsFields.CODE + " LIKE '%" + code + "%'");
    if (result.isNotEmpty) {
      // result.forEach((row) => print(row)
      // );
      return ServiceCategoryDetails.fromJsonDb(result.first);
    } else {
     return null;
    }
  }

  Future<bool>isHaveABusinessExist(String businessId) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableHaveABusiness + " WHERE " +
        HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_ID
        + " = '" + businessId + "'");
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return true;
    } else {
      print("have a business not found///////////////////");
      return false;
    }
  }

  Future<List<EntrepreneurProductService>>getAllEntrepreneurProductServiceByBusinessId(String bid) async {
    final db = await instance.database;
    final result = await db.rawQuery(
        "SELECT  * FROM " + tableEntrepreneurProductService + " WHERE " + EntrepreneurProductServiceFields.BUSINESS_ID
            + " LIKE '%" + bid + "%'");
    if (result.isNotEmpty) {
      // result.forEach((row) => print(row)
      // );
      return result.map((json) =>EntrepreneurProductService.fromJsonDb(json)).toList();
    } else {
      return [];
    }
  }

  Future<List<EntrepreneurTrainingNeeds>>getAllEntrepreneurTrainingNeedByBusinessId(String bid) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableEntrepreneurTrainingNeeds + " WHERE " + EntrepreneurTrainingNeedsFields.BUSINESS_ID
        + " LIKE '%" + bid + "%'");
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return result.map((json) =>EntrepreneurTrainingNeeds.fromJsonDb(json)).toList();
    } else {
      return [];
      // throw Exception(' not found ');
    }
  }

  Future<List<EntrepreneurMainProductService>>getAllEntrepreneurMainProductServiceByNic(String nic) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableEntrepreneurMainProductService + " WHERE " + EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_NIC
        + " LIKE '%" + nic + "%'");
    if (result.isNotEmpty) {
      // result.forEach((row) => print(row)
      // );
      return result.map((json) =>EntrepreneurMainProductService.fromJsonDb(json)).toList();
    } else {
      return [];
      throw Exception(' not found ');
    }
  }

  Future<List<HaveABusiness>>getHaveBusiness(String businessId) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableHaveABusiness + " WHERE " +
        HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_ID
        + " = '" + businessId + "'");
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return List.generate(result.length, (index) => HaveABusiness.fromJsonDb(result[index])); //HaveABusiness.fromJsonDb(result.first);
    } else {
      return null;
    }
  }


  Future<bool>isLikeToStartExist(String businessId) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableLikeTostart + " WHERE " +
        LikeToStartFields.COL_LIKE_TO_START_BUSINESS_ID
        + " = '" + businessId + "'");
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return true;
    } else {
      print("false like to start not found");
      return false;
      // throw Exception(' not found ');
    }
  }

  Future<List<LikeToStart>>getLikeToBusiness(String businessId) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableLikeTostart + " WHERE " +
        LikeToStartFields.COL_LIKE_TO_START_BUSINESS_ID
        + " = '" + businessId + "'");
    if (result.isNotEmpty) {
      result.forEach((row) => print(row)
      );
      return List.generate(result.length, (index) => LikeToStart.fromJsonDb(result[index])); //LikeToStart.fromJsonDb(result.first);
    } else {
     return null;
    }
  }

  Future<int> InsertEntRecord(EntrepreneurDetails entrepreneurDetails) async {
    final db = await instance.database;
    print("jason for prof : " + entrepreneurDetails.toJson().toString());
    final id = await db.insert(tableRegistration, entrepreneurDetails.toJson());
    return id;
  }

  Future<int> InsertBusinessRecord(Business business) async {
    final db = await instance.database;
    final batch = db.batch();
    if(!await EntrepreneurDb.instance.checkBusinessAvailability(business)){
      print("jason for prof : " + business.toJson().toString());
      print(' Business record inserted /////////////////////////////////////////////////////////////');
      final id =await db.insert(tableBusiness, business.toJson());
      // await batch.commit(noResult: true);
      return id;
    }else{
      print('Business record found');
    }

  }

  Future<int> InsertSingleBusinessRecord(int localId) async {
    final db = await instance.database;
    final id =await db.rawInsert(
        'INSERT INTO ${tableBusiness}'
            '(${BusinessFields.id}'
            'VALUES(?)', [localId]);
    return id;
  }

  Future<int> InsertLikeToStartBusinessRecord(LikeToStart likeToStart) async {
    final db = await instance.database;
    final batch = db.batch();
    if(!await EntrepreneurDb.instance.checkLikeToStartBusinessAvailability(likeToStart.serverId)){
      print("jason for prof : " + likeToStart.toJson().toString());
      print('Like to start Business record inserted /////////////////////////////////////////////////////////////');
      final id =await db.insert(tableLikeTostart, likeToStart.toJson());
      // await batch.commit(noResult: true);
      return id;
    }else{
      print('Like to start Business record found');
    }

  }

  Future<int> InsertHaveABusinessRecord(HaveABusiness business) async {
    final db = await instance.database;
    final batch = db.batch();
    if(!await EntrepreneurDb.instance.checkHaveABusinessAvailability(business)){
      print('Inserted');
      print("jason for prof : " + business.toJson().toString());
      final id =await db.insert(tableHaveABusiness, business.toJson());
      print('Have A Business record inserted /////////////////////////////////////////////////////////////');
      // await batch.commit(noResult: true);
      return id;
    }else{
      print('Have Business record found');
    }

  }

  Future<Business> InsertEntrepreneurProductServiceRecord(EntrepreneurProductService entrepreneurProductService) async {
    final db = await instance.database;
    final batch = db.batch();
    if(!await EntrepreneurDb.instance.checkEntrepreneurProductServiceAvailability(entrepreneurProductService)){
      print("jason for prof : " + entrepreneurProductService.toJson().toString());
      batch.insert(tableEntrepreneurProductService, entrepreneurProductService.toJson());
      await batch.commit(noResult: true);
    }else{
      print('record found');
    }

  }

  Future<Business> InsertEntrepreneurTrainingNeedsRecord(EntrepreneurTrainingNeeds entrepreneurTrainingNeeds) async {
    final db = await instance.database;
    final batch = db.batch();
    if(!await EntrepreneurDb.instance.checkEntrepreneurTrainingNeedsAvailability(entrepreneurTrainingNeeds)){
      print("jason for prof : " + entrepreneurTrainingNeeds.toJson().toString());
      batch.insert(tableEntrepreneurTrainingNeeds, entrepreneurTrainingNeeds.toJson());
      await batch.commit(noResult: true);
    }else{
      print('record found');
    }

  }

  Future<Business> InsertEntrepreneurMainProductServiceRecord(EntrepreneurMainProductService entrepreneurMainProductService) async {
    final db = await instance.database;
    final batch = db.batch();
    if(!await EntrepreneurDb.instance.checkEntrepreneurMainProductServiceAvailability(entrepreneurMainProductService)){
      print("jason for prof : " + entrepreneurMainProductService.toJson().toString());
      batch.insert(tableEntrepreneurMainProductService, entrepreneurMainProductService.toJson());
      await batch.commit(noResult: true);
    }else{
      print('record found');
    }

  }

  Future<bool>checkBusinessAvailability(Business business) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableBusiness + " WHERE " +
        BusinessFields.ENTREPRENEUR_NIC + " = '" + business.entrepreneurNic + "' AND " +
        BusinessFields.NATURE_ID + " = '" + business.natureId + "' AND " +
        BusinessFields.CATEGORY + " = '" + business.category + "'");
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return true;
    } else {
      print("false");
      return false;
      // throw Exception(' not found ');
    }
  }

  Future<bool>checkLikeToStartBusinessAvailability(String serverId) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableLikeTostart + " WHERE " + LikeToStartFields.COL_LIKE_TO_START_SERVER_ID
        + " = '" + serverId + "' AND " + LikeToStartFields.COL_LIKE_TO_START_SERVER_ID + " <> 0");
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return true;
    } else {
      print("like to start data available");
      return false;
      // throw Exception(' not found ');
    }
  }

  Future<bool>checkHaveABusinessAvailability(HaveABusiness business) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableHaveABusiness + " WHERE " +
        HaveABusinessFields.COL_HAVE_A_BUSINESS_START_DATE + " = '" + business.startDate + "' AND " +
        HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_REGISTRATION_DATE + " = '" + business.registrationDate + "'");
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return true;
    } else {
      print("have a business  data not available");
      return false;
      // throw Exception(' not found ');
    }
  }

  Future<bool>checkEntrepreneurProductServiceAvailability(EntrepreneurProductService entrepreneurProductService) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableEntrepreneurProductService + " WHERE " +
        EntrepreneurProductServiceFields.SERVER_ID + " = '" + entrepreneurProductService.localId + "' AND " +
        EntrepreneurProductServiceFields.BUSINESS_ID + " = '" + entrepreneurProductService.businessId + "' AND " +
        EntrepreneurProductServiceFields.CODE + " = '" + entrepreneurProductService.code + "'");
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return true;
    } else {
      print("false");
      return false;
      // throw Exception(' not found ');
    }
  }

  Future<bool>checkEntrepreneurTrainingNeedsAvailability(EntrepreneurTrainingNeeds entrepreneurTrainingNeeds) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableEntrepreneurTrainingNeeds + " WHERE " +
        EntrepreneurTrainingNeedsFields.SERVER_ID + " = '" + entrepreneurTrainingNeeds.localId + "' AND " +
        EntrepreneurTrainingNeedsFields.BUSINESS_ID + " = '" + entrepreneurTrainingNeeds.businessId + "' AND " +
        EntrepreneurTrainingNeedsFields.TRAINING_NEED_ID + " = '" + entrepreneurTrainingNeeds.trainingNeedId + "'");
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return true;
    } else {
      print("false");
      return false;
      // throw Exception(' not found ');
    }
  }

  Future<bool>checkEntrepreneurMainProductServiceAvailability(EntrepreneurMainProductService entrepreneurMainProductService) async {
    final db = await instance.database;
    final result = await db.rawQuery("SELECT  * FROM " + tableEntrepreneurMainProductService + " WHERE " +
        EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_NIC + " = '" + entrepreneurMainProductService.entrepreneurNic + "' AND " +
        EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_FILE_NAME + " = '" + entrepreneurMainProductService.storageFileName + "' AND " +
        EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_UPLOADED_DATE + " = '" + entrepreneurMainProductService.uploadedDate + "' AND " +
        EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_NAME + " = '" + entrepreneurMainProductService.productServiceName + "'");
    if (result.isNotEmpty) {
      result.forEach((row) => print(row));
      return true;
    } else {
      print("false");
      return false;
      // throw Exception(' not found ');
    }
  }


  //other tables deletions
  Future<int> deleteEntrepreneur(String nic) async {
    final db = await instance.database;
    // return await db.delete(tableRegistration, where: '${EntrepreneurDataFields.COL_ENTREPRENEUR_NIC} = ?', whereArgs: [nic]);
    int result;
    String qur ="DELETE FROM " + tableRegistration +" WHERE " + EntrepreneurDataFields.COL_ENTREPRENEUR_NIC + " = '"+nic+"'";
    print("-------------------------------------------------------------------------------------------");
    print(qur);
    print("-------------------------------------------------------------------------------------------");
    result=await db.rawDelete("DELETE FROM " + tableRegistration +" WHERE " + EntrepreneurDataFields.COL_ENTREPRENEUR_NIC + " = '"+nic+"'");
    return result;
  }

  Future<int> deleteEntrepreneurExpectedSupport(String nic) async {
    final db = await instance.database;
    // return await db.delete(tableEntrepreneurExpectedSupport, where: '${EntrepreneurExpectedSupportDataFields.Nic} = ?', whereArgs: [nic]);
    int result;
    String qur ="DELETE FROM "+ tableEntrepreneurExpectedSupport+ " WHERE " + EntrepreneurExpectedSupportDataFields.Nic + " = '"+nic+"'";
    print("-------------------------------------------------------------------------------------------");
    print(qur);
    result=await db.rawDelete("DELETE FROM "+ tableEntrepreneurExpectedSupport+ " WHERE " + EntrepreneurExpectedSupportDataFields.Nic + " = '"+nic+"'");
    return result;
  }

  Future<int> deleteEntrepreneurTrainingPrograms(String nic) async {
    final db = await instance.database;
    // return await db.delete(tableEntrepreneurTrainingPrograms, where: '${EntrepreneurTrainingProgramsDataFields.Nic} = ?', whereArgs: [nic]);
    int result;
    String qur ="DELETE FROM "+ tableEntrepreneurTrainingPrograms +" WHERE "+ EntrepreneurTrainingProgramsDataFields.Nic + " = '"+nic+"'";
    print("-------------------------------------------------------------------------------------------");
    print(qur);
    result=await db.rawDelete("DELETE FROM "+ tableEntrepreneurTrainingPrograms +" WHERE "+ EntrepreneurTrainingProgramsDataFields.Nic + " = '"+nic+"'");
    return result;
  }


  Future<int> deleteEntrepreneurQualifications(String nic) async {
    final db = await instance.database;
    // return await db.delete(tableEntrepreneurQualification, where: '${EntrepreneurQualificationDataFields.Nic} = ?', whereArgs: [nic]);
    int result;
    String qur ="DELETE FROM "+ tableEntrepreneurQualification +" WHERE "+ EntrepreneurQualificationDataFields.Nic + " = '"+nic+"'";
    print("-------------------------------------------------------------------------------------------");
    print(qur);
    result=await db.rawDelete("DELETE FROM "+ tableEntrepreneurQualification +" WHERE "+ EntrepreneurQualificationDataFields.Nic + " = '"+nic+"'");
    return result;
  }

  Future<int> deleteEntrepreneurBusinessRelatedProblem(String nic) async {
    final db = await instance.database;
    // return await db.delete(tableEntrepreneurBusinessRelatedProblem, where: '${EntrepreneurBusinessRelatedProblemDataFields.Nic} = ?', whereArgs: [nic]);
    int result;
    String qur ="DELETE FROM "+ tableEntrepreneurBusinessRelatedProblem +" WHERE "+ EntrepreneurBusinessRelatedProblemDataFields.Nic + " = '"+nic+"'";
    print("-------------------------------------------------------------------------------------------");
    print(qur);
    result=await db.rawDelete("DELETE FROM "+ tableEntrepreneurBusinessRelatedProblem +" WHERE "+ EntrepreneurBusinessRelatedProblemDataFields.Nic + " = '"+nic+"'");
    return result;
  }


  //have a business deletions
  Future<int> deleteBusiness(String businessId) async {
    final db = await instance.database;
    // return await db.delete(tableBusiness, where: '${BusinessFields.BUSINESS_ID} =?', whereArgs: [businessId]);
    int result;
    String qur ="DELETE FROM " + tableBusiness +" WHERE "+ BusinessFields.BUSINESS_ID + " = '"+businessId+"'";
    print("-------------------------------------------------------------------------------------------");
    print(qur);
    result=await db.rawDelete("DELETE FROM " + tableBusiness +" WHERE "+ BusinessFields.BUSINESS_ID + " = '"+businessId+"'");
    return result;

  }

  Future<int> deleteHaveABusiness(String businessId) async {
    final db = await instance.database;
    // return await db.delete(tableHaveABusiness, where: '${HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_ID} =?', whereArgs: [businessId]);
    int result;
    String qur ="DELETE FROM " + tableHaveABusiness +" WHERE "+ HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_ID + " = '"+businessId+"'";
    print("-------------------------------------------------------------------------------------------");
    print(qur);
    result=await db.rawDelete("DELETE FROM " + tableHaveABusiness +" WHERE "+ HaveABusinessFields.COL_HAVE_A_BUSINESS_BUSINESS_ID + " = '"+businessId+"'");
    return result;
  }

  Future<int> deleteEntreprenuerMainProductService(String nic) async {
    print('nic is');
    print(nic);
    final db = await instance.database;
    // return await db.delete(tableEntrepreneurMainProductService, where: '${EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_NIC} =?', whereArgs: [nic]);
    int result;
    String qur =" DELETE FROM " + tableEntrepreneurMainProductService + " WHERE "+ EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_NIC + " = '"+nic+"'";
    print("-------------------------------------------------------------------------------------------");
    print(qur);
    result=await db.rawDelete(" DELETE FROM " + tableEntrepreneurMainProductService + " WHERE "+ EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_NIC + " = '"+nic+"'");
    return result;

  }

  Future<int> deleteEntreprenuerProductService(String businessId) async {
    final db = await instance.database;
    // return await db.delete(tableEntrepreneurProductService, where: '${EntrepreneurProductServiceFields.BUSINESS_ID} =?', whereArgs: [businessId]);
    // return await db.rawDelete('DELETE FROM $tableEntrepreneurProductService WHERE ${EntrepreneurProductServiceFields.BUSINESS_ID} = ?',[businessId],);
    int result;
    String qur =" DELETE FROM "+ tableEntrepreneurProductService +" WHERE "+ EntrepreneurProductServiceFields.BUSINESS_ID + " = '"+businessId+"'";
    print("-------------------------------------------------------------------------------------------");
    print(qur);
    result=await db.rawDelete(" DELETE FROM "+ tableEntrepreneurProductService +" WHERE "+ EntrepreneurProductServiceFields.BUSINESS_ID + " = '"+businessId+"'");
    return result;
  }

  // Future<int> deleteEntreprenuerProductServiceFromId(String Id) async {
  //   final db = await instance.database;
  //   // return await db.delete(tableEntrepreneurProductService, where: '${EntrepreneurProductServiceFields.LOCAL_ID} =?', whereArgs: [Id]);
  //   String qur ="DELETE FROM "+ tableEntrepreneurProductService +" WHERE "+ EntrepreneurProductServiceFields.LOCAL_ID + " = "+ Id;
  //   print("-------------------------------------------------------------------------------------------");
  //   print(qur);
  //   await db.rawQuery("DELETE FROM "+ tableEntrepreneurProductService +" WHERE "+ EntrepreneurProductServiceFields.LOCAL_ID + " = "+ Id);
  // }

  Future<int> deleteEntreprenuerTrainingNeeds(String businessId) async {
    final db = await instance.database;
    // return await db.delete(tableEntrepreneurTrainingNeeds, where: '${EntrepreneurTrainingNeedsFields.BUSINESS_ID} =?', whereArgs: [businessId]);
    int result;
    String qur ="DELETE FROM "+ tableEntrepreneurTrainingNeeds +" WHERE "+ EntrepreneurTrainingNeedsFields.BUSINESS_ID + " = '"+businessId+"'";
    print("-------------------------------------------------------------------------------------------");
    print(qur);
    result=await db.rawDelete("DELETE FROM "+ tableEntrepreneurTrainingNeeds +" WHERE "+ EntrepreneurTrainingNeedsFields.BUSINESS_ID + " = '"+businessId+"'");
    return result;
  }

  //LikeToStart deletion

  Future<int> deleteLikeToStartBusiness(String businessId) async {
    final db = await instance.database;
    // return await db.delete(tableLikeTostart, where: '${LikeToStartFields.COL_LIKE_TO_START_BUSINESS_ID} =?', whereArgs: [businessId]);
    int result;
    String qur ="DELETE FROM "+ tableLikeTostart +" WHERE "+ LikeToStartFields.COL_LIKE_TO_START_BUSINESS_ID + " = '"+businessId+"'";
    print("-------------------------------------------------------------------------------------------");
    print(qur);
    result=await db.rawDelete("DELETE FROM "+ tableLikeTostart +" WHERE "+ LikeToStartFields.COL_LIKE_TO_START_BUSINESS_ID + " = '"+businessId+"'");
    return result;
  }


}
