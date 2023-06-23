class Endpoints{

  // static String BASE_URL = "http://203.81.101.196:1616/SED_QA_NEW"; //QA
  static String BASE_URL = "http://sed.gov.lk/SED"; //LIVE
  // static String BASE_URL = "http://sed.gov.lk/SED_LIVE"; //QA
  // static String BASE_URL = "http://203.81.101.196:1616/SED_LIVE"; //LIVE

  static String SERVICE_URL = BASE_URL+"/services/";
  static String SERVICE_URL2 = BASE_URL;
  static String LOGIN_URL = BASE_URL+"/public/android-login/";

  //Meta Data
  static final String UI_UPDATE_BROADCAST = "bellvantage.sed.uiupdatebroadcast";

  //Log folder
  static final String LOG_FOLDER = "SED_LOG";

  //Database Version
  static final int DATABASE_VERSION = 3;

  //InsertEntrepreneur
  static String insertEntrepreneur =SERVICE_URL+"insert_entrepreneur.php";
  static String insertLikeToStartBusiness =SERVICE_URL+"insertLS.php";
  static String insertLikeHaveABusiness =SERVICE_URL+"insertHB.php";
  static String insertConvertedToLs =SERVICE_URL+"insertConvertedLS.php";

  //GetProgress
  static String getProgress ="http://sed.gov.lk/SED/public/getIndividualProgressDetails/";

  //InsertEvaluation
  static String sendEvaluation ="http://sed.gov.lk/SED/public/api/v1/evaluationSubmit";


}