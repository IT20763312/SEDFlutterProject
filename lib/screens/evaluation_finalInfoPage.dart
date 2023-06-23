import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:sed_project/model/evaluation_models/award_information.dart';
import 'package:sed_project/model/evaluation_models/financial_loan.dart';
import 'package:sed_project/model/evaluation_models/initial_assets.dart';
import 'package:sed_project/model/evaluation_models/job_vacancies.dart';
import 'package:sed_project/model/evaluation_models/legal_information.dart';
import 'package:sed_project/model/evaluation_models/main_product_services.dart';
import 'package:sed_project/model/evaluation_models/quality_certifications.dart';
import 'package:sed_project/model/for_requests/insert_entrepreneur_evaluation.dart';
import 'package:sed_project/model/for_requests/insert_evaluation_new.dart';
import 'package:sed_project/model/user_details.dart';
import 'package:sed_project/services/http_requests.dart';
class EvaluationFinalPage extends StatefulWidget {
  InitialAssets initialAssets;
  UserDetails userDetails;
  String businessId;


  EvaluationFinalPage(this.initialAssets,this.userDetails,this.businessId);

  @override
  _EvaluationFinalPageState createState() => _EvaluationFinalPageState();
}

class _EvaluationFinalPageState extends State<EvaluationFinalPage> {

  List<String> selectedExistingCustomerBase = [];
  List<String> selectedMarketChannel = [];
  List<String> selectedBranchAvailability = [];
  List<String> selectedFutureCustomerBase = [];
  List<EvaluationMainProductService> selectedMainProductsServices = [];
  List<QualityCertifications> selectedQualityCertifications = [];
  List<LegalInformation> selectedLegalInformation = [];
  List<AwardInformation> selectedAwardInformation = [];
  List<JobVacancies> selectedJobVacancies = [];
  List<FinancialLoan> selectedFinancialLoan = [];

  List<String> branchAvailableList = ['No Branch','Branch in Own District','Branch in Other District','Branch in Overseas','Decision Pending'];
  List<String> accountRecodingList = ['No Accounting records','Bill(Invoice)only','Basic Books(CashBook/Credit book etc.Manual)',
    'Basic Books(CashBook/Credit book etc.Coputerized)','Final accounting(Manual)','Final accounting(Accounting Software)','Decision Pending'];
  List<String> barcodeList = ['Yes','No','N/A','Decision Pending'];
  List<String> brandRegistrationList = ['Yes','No','N/A'];
  List<String> costingMethodList = ['Yes','No','Decision Pending'];
  List<String> customerCareList = ['No','Not satisfy','Below Average','Average','Good','Excellent','N/A','Decision Pending'];
  List<String> fbPageList = ['No Page','Not Satisfy','Below Average','Average','Good','Excellent','Decision Pending'];
  List<String> costingMethodRating = ['Non','Not Satisfy','Below Average','Average','Good','Excellent'];
  List<String> qualityOfFinalGoodsServices = ['Not satisfy','Below Average','Average','Good','Excellent','N/A','Decision Pending'];
  List<String> hRStrategyList = ['No','Finance','Non Finance','Both','N/A'];
  List<String> insuranceCoverForEmployeesList = ['Yes','No','N/A','Decision Pending'];
  List<String> issuingAppointmentLetterList = ['Yes','No','N/A','Decision Pending'];
  List<String> issuingSalarySlipList = ['Yes','No','N/A','Decision Pending'];
  List<String> nameBoardList = ['No','Not satisfy','Below Average','Average','Good','Excellent','N/A','Decision Pending'];
  List<String> onlineSalesList = ['Yes','No'];
  List<String> packingList = ['No','Not satisfy','Below Average','Average','Good','Excellent','N/A','Decision Pending'];
  List<String> payingEpfEtfList = ['Yes','No','N/A','Decision Pending'];
  List<String> practicingPricingMethodsList = ['Cost-plus Pricing','Markup Pricing','Demand-base Pricing','Competition-based Pricing', 'Decision Pending','None'];
  List<String> productAppearanceList = ['Not satisfy','Below Average','Average','Good','Excellent','N/A','Decision Pending'];
  List<String> productionTechnologyList = ['Manual','Machinery','High technology','Both manual and Machinery','Decision Pending'];
  List<String> rawMaterialStockMaintainList = ['Not satisfy','Below Average','Average','Good','Excellent','N/A','Decision Pending'];
  List<String> rawMatarialList = ['Locally','Internationally','Locally and Internationally','N/A'];
  List<String> serviceAgreementSigningList = ['Yes','No','N/A','Decision Pending'];
  List<String> visitingCardList = ['No','Not Satisfty','Below Average','Average','Good','Excellent','Decision Pending'];
  List<String> webSiteList = ['No','yes','Decision Pending'];
  List<String> cSRActivitiesList = ['No','Below 50,000','50,001-100,000','100,001-150,000','150,001-200,000','200,001-250,000',
    '250,001-300,000','300,001-500,000','Above 500,000'];
  List<String> customerComplainsList = ['No Complains','Few Complains','More Complains','Decision Pending'];
  List<String>  hRWelfareList = ['Yes','No','N/A','Decision Pending'];
  List<String> maintainingServiceManualList = ['No','Yes','N/A'];
  List<String> marketingObjectiveList = ['No','Yes','No Idea','Developed By SED'];
  List<String> minimumPhysicalFacilityList = ['Adequate','Inadequate','N/A','Decision Pending'];
  List<String> timeConsumingList = ['Spend more than Standard','Spend standard time','Spend less than standard','N/A','Decision Pending'];
  List<String> transportFacilitiesList = ['No','Own Vehicle','Haired Vehicle','Public Transport','Above All','N /A'];
  List<String> visionAndMissionOfBusinessList = ['No','yes','no Idea','Developed by SED'];

  List<String> marketChannelList = [];
  List<int> selectBranchAvailability = [];
  List<int> selectmarketChannel = [];




  final marketStrategyController = TextEditingController();
  final marketAreaController = TextEditingController();

  final productServiceNameController = TextEditingController();
  final productionQtyperMonthController = TextEditingController();
  final salesQtyPerMonthController = TextEditingController();

  final qualityStandardYearController = TextEditingController();

  final legalYearController = TextEditingController();

  final financialYearController = TextEditingController();
  final financialAmountController = TextEditingController();
  final financialReasonController = TextEditingController();

  final noOfTrainedEmployeesController = TextEditingController();
  final noOfSalaryReceivedEmployeesController = TextEditingController();
  final noOfNotPaidEmployeesController = TextEditingController();
  final noOfNotTrainedEmployeesController = TextEditingController();

  final jobTitleController = TextEditingController();
  final noOfVacanciesController = TextEditingController();
  final descriptionController = TextEditingController();

  final describeTaxController = TextEditingController();
  final evaluationOfficerSuggestionController = TextEditingController();

  final collOfficerNameController = TextEditingController();
  final collOfficerNicController = TextEditingController();
  final collOfficerDesigController = TextEditingController();

  final awardOrgController = TextEditingController();
  final awardYearController = TextEditingController();



  String qualityOfFinalGoodsService;
  String rawMaterialStockMaintain;
  String productAppearance;
  String productionTechnology;
  String rawMaterialQuality;
  String productServiceProcesses;
  String maintainingServiceManual;
  String customerDatabase;
  String minimumPhysicalFacility;
  String timeConsuming;
  String marketingObjective;
  String visionAndMissionOfBusiness;
  String csrActivities;
  String existingCustomerBase;
  String transportFacilities;
  String dropDownMarketChannelValue;
  String dropDownBranchAvailabilityValue;
  String dropDownFutureCustomerBaseValue;
  String dropDownOnlineSalesValue;
  String dropDownFacebookPageValue;
  String dropDownBarcodeValue;
  String dropDownCustomerComplainsValue;
  String dropDownBrandNameValue;
  String dropDownVisitingCardValue;
  String dropDownBrandRegistrationValue;
  String dropDownLogoValue;
  String dropDownWebSiteValue;
  String dropDownNameBoardValue;
  String dropDownCustomerCareValue;
  String dropDownPackingValue;
  String dropDownLabelValue;
  String productServiceUnitDropDown;
  String qualityStandardNameDropDown;
  String rawMatarialSupplyDropDown;
  String legalRequirementDropDown;
  String legalInstituteDropDown;
  String statusDropDown;
  String awardLevel;
  String awardType;
  String loanBank;
  String loanStatus;

  String payingEPFETFDropDown;
  String serviceAgreementSigningDropDown;
  String issuingSalarySlipDropDown;
  String insuranceCoverForEmployees;
  String hRStrategy;
  String issuingAppointmentLetter;
  String hRWelfare;

  String planAvailability;
  String savingsAccountAvailability;
  String accountRecoding;
  String currentAccountAvailability;
  String jobType;

  String practiceCostingMethods;
  String payingTax;
  String officerRating;
  String officerRating2;
  String practicingPricingMethods;

  String grade="";
  int mark=0;






  bool handBills=false;
  bool tvAds=false;
  bool wordOfMouth=false;
  bool posters=false;
  bool socialMedia=false;
  bool banners=false;
  bool radioAds=false;
  bool newsPaperAds=false;
  bool Others=false;
  bool qualityCerYes=false;
  bool qualityCerNo=false;
  bool awardInfoYes=false;
  bool awardInfoNo=false;
  bool loanObtainedYes=false;
  bool loanObtainedNo=false;
  bool jobVacancyYes=false;
  bool jobVacancyNo=false;
  bool valueCheck = false;
  bool checkPraticeCosting=false;
  bool checkPayingTax=false;

  Future sendEvaluationData() async{
    InsertEvaluationNew insertEvaluation=InsertEvaluationNew(
        loginId: widget.userDetails.LoginId.toString(),
        accountandRe:accountRecodingList.indexOf(accountRecoding).toString(),
        bankSavingACAvailability:1.toString(),
        barcode:barcodeList.indexOf(dropDownBarcodeValue).toString(),
        branchAvailability: "",
        brandName: dropDownBrandNameValue,
        brandRegistration:brandRegistrationList.indexOf(dropDownBrandRegistrationValue).toString(),
        businessId: int.tryParse(widget.businessId).toString(),
        cashTotalValue:1.toString(),
        costingMethodAvailability:costingMethodList.indexOf(practiceCostingMethods).toString(),
        costingMethodRating:costingMethodRating.indexOf(officerRating2).toString(),
        creditorsTotalValue: int.tryParse(widget.initialAssets.creditorsIncome).toString(),
        customerCare:customerCareList.indexOf(dropDownCustomerCareValue).toString(),
        debtorsTotalValue:int.tryParse(widget.initialAssets.debitorsIncome).toString(),
        fbPage: fbPageList.indexOf(dropDownFacebookPageValue).toString(),
        finalGoodQuality:qualityOfFinalGoodsServices.indexOf(qualityOfFinalGoodsService).toString(),
        finishedStockTotalValue:int.tryParse(widget.initialAssets.finishedStocksIncome).toString(),
        furnitureAndFittingsTotalValue:int.tryParse(widget.initialAssets.funitureIncome).toString(),
        hrStrategy:hRStrategyList.indexOf(hRStrategy).toString(),
        insuranceCover:insuranceCoverForEmployeesList.indexOf(insuranceCoverForEmployees).toString(),
        issuingAppoinmentLetter: issuingAppointmentLetterList.indexOf(issuingAppointmentLetter).toString(),
        issuingSalarySlip:issuingSalarySlipList.indexOf(issuingSalarySlipDropDown).toString(),
        lable:1.toString(),
        landAndBuildingTotalValue: int.tryParse(widget.initialAssets.landAndBuildingIncome).toString(),
        loanObtained: selectedFinancialLoan.length.toString(),
        machinesTotalValue:int.tryParse(widget.initialAssets.machineAndEquipIncome).toString(),
        marketArea: marketAreaController.text.toString(),
        marketChannel: "",
        marketStrategy:marketStrategyController.text.toString(),
        monthlyExpenses:int.tryParse(widget.initialAssets.monthlyExpensesIncome).toString(),
        monthlySalesIncomeCat:int.tryParse(widget.initialAssets.monthlySalesIncome).toString(),
        motorVehiclesTotalValue:int.tryParse(widget.initialAssets.vehiclesIncome).toString(),
        nameBoard:nameBoardList.indexOf(dropDownNameBoardValue).toString(),
        noOfNotTrainedEMP: int.tryParse(noOfNotTrainedEmployeesController.text.toString()).toString(),
        noOfPaidEmployees: int.tryParse(noOfNotPaidEmployeesController.text.toString()).toString(),
        noOfSalaryReceivedEmployees:1.toString(),
        noOfTrainedEMP:(noOfTrainedEmployeesController.text.toString()),
        onlineSales:onlineSalesList.indexOf(dropDownOnlineSalesValue).toString(),
        packing:packingList.indexOf(dropDownPackingValue).toString(),
        payingEpfEtf:payingEpfEtfList.indexOf(payingEPFETFDropDown).toString(),
        pricingMethod:practicingPricingMethodsList.indexOf(practicingPricingMethods).toString(),
        pricingMethodRating:costingMethodRating.indexOf(officerRating2).toString(),
        productAppearance: productAppearanceList.indexOf(productAppearance).toString(),
        productionTechnology:productionTechnologyList.indexOf(productionTechnology).toString(),
        qualityStandard:selectedQualityCertifications.length.toString(),
        rawMaterialQuality:1.toString(),
        rawMaterialStockMaintain:rawMaterialStockMaintainList.indexOf(rawMaterialStockMaintain).toString(),
        rawMaterial:rawMatarialList.indexOf(rawMatarialSupplyDropDown).toString(),
        serviceAgreementSiging:serviceAgreementSigningList.indexOf(serviceAgreementSigningDropDown).toString(),
        targetCustomer: selectedExistingCustomerBase.length.toString(),
        totalAssets:int.tryParse(widget.initialAssets.totalInvestments).toString(),
        visitingCard:visitingCardList.indexOf(dropDownVisitingCardValue).toString(),
        webSite:webSiteList.indexOf(dropDownWebSiteValue).toString(),
        sedOfficerComments:describeTaxController.text.toString(),
        csrActivites: cSRActivitiesList.indexOf(csrActivities).toString(),
        customerComplains: customerComplainsList.indexOf(dropDownCustomerComplainsValue).toString(),
        hrwelfare:hRWelfareList.indexOf(hRWelfare).toString(),
        maintainingServiceManual:maintainingServiceManualList.indexOf(maintainingServiceManual).toString(),
        managingCurrentAcount: 1.toString(),
        marketingObjective: marketingObjectiveList.indexOf(marketingObjective).toString(),
        minimumPhysicalfacility:minimumPhysicalFacilityList.indexOf(minimumPhysicalFacility).toString(),
        otherAssets:int.tryParse(widget.initialAssets.otherAssetsIncome).toString(),
        productProcesses:1.toString(),
        timeConsuming:timeConsumingList.indexOf(timeConsuming).toString(),
        transportfacilities: transportFacilitiesList.indexOf(transportFacilities).toString(),
        visionMission:visionAndMissionOfBusinessList.indexOf(visionAndMissionOfBusiness).toString(),
        salesIncomeNo: 1.toString()
    );

    Response evaluationResponse = (await ServerRequests().sendEvaluation(context, insertEvaluation));
    Map map = jsonDecode(evaluationResponse.body);
    Map data = map['data'];

    grade=data['grade'];
    print('grade is '+grade);
    mark=data['mark'];





  }


  Future showSuccessDialog(BuildContext context) async {
    Widget continueButton = TextButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.of(context)
          ..pop()
          ..pop()..pop()..pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Data saved successfully"),
      content: Text("Your Grade is "+grade+' and your mark is '+mark.toString()),
      actions: [
        continueButton,
      ],
    );


    // show the dialog
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future showAlertDialog(BuildContext context) async {
    Widget continueButton = TextButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Alert!"),
      content: Text("Please enter all fields!"),
      actions: [
        continueButton,
      ],
    );


    // show the dialog
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
          return alert;
      },
    );
  }

  showAlertInfoDialog(BuildContext context,String text) async {
    Widget continueButton = TextButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Alert!"),
      content: Text(text),
      actions: [
        continueButton,
      ],
    );


    // show the dialog
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      backgroundColor: Colors.blue,
      content: Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      action: SnackBarAction(
        label: 'Ok',
        textColor: Colors.white,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }



   bool checkAllValidations(){
    if(qualityOfFinalGoodsService==null || rawMaterialStockMaintain==null || productAppearance==null ||
        productionTechnology==null || rawMaterialQuality==null || productServiceProcesses==null){
      showAlertInfoDialog(context, "Please fill all Product and Service Evaluation Fields");
      return false;
    }else if(maintainingServiceManual==null || customerDatabase==null || minimumPhysicalFacility==null || timeConsuming==null){
      showAlertInfoDialog(context, "Please fill all Service Evaluation Fields");
      return false;
    }else if(marketingObjective==null || visionAndMissionOfBusiness==null || csrActivities==null || selectedExistingCustomerBase.isEmpty
    || transportFacilities==null || selectedMarketChannel.isEmpty || selectedBranchAvailability.isEmpty || selectedFutureCustomerBase.isEmpty ||
    marketStrategyController.text.isEmpty || marketAreaController.text.isEmpty){
      showAlertInfoDialog(context, "Please fill all Marketing Information Fields");
      return false;
    }else if(dropDownOnlineSalesValue==null || dropDownFacebookPageValue==null || dropDownBarcodeValue==null || dropDownCustomerComplainsValue==null ||
        dropDownBrandNameValue==null || dropDownVisitingCardValue==null || dropDownBrandRegistrationValue==null || dropDownLogoValue==null ||
        dropDownWebSiteValue==null || dropDownNameBoardValue==null || dropDownCustomerCareValue==null || dropDownPackingValue==null ||
        dropDownLabelValue==null){
      showAlertInfoDialog(context, "Please fill all Promotional Information Fields");
      return false;
    }else if(planAvailability==null || savingsAccountAvailability==null || accountRecoding==null || currentAccountAvailability==null){
      showAlertInfoDialog(context, "Please fill all Financial Information Fields");
      return false;
    }else if(loanObtainedYes && selectedFinancialLoan.isEmpty){
      showAlertInfoDialog(context, "Please add Financial loan obtained information");
      return false;
    }else if(noOfSalaryReceivedEmployeesController.text.isEmpty || noOfTrainedEmployeesController.text.isEmpty || noOfNotPaidEmployeesController.text.isEmpty
    || noOfNotTrainedEmployeesController.text.isEmpty || payingEPFETFDropDown==null || serviceAgreementSigningDropDown==null || issuingSalarySlipDropDown==null ||
    insuranceCoverForEmployees==null || hRStrategy==null || hRWelfare==null || issuingAppointmentLetter==null){
      showAlertInfoDialog(context, "Please fill all Human Resource information");
      return false;
    }else if(!jobVacancyYes && !jobVacancyNo){
      showAlertInfoDialog(context, "Please select an option for Job vacancies");
      return false;
    }else if(!handBills && !tvAds && !wordOfMouth && !posters && !newsPaperAds && !socialMedia && !banners && !radioAds && !Others){
      showAlertInfoDialog(context, "Please add a Main Promotional Tools");
      return false;
    }else if(jobVacancyYes && selectedJobVacancies.isEmpty){
      showAlertInfoDialog(context, "Please add Job vacancies information");
      return false;
    }else if(selectedMainProductsServices.isEmpty){
      showAlertInfoDialog(context, "Please add  Main Products/Services information");
      return false;
    }else if(rawMatarialSupplyDropDown==null ){
      showAlertInfoDialog(context, "Please add supply of Raw Material information");
      return false;
    }else if(!qualityCerYes && !qualityCerNo ){
      showAlertInfoDialog(context, "Please select an option for Quality Certifications");
      return false;
    }else if(qualityCerYes && selectedQualityCertifications.isEmpty){
      showAlertInfoDialog(context, "Please add Quality Certification information");
      return false;
    }else if(selectedLegalInformation.isEmpty){
      showAlertInfoDialog(context, "Please add Legal Information");
      return false;
    }else if(awardInfoYes && selectedAwardInformation.isEmpty){
      showAlertInfoDialog(context, "Please add Award Information");
      return false;
    }else if(!awardInfoYes && !awardInfoNo){
      showAlertInfoDialog(context, "Please select an option for Award Information");
      return false;
    }else if(practiceCostingMethods==null){
      showAlertInfoDialog(context, "Please add a Practice Costing Method");
      return false;
    }else if(payingTax==null){
      showAlertInfoDialog(context, "Please add  Paying Tax");
      return false;
    }else if(checkPraticeCosting && officerRating==null ){
      showAlertInfoDialog(context, "Please add  Officer Rating");
      return false;
    }else if(checkPayingTax && describeTaxController.text.isEmpty){
      showAlertInfoDialog(context, "Please Describe your tax");
      return false;
    }else if(practicingPricingMethods==null || evaluationOfficerSuggestionController.text.isEmpty || officerRating2==null){
      showAlertInfoDialog(context, "Please fill all Costing & Pricing information");
      return false;
    }else if(!valueCheck && collOfficerNameController.text.isEmpty && collOfficerNicController.text.isEmpty && collOfficerDesigController.text.isEmpty){
      showAlertInfoDialog(context, "Please fill all Collected Officer information");
      return false;
    }else{
      return true;
    }
  }

  Widget dataAwardInformationTable(){
    return Column(
      children: [
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Table(
            textDirection: TextDirection.ltr,
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border:TableBorder.all(width: 1.0,color: Colors.blue),
            columnWidths: {
              0: FixedColumnWidth(100.0),
              1: FixedColumnWidth(100.0)
            },
            children: [
              TableRow(
                  children: [
                    Text("Award Level"),
                    Text("Award Type"),
                    Text("Organization"),
                    Text("Year"),
                  ]
              ),
              for(var item in selectedAwardInformation )  TableRow(children: [
                Text(item.awardLevel),
                Text(item.awardType),
                Text(item.organization),
                Text(item.year),
              ])
            ],
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            SizedBox(width: 10,),
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () async {
                  try {
                    await showAwardInfoDialog(context);
                    setState(() {});
                  } catch (error) {}
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () async {
                  try {
                    selectedAwardInformation.removeLast();
                    setState(() {});
                  } catch (error) {}
                },
                child: const Text(
                  'delete',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  Future showLegalInfoDialog(BuildContext context) async {
    AlertDialog infoDialog = AlertDialog(
      content: StatefulBuilder(builder:(context,setState){
        return Form(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'Legal Info',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 20, // thickness of the line
                      color: Colors.black, // The color to use when painting the line.
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Row(
                children: [
                  Text(
                    'Legal Requirement',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      hint: legalRequirementDropDown == null || legalRequirementDropDown == ''
                          ? Text('--Select--')
                          : Text(
                        legalRequirementDropDown,
                        style: TextStyle(color: Colors.grey),
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.grey),
                      items: ['Environment Certification','Forestry Certification','Trade License','Gem and Jewelry Authority',
                        'Industrial certification','Export license','Import license'
                        ,'Registration of Sri Lanka Ayurveda Department','Certificate of National Dangerous Drugs Control Board','Forest certification ',
                        'Recommendation of PHI','Certificate','License','SLS','SLS Green','GMP','Vidatha GMP','Other'].map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          legalRequirementDropDown = val;
                          setState(() {});
                        },

                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    'Legal Institute',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      hint: legalInstituteDropDown == null || legalInstituteDropDown == ''
                          ? Text('--Select--')
                          : Text(
                        legalInstituteDropDown,
                        style: TextStyle(color: Colors.grey),
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.grey),
                      items: ['Export development Board','Sri Lanka Environment Authority','Sri Lanka gen and jewelry authority',
                        'Pradeshiya Sabha','Geological Survey and Mines Bureau','Provincial Council',
                        'Department of Ayurveda','National Dangerous Drugs Control Board'
                        ,'Department of Forests','PHI office particular area','Provincial Industrial Department','Tea Development Board','Rubber Development',
                        'Tea Development Board','Sri Lanka Standards institute ','Vidatha Centre','Other'].map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          legalInstituteDropDown = val;
                          setState(() {});
                        },

                        );
                      },
                    ),
                  ),

                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    'Status',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      hint: statusDropDown == null || statusDropDown == ''
                          ? Text('--Select--')
                          : Text(
                        statusDropDown,
                        style: TextStyle(color: Colors.grey),
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.grey),
                      items: ['Applied','Not Applied','Pending','Obtained','N/A'].map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          statusDropDown = val;
                          setState(() {});
                        },

                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    'Year',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      maxLength: 4,
                      style: TextStyle(color: Colors.grey),
                      controller: legalYearController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        hintText: 'Year',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          print(value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 60,),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        legalYearController.clear();
                        legalInstituteDropDown='';
                        legalRequirementDropDown='';
                        statusDropDown='';
                        Navigator.pop(context);
                        setState(() {});
                      } catch (error) {}
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        if(legalYearController.text.isNotEmpty && legalInstituteDropDown!=null && legalRequirementDropDown!=null && statusDropDown!=null){
                          selectedLegalInformation.add(LegalInformation(legalRequirementDropDown, legalInstituteDropDown, statusDropDown,legalYearController.text));
                          legalYearController.clear();
                          legalInstituteDropDown='';
                          legalRequirementDropDown='';
                          statusDropDown='';
                          setState(() {});
                          Navigator.pop(context);
                        }else{
                          showAlertDialog(context);
                        }

                      } catch (error) {}
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),


          ],
        ));
      })
    );

    // show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return infoDialog;
      },
    );
  }

  Widget dataLegalInformationTable(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            textDirection: TextDirection.ltr,
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border:TableBorder.all(width: 1.0,color: Colors.blue),
            columnWidths: {
              0: FixedColumnWidth(100.0),
              1: FixedColumnWidth(100.0)
            },
            children: [
              TableRow(
                  children: [
                    Text("Legal Requirement"),
                    Text("Institute"),
                    Text("Status"),
                    Text("Year"),
                  ]
              ),
              for(var item in selectedLegalInformation )  TableRow(children: [
                Text(item.legalRequirement),
                Text(item.institute),
                Text(item.status),
                Text(item.year),
              ])
            ],
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            SizedBox(width: 10,),
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () async {
                  try {
                    await showLegalInfoDialog(context);
                    setState(() {});
                  } catch (error) {}
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () async {
                  try {
                    selectedLegalInformation.removeLast();
                    setState(() {});
                  } catch (error) {}
                },
                child: const Text(
                  'delete',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  Future showQualityStandardDialog(BuildContext context) async {
    AlertDialog infoDialog = AlertDialog(
      content: StatefulBuilder(builder: (context,setState){
        return Form(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'Quality Standard',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 20, // thickness of the line
                      color: Colors.black, // The color to use when painting the line.
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Row(
                children: [
                  Text(
                    'Name:',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      hint: qualityStandardNameDropDown == null || qualityStandardNameDropDown == ''
                          ? Text('--Select--')
                          : Text(
                        qualityStandardNameDropDown,
                        style: TextStyle(color: Colors.grey),
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.grey),
                      items: ['Certifications ofLocal institute','GMP','SLS','Certifications(ISO 9001)',
                        'Environment Management Systems certification(ISO 14001) ',
                        'Food safety assurance(ISO 22000 and HACCP as per SLS 1266)'
                        ,'Occupational health and Safety Management system(OHSAS 18001)','Social Accountability(SA 8000)','Other'].map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          qualityStandardNameDropDown = val;
                          setState(() {});
                        },

                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    'Year',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      maxLength: 4,
                      style: TextStyle(color: Colors.grey),
                      controller: qualityStandardYearController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                        hintText: 'Year',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          print(value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 40,),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        qualityStandardYearController.clear();
                        qualityStandardNameDropDown='';
                        Navigator.pop(context);
                        setState(() {});
                      } catch (error) {}
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        if(qualityStandardYearController.text.isNotEmpty && qualityStandardNameDropDown!=null ){
                          selectedQualityCertifications.add(QualityCertifications(qualityStandardNameDropDown,qualityStandardYearController.text,));
                          qualityStandardYearController.clear();
                          qualityStandardNameDropDown='';
                          setState(() {});
                          Navigator.pop(context);
                        }else{
                          showAlertDialog(context);
                        }

                      } catch (error) {}
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),


          ],
        ));
      }),
    );

    // show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return infoDialog;
      },
    );
  }

  Widget dataQualityCertificationsTable(){
    return Column(
      children: [
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Table(
            textDirection: TextDirection.ltr,
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border:TableBorder.all(width: 1.0,color: Colors.blue),
            columnWidths: {
              0: FixedColumnWidth(200.0),
              1: FixedColumnWidth(200.0)
            },
            children: [
              TableRow(
                  children: [
                    Text("Name"),
                    Text("Year"),
                  ]
              ),
              for(var item in selectedQualityCertifications )  TableRow(children: [
                Text(item.name),
                Text(item.year),
              ])
            ],
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            SizedBox(width: 10,),
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () async {
                  try {
                    await showQualityStandardDialog(context);
                    setState(() {});
                  } catch (error) {}
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () async {
                  try {
                    selectedQualityCertifications.removeLast();
                    setState(() {});
                  } catch (error) {}
                },
                child: const Text(
                  'delete',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  Future showMainProductsServicesDialog(BuildContext context) async {
    AlertDialog infoDialog = AlertDialog(
      content: StatefulBuilder(builder: (context,setState){
        return Form(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'Add Product/Services',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 20, // thickness of the line
                      color: Colors.black, // The color to use when painting the line.
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Row(
                children: [
                  Text(
                    'Name:',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.grey),
                      controller: productServiceNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          print(value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    'Unit',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      hint: productServiceUnitDropDown == null || productServiceUnitDropDown == ''
                          ? Text('--Select--')
                          : Text(
                        productServiceUnitDropDown,
                        style: TextStyle(color: Colors.grey),
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.grey),
                      items: ['Kg','Grame','Ltr','Bottle','Meter','Dozen','Hours'
                        ,'Pieces','Packets','Plates','Rooms','Persons','Minutes','Days','Feet','Sq.Feet','Items','Unit','Cups'].map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          productServiceUnitDropDown = val;
                          setState(() {});
                        },

                        );
                      },
                    ),
                  ),

                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    'Production Qty \nper Month:',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.grey),
                      controller: productionQtyperMonthController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Production Qty per Month',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          print(value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    'Sales Qty per Month:',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.grey),
                      controller: salesQtyPerMonthController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Sales Qty per Month',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          print(value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 40,),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        productServiceNameController.clear();
                        productServiceUnitDropDown='';
                        productionQtyperMonthController.clear();
                        salesQtyPerMonthController.clear();
                        Navigator.pop(context);
                        setState(() {});
                      } catch (error) {}
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        if(productServiceNameController.text.isNotEmpty && productServiceUnitDropDown!=null &&
                            productionQtyperMonthController.text.isNotEmpty &&
                            salesQtyPerMonthController.text.isNotEmpty ){
                          selectedMainProductsServices.add(EvaluationMainProductService(productServiceNameController.text, productServiceUnitDropDown,
                              productionQtyperMonthController.text, salesQtyPerMonthController.text));
                          productServiceNameController.clear();
                          productServiceUnitDropDown='';
                          productionQtyperMonthController.clear();
                          salesQtyPerMonthController.clear();
                          setState(() {});
                          Navigator.pop(context);
                        }else{
                          showAlertDialog(context);
                        }

                      } catch (error) {}
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
      })
    );

    // show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return infoDialog;
      },
    );
  }

  Widget dataMainProductsTable(){
    return Column(
      children: [
        SizedBox(height: 10,),
        Row(
          children: [
            SizedBox(width: 10,),
            Text(
              "Main Products/Services",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),

          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            textDirection: TextDirection.ltr,
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border:TableBorder.all(width: 1.0,color: Colors.blue),
            columnWidths: {
              0: FixedColumnWidth(100.0),
              1: FixedColumnWidth(100.0)
            },
            children: [
              TableRow(
                  children: [
                    Text("Name"),
                    Text("Unit"),
                    Text("Production Qty per Month"),
                    Text("Sales Qty per Month"),
                  ]
              ),
              for(var item in selectedMainProductsServices )  TableRow(children: [
                Text(item.name),
                Text(item.unit),
                Text(item.productionQty),
                Text(item.salesQty),
              ])
            ],
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            SizedBox(width: 10,),
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () async {
                  try {
                    await showMainProductsServicesDialog(context);
                    setState(() {});
                  } catch (error) {}
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () async {
                  try {
                    selectedMainProductsServices.removeLast();
                    setState(() {});
                  } catch (error) {}
                },
                child: const Text(
                  'delete',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  Future showJobVacanciesDialog(BuildContext context) async {
    AlertDialog infoDialog = AlertDialog(
      content: StatefulBuilder(builder: (context, setState) {
        String selectedValue;
        return Form(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'Job Vacancies',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 20, // thickness of the line
                      color: Colors.black, // The color to use when painting the line.
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Row(
                children: [
                  Text(
                    'Job Title',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.grey),
                      controller: jobTitleController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Job Title',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          print(value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    'No of Vacancies',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.grey),
                      controller: noOfVacanciesController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'No of Vacancies',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          print(value);
                        });
                      },
                    ),
                  ),

                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    'Type',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      hint: jobType == null || jobType == ''
                          ? Text('--Select--')
                          : Text(
                        jobType,
                        style: TextStyle(color: Colors.grey),
                      ),
                      value: selectedValue,
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.grey),
                      items: ['Trained','Not Trained ',
                      ].map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          jobType = val;
                          selectedValue=val;
                          setState(() {});
                        },

                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: Row(
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.grey),
                      controller: descriptionController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Description',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          print(value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 40,),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        jobTitleController.clear();
                        noOfVacanciesController.clear();
                        descriptionController.clear();
                        jobType='';
                        Navigator.pop(context);
                        setState(() {});
                      } catch (error) {}
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 40,),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        if(jobTitleController.text.isNotEmpty && noOfVacanciesController.text.isNotEmpty && descriptionController.text.isNotEmpty && jobType!=null ){
                          selectedJobVacancies.add(JobVacancies(jobTitleController.text,noOfVacanciesController.text,jobType,descriptionController.text,));
                          jobTitleController.clear();
                          noOfVacanciesController.clear();
                          descriptionController.clear();
                          jobType='';
                          setState(() {});
                          Navigator.pop(context);
                        }else{
                          showAlertDialog(context);
                        }

                      } catch (error) {}
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
      },),
    );

    // show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return infoDialog;
      },
    );
  }


  Widget dataJobVacanciesTable(){
    return Column(
      children: [
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Table(
            textDirection: TextDirection.ltr,
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border:TableBorder.all(width: 1.0,color: Colors.blue),
            columnWidths: {
              0: FixedColumnWidth(100.0),
              1: FixedColumnWidth(100.0)
            },
            children: [
              TableRow(
                  children: [
                    Text("Job Title"),
                    Text("No of vacancies"),
                    Text("Type"),
                    Text("Description"),
                  ]
              ),
              for(var item in selectedJobVacancies )  TableRow(children: [
                Text(item.jobTitle),
                Text(item.noOfvacancies),
                Text(item.type),
                Text(item.description),
              ])
            ],
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            SizedBox(width: 10,),
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () async {
                  try {
                    await showJobVacanciesDialog(context);
                    setState(() {});
                  } catch (error) {}
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () async {
                  try {
                    selectedJobVacancies.removeLast();
                    setState(() {});
                  } catch (error) {}
                },
                child: const Text(
                  'delete',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }



  showFinancialInformationDialog(BuildContext context) async {
    AlertDialog infoDialog = AlertDialog(
      content: StatefulBuilder(builder: (context,setState){
        return Form(child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        'Loan Obtained',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),
                      Divider(
                        thickness: 20, // thickness of the line
                        color: Colors.black, // The color to use when painting the line.
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Row(
                  children: [
                    Text(
                      'Reason',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(color: Colors.grey),
                        controller: financialReasonController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Reason',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            print(value);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  children: [
                    Text(
                      'Amount:',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(color: Colors.grey),
                        controller: financialAmountController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Amount',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            print(value);
                          });
                        },
                      ),
                    ),

                  ],
                ),
              ),
              Center(
                child: Row(
                  children: [
                    Text(
                      'Bank',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: DropdownButton(
                        hint: loanBank == null || loanBank == ''
                            ? Text('--Select--')
                            : Text(
                          loanBank,
                          style: TextStyle(color: Colors.grey),
                        ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: TextStyle(color: Colors.grey),
                        items: ['Amana Bank','Axis Bank Ltd','Bank of Ceylon ','Bank of China Limited',
                          'Cargills Bank Ltd ','Citbank N.A','Commercial Bank','Deutsche Bank AG',
                          'DFCC Bank PLC','Habib Bank Ltd','Hatton National Bank PLC','ICICI Bank Ltd',
                          'Indian Bank','Indian Overseas Bank','MCB Bank Ltd','National Development Bank PLC','National Trust Bank PLC',
                          'Pan Asia Banking Corporation PLC',"People's Bank"
                        ].map(
                              (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(() {
                            loanBank = val;
                            setState(() {});
                          },

                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Row(
                  children: [
                    Text(
                      'Year',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        maxLength: 4,
                        style: TextStyle(color: Colors.grey),
                        controller: financialYearController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          hintText: 'Year',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            print(value);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Row(
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: DropdownButton(
                        hint: loanStatus == null || loanStatus == ''
                            ? Text('--Select--')
                            : Text(
                          loanStatus,
                          style: TextStyle(color: Colors.grey),
                        ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: TextStyle(color: Colors.grey),
                        items: ['Running','Arrears','Legal Action','Settled',
                        ].map(
                              (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(() {
                            loanStatus = val;
                            setState(() {});
                          },

                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 40,),
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: MaterialButton(
                      onPressed: () async {
                        try {
                          financialReasonController.clear();
                          financialAmountController.clear();
                          financialYearController.clear();
                          loanBank='';
                          loanStatus='';
                          Navigator.pop(context);
                          setState(() {});
                        } catch (error) {}
                      },
                      child: const Text(
                        'Close',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 40,),
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: MaterialButton(
                      onPressed: () async {
                        try {
                          if(financialReasonController.text.isNotEmpty && financialAmountController.text.isNotEmpty && financialYearController.text.isNotEmpty && loanBank!=null && loanStatus!=null ){
                            selectedFinancialLoan.add(FinancialLoan(financialReasonController.text,financialAmountController.text,loanBank,financialYearController.text,loanStatus));
                            financialReasonController.clear();
                            financialAmountController.clear();
                            financialYearController.clear();
                            loanBank='';
                            loanStatus='';
                            setState(() {});
                            Navigator.pop(context);
                          }else{
                            showAlertDialog(context);
                          }

                        } catch (error) {}
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ));
      })
    );

    // show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return infoDialog;
      },
    );
  }


  Widget _chipWidget(String label, Function removeFunction) {
    return Chip(
      labelPadding: EdgeInsets.zero,
      onDeleted: removeFunction,
      deleteIcon: const Icon(
        Icons.highlight_remove_outlined,
        size: 15,
      ),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          color: Colors.grey.shade600,
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      padding: const EdgeInsets.only(left: 20),
    );
  }


  Widget dataFinancialInformationTable(){
    return Column(
      children: [
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Table(
            textDirection: TextDirection.ltr,
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            border:TableBorder.all(width: 1.0,color: Colors.blue),
            columnWidths: {
              0: FixedColumnWidth(100.0),
              1: FixedColumnWidth(100.0)
            },
            children: [
              TableRow(
                  children: [
                    Text("Reason"),
                    Text("Amount"),
                    Text("Bank/Institute"),
                    Text("Year"),
                    Text("Status"),
                  ]
              ),
              for(var item in selectedFinancialLoan )  TableRow(children: [
                Text(item.reason),
                Text(item.amount),
                Text(item.bankInstitute),
                Text(item.year),
                Text(item.status),
              ])
            ],
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            SizedBox(width: 10,),
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () async {
                  try {
                    showFinancialInformationDialog(context);
                    setState(() {});
                  } catch (error) {}
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () async {
                  try {
                    selectedFinancialLoan.removeLast();
                    setState(() {});
                  } catch (error) {}
                },
                child: const Text(
                  'delete',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future showAwardInfoDialog(BuildContext context) async{
    AlertDialog infoDialog = AlertDialog(
      content:StatefulBuilder(builder:(context,setState){
        return  Form(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'Award Received',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 20, // thickness of the line
                      color: Colors.black, // The color to use when painting the line.
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Row(
                children: [
                  Text(
                    'Award Level:',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      hint: awardLevel == null || awardLevel == ''
                          ? Text('--Select--')
                          : Text(
                        awardLevel,
                        style: TextStyle(color: Colors.grey),
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.grey),
                      items: ['International','National','Provincial','District',].map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          awardLevel = val;
                          setState(() {});
                        },

                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    'Award Type:',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      hint: awardType == null || awardType == ''
                          ? Text('--Select--')
                          : Text(
                        awardType,
                        style: TextStyle(color: Colors.grey),
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.grey),
                      items: ['Gold','Silver','Bronze','Certificate','Participated for any'].map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          awardType = val;
                          setState(() {});
                        },

                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    'Organization',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.grey),
                      controller: awardOrgController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Organization',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          print(value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    'Year',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      maxLength: 4,
                      style: TextStyle(color: Colors.grey),
                      controller:awardYearController ,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        hintText: 'Year',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          print(value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 40,),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                       awardOrgController.clear();
                       awardYearController.clear();
                       awardLevel='';
                       awardType='';
                        Navigator.pop(context);
                        setState(() {});
                      } catch (error) {}
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        if(awardOrgController.text.isNotEmpty && awardLevel!=null && awardType!=null && awardYearController.text.isNotEmpty ){
                          selectedAwardInformation.add(AwardInformation(awardLevel,awardType,awardOrgController.text,awardYearController.text));
                          awardOrgController.clear();
                          awardYearController.clear();
                          awardLevel='';
                          awardType='';
                          Navigator.pop(context);
                        }else{
                          showAlertDialog(context);
                        }

                      } catch (error) {}
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
      })
    );

    // show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return infoDialog;
      },
    );
  }



  Widget searchResultDisplayUI()  {
    return Container(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  "Product And Service Evaluation",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 300,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            ' Quality Of Final Goods/Service',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              'Raw Material Stock Maintain(P/S)',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: qualityOfFinalGoodsService == null
                              ? Text('--Select--')
                              : Text(
                            qualityOfFinalGoodsService,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Not satisfy','Below Average','Average','Good','Excellent','N/A','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                qualityOfFinalGoodsService = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: rawMaterialStockMaintain == null
                              ? Text('--Select--')
                              : Text(
                            rawMaterialStockMaintain,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Not satisfy','Below Average','Average','Good','Excellent','N/A','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                rawMaterialStockMaintain = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Product Appearance',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Expanded(
                            child: Text(
                              'Production Technology(P/S)',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: productAppearance == null
                              ? Text('--Select--')
                              : Text(
                            productAppearance,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Not satisfy','Below Average','Average','Good','Excellent','N/A','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                productAppearance = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: productionTechnology == null
                              ? Text('--Select--')
                              : Text(
                            productionTechnology,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Manual','Machinery','High technology','Both manual and Machinery','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                productionTechnology = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Raw Material Quality(P/S)',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: Text(
                              'Product/Service Processes',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: rawMaterialQuality == null
                              ? Text('--Select--')
                              : Text(
                            rawMaterialQuality,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Not satisfy','Below Average','Average','Good','Excellent','N/A','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                rawMaterialQuality = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: productServiceProcesses == null
                              ? Text('--Select--')
                              : Text(
                            productServiceProcesses,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Formal','Informal','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                productServiceProcesses = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ) ,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  "Service Evaluation",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            ' Maintaining Service Manual',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: Text(
                              'Customer Database',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: maintainingServiceManual == null
                              ? Text('--Select--')
                              : Text(
                            maintainingServiceManual,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No','Yes','N/A'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                maintainingServiceManual = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: customerDatabase == null
                              ? Text('--Select--')
                              : Text(
                            customerDatabase,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Yes','No','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                customerDatabase = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Minimum Physical Facility',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Expanded(
                            child: Text(
                              'Time Consuming',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: minimumPhysicalFacility == null
                              ? Text('--Select--')
                              : Text(
                            minimumPhysicalFacility,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Adequate','Inadequate','N/A','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                minimumPhysicalFacility = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: timeConsuming == null
                              ? Text('--Select--')
                              : Text(
                            timeConsuming,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Spend more than Standard','Spend standard time','Spend less than standard','N/A','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                timeConsuming = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ) ,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  "Financial Information",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            ' Plan Availability',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 90,
                          ),
                          Expanded(
                            child: Text(
                              'Savings Account Availability',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: planAvailability == null
                              ? Text('--Select--')
                              : Text(
                            planAvailability,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No Business Plan','Have a Business Plan but not follow','Have MTK Plan only and follow'
                              'Have Production plan only and follow','Have Financial plan only and follow','Have HR plan only and follow'
                            ,'Have Complete plan and follow','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                planAvailability = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: savingsAccountAvailability == null
                              ? Text('--Select--')
                              : Text(
                            savingsAccountAvailability,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Yes','No'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                savingsAccountAvailability = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Account & Recoding',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Expanded(
                            child: Text(
                              'Current Account Availability',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: accountRecoding == null
                              ? Text('--Select--')
                              : Text(
                            accountRecoding,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No Accounting records','Bill(Invoice)only','Basic Books(CashBook/Credit book etc.Manual)',
                            'Basic Books(CashBook/Credit book etc.Coputerized)','Final accounting(Manual)','Final accounting(Accounting Software)','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                accountRecoding = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: currentAccountAvailability == null
                              ? Text('--Select--')
                              : Text(
                            currentAccountAvailability,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Yes','No'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                currentAccountAvailability = val;
                              },
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 17,),
                          Text(
                            "Loan Obtained: ",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text('Yes',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              leading: Radio(
                                value:true,
                                groupValue:loanObtainedYes ,
                                onChanged: ( value) {
                                  setState(() {
                                    loanObtainedYes=true;
                                    loanObtainedNo=false;
                                    print('yes');
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child:ListTile(
                              title: const Text('No',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              leading: Radio(
                                value: true,
                                groupValue: loanObtainedNo,
                                onChanged: ( value) {
                                  setState(() {
                                    loanObtainedNo=true;
                                    loanObtainedYes=false;
                                    print('No');
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      loanObtainedYes!=null && loanObtainedYes==true ? dataFinancialInformationTable():SizedBox()
                    ],
                  )
                ],
              ) ,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  "Marketing Information",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Marketing Objective',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 90,
                          ),
                          Expanded(
                            child: Text(
                              'Existing Customer Base',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: marketingObjective == null
                              ? Text('--Select--')
                              : Text(
                            marketingObjective,
                            style: TextStyle(color: Colors.blue),
                          ),
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No','Yes','No Idea','Developed By SED'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                marketingObjective = val;
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: existingCustomerBase == null
                              ? Text('--Select--')
                              : Text(
                            existingCustomerBase,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Around Village','Village fair and Around Village','Super market','Around own District',
                            'Around own and Near District','Island wide','International market '
                          ].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                existingCustomerBase = val;
                                selectedExistingCustomerBase.add(val);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  selectedExistingCustomerBase.isEmpty
                      ? const SizedBox()
                      : Wrap(
                    spacing: 6.0,
                    runSpacing: 6.0,
                    children: List.generate(
                        selectedExistingCustomerBase.length, (index) {
                      String temp = selectedExistingCustomerBase[index];
                      return _chipWidget(temp, () {
                        setState(() {
                          selectedExistingCustomerBase.removeAt(index);
                        });
                      });
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Vision and Mission of Business',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          Expanded(
                            child: Text(
                              'CSR Activities',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint:  visionAndMissionOfBusiness == null
                              ? Text('--Select--')
                              : Text(
                            visionAndMissionOfBusiness,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No','yes','no Idea','Developed by SED'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                visionAndMissionOfBusiness = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: csrActivities == null
                              ? Text('--Select--')
                              : Text(
                            csrActivities,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No','Below 50,000','50,001-100,000','100,001-150,000','150,001-200,000','200,001-250,000',
                            '250,001-300,000','300,001-500,000','Above 500,000'
                          ].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                csrActivities = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Market Strategy',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 113,
                          ),
                          Expanded(
                            child: Text(
                              'Branch Availability',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.grey),
                          controller: marketStrategyController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Market strategy',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              print(value);
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownBranchAvailabilityValue  == null
                              ? Text('--Select--')
                              : Text(
                            dropDownBranchAvailabilityValue ,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No Branch','Branch in Own District','Branch in Other District','Branch in Overseas','Decision Pending',
                          ].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownBranchAvailabilityValue  = val;
                                int index=branchAvailableList.indexOf(val);
                                print('Index is '+index.toString());
                                selectBranchAvailability.add(index);
                                selectedBranchAvailability.add(val);
                              },
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                  selectedBranchAvailability.isEmpty
                      ? const SizedBox()
                      : Wrap(
                    spacing: 6.0,
                    runSpacing: 6.0,
                    children: List.generate(
                        selectedBranchAvailability.length, (index) {
                      String temp = selectedBranchAvailability[index];
                      return _chipWidget(temp, () {
                        setState(() {
                          selectedBranchAvailability.removeAt(index);
                          selectBranchAvailability.removeAt(index);
                        });
                      });
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Transport Facilities',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Expanded(
                            child: Text(
                              'Market Channel',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: transportFacilities == null
                              ? Text('--Select--')
                              : Text(
                            transportFacilities,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No','Own Vehicle','Haired Vehicle','Public Transport','Above All','N /A'
                          ].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                transportFacilities = val;
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownMarketChannelValue  == null
                              ? Text('--Select--')
                              : Text(
                            dropDownMarketChannelValue ,
                            style: TextStyle(color: Colors.blue),
                          ),
                          iconSize: 30.0,
                          isExpanded: true,
                          style: TextStyle(color: Colors.blue),
                          items: ['Direct to customer','Retailer ->Consumer','Wholesaler->retailer->Customer',
                            'Agent/Broker->Wholesaler or Retailer->Customer','Other'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownMarketChannelValue  = val;
                                int index=selectedMarketChannel.indexOf(val);
                                selectmarketChannel.add(index);
                                selectedMarketChannel.add(val);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  selectedMarketChannel.isEmpty
                      ? const SizedBox()
                      : Wrap(
                    spacing: 6.0,
                    runSpacing: 6.0,
                    children: List.generate(
                        selectedMarketChannel.length, (index) {
                      String temp = selectedMarketChannel[index];
                      return _chipWidget(temp, () {
                        setState(() {
                          selectedMarketChannel.removeAt(index);
                          selectmarketChannel.removeAt(index);
                        });
                      });
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Market Area',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 140,
                          ),
                          Expanded(
                            child: Text(
                              'Future Customer Base',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.grey),
                          controller: marketAreaController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Market Area',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              print(value);
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownFutureCustomerBaseValue  == null
                              ? Text('--Select--')
                              : Text(
                            dropDownFutureCustomerBaseValue ,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Around Village','Village fair and Around Village','Super market','Around own District',
                            'Around own and Near District','Island wide','International market '
                          ].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownFutureCustomerBaseValue  = val;
                                selectedFutureCustomerBase.add(val);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  selectedFutureCustomerBase.isEmpty
                      ? const SizedBox()
                      : Wrap(
                    spacing: 6.0,
                    runSpacing: 6.0,
                    children: List.generate(
                        selectedFutureCustomerBase.length, (index) {
                      String temp = selectedFutureCustomerBase[index];
                      return _chipWidget(temp, () {
                        setState(() {
                          selectedFutureCustomerBase.removeAt(index);
                        });
                      });
                    }),
                  ),
                ],
              ) ,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  "Promotional Information",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Online Sales',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 140,
                          ),
                          Expanded(
                            child: Text(
                              'Customer Complains',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownOnlineSalesValue == null
                              ? Text('--Select--')
                              : Text(
                            dropDownOnlineSalesValue,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Yes','No'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownOnlineSalesValue = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownCustomerComplainsValue == null
                              ? Text('--Select--')
                              : Text(
                            dropDownCustomerComplainsValue,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No Complains','Few Complains','More Complains','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownCustomerComplainsValue = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Facebook Page',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 122,
                          ),
                          Expanded(
                            child: Text(
                              'Barcode',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownFacebookPageValue == null
                              ? Text('--Select--')
                              : Text(
                            dropDownFacebookPageValue,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No Page','Not Satisfy','Below Average','Average','Good','Excellent','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownFacebookPageValue = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownBarcodeValue == null
                              ? Text('--Select--')
                              : Text(
                            dropDownBarcodeValue,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Yes','No','N/A','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownBarcodeValue = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Brand Name',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 140,
                          ),
                          Expanded(
                            child: Text(
                              'Visiting Card',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownBrandNameValue == null
                              ? Text('--Select--')
                              : Text(
                            dropDownBrandNameValue,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Yes','No'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownBrandNameValue = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownVisitingCardValue == null
                              ? Text('--Select--')
                              : Text(
                            dropDownVisitingCardValue,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No','Not Satisfty','Below Average','Average','Good','Excellent','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownVisitingCardValue = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Brand Registration',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 105,
                          ),
                          Expanded(
                            child: Text(
                              'Logo',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownBrandRegistrationValue == null
                              ? Text('--Select--')
                              : Text(
                            dropDownBrandRegistrationValue,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Yes','No','N/A'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownBrandRegistrationValue = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownLogoValue == null
                              ? Text('--Select--')
                              : Text(
                            dropDownLogoValue,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No','Not Satisfy','N/A','Below Average','Average','Good','Excellent','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownLogoValue = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Web Site',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 160,
                          ),
                          Expanded(
                            child: Text(
                              'Name Board',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownWebSiteValue == null
                              ? Text('--Select--')
                              : Text(
                            dropDownWebSiteValue,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No','yes','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownWebSiteValue = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownNameBoardValue == null
                              ? Text('--Select--')
                              : Text(
                            dropDownNameBoardValue,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No','Not satisfy','Below Average','Average','Good','Excellent','N/A','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownNameBoardValue = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Customer Care',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 125,
                          ),
                          Expanded(
                            child: Text(
                              'Packing',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownCustomerCareValue == null
                              ? Text('--Select--')
                              : Text(
                            dropDownCustomerCareValue,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No','Not satisfy','Below Average','Average','Good','Excellent','N/A','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownCustomerCareValue = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownPackingValue == null
                              ? Text('--Select--')
                              : Text(
                            dropDownPackingValue,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No','Not satisfy','Below Average','Average','Good','Excellent','N/A','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownPackingValue = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Label',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: dropDownLabelValue == null
                              ? Text('--Select--')
                              : Text(
                            dropDownLabelValue,
                            style: TextStyle(color: Colors.blue),
                          ),
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No','Not satisfy','Below Average','Average','Good','Excellent','N/A','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                dropDownLabelValue = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ) ,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  "Human Resource",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'No Of Salary Received \nEmployees',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Expanded(
                            child: Text(
                              'No of Trained Employees',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.grey),
                          controller: noOfSalaryReceivedEmployeesController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'No Of Salary Received Employees',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              print(value);
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 45),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.grey),
                          controller: noOfTrainedEmployeesController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'No of Trained Employees',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              print(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'No Of Not Paid Employees',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: Text(
                              'No of Not Trained Employees',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.grey),
                          controller: noOfNotPaidEmployeesController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'No Of Not Paid Employees',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              print(value);
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 50),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.grey),
                          controller: noOfNotTrainedEmployeesController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'No of Not Trained Employees',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              print(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Paying EPF/ETF',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Expanded(
                            child: Text(
                              'Service Agreement Signing',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: payingEPFETFDropDown == null
                              ? Text('--Select--')
                              : Text(
                            payingEPFETFDropDown,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Yes','No','N/A'
                              'Decision Pending',].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                payingEPFETFDropDown = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: serviceAgreementSigningDropDown == null
                              ? Text('--Select--')
                              : Text(
                            serviceAgreementSigningDropDown,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Yes','No','N/A'
                              'Decision Pending',].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                serviceAgreementSigningDropDown = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            ' Issuing Salary Slip',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Expanded(
                            child: Text(
                              'Insurance Cover For Employees',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: issuingSalarySlipDropDown == null
                              ? Text('--Select--')
                              : Text(
                            issuingSalarySlipDropDown,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Yes','No','N/A'
                              'Decision Pending',].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                issuingSalarySlipDropDown = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: insuranceCoverForEmployees == null
                              ? Text('--Select--')
                              : Text(
                            insuranceCoverForEmployees,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Yes','No','N/A'
                              'Decision Pending',].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                insuranceCoverForEmployees = val;
                              },
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'HR Strategy',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 140,
                          ),
                          Expanded(
                            child: Text(
                              'HR Welfare',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: hRStrategy == null
                              ? Text('--Select--')
                              : Text(
                            hRStrategy,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No','Finance'
                              'Non Finance','Both','N/A'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                hRStrategy = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: hRWelfare == null
                              ? Text('--Select--')
                              : Text(
                            hRWelfare,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Yes','No','N/A'
                              'Decision Pending',].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                hRWelfare = val;
                              },
                            );
                          },
                        ),
                      ),


                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Issuing Appointment Letter',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: issuingAppointmentLetter == null
                              ? Text('--Select--')
                              : Text(
                            issuingAppointmentLetter,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Yes','No','N/A'
                              'Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                issuingAppointmentLetter = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 13,),
                          Text(
                            "Job Vacancies :",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text('Yes',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              leading: Radio(
                                value:true,
                                groupValue:jobVacancyYes ,
                                onChanged: ( value) {
                                  setState(() {
                                    jobVacancyYes=true;
                                    jobVacancyNo=false;
                                    print('yes');
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child:ListTile(
                              title: const Text('No',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              leading: Radio(
                                value: true,
                                groupValue: jobVacancyNo,
                                onChanged: ( value) {
                                  setState(() {
                                    jobVacancyNo=true;
                                    jobVacancyYes=false;
                                    print('No');
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      jobVacancyYes!=null && jobVacancyYes==true ? dataJobVacanciesTable():SizedBox(),

                    ],
                  )
                ],
              ) ,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  "Main Promotional Tools",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child:Column(
                children: [
                  ListTile(
                    title: const Text('Hand Bills',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                    leading: Checkbox(
                      value: handBills,
                      onChanged: (value) {
                        setState(() {
                          if(handBills){
                            handBills=false;
                            print('handBills false');
                            setState(() {});
                          }else{
                            handBills=true;
                            print('handBills true');
                            setState(() {});
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('TV Ads',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),),
                    leading: Checkbox(
                      value: tvAds,
                      onChanged: (value) {
                        setState(() {
                          if(tvAds){
                            tvAds=false;
                            print('tvAds false');
                            setState(() {});
                          }else{
                            tvAds=true;
                            print('tvAds true');
                            setState(() {});
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Word of Mouth'
                        , style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        )
                    ),
                    leading: Checkbox(
                      value: wordOfMouth,
                      onChanged: (value) {
                        setState(() {
                          if(wordOfMouth){
                            wordOfMouth=false;
                            print('wordOfMouth false');
                            setState(() {});
                          }else{
                            wordOfMouth=true;
                            print('wordOfMouth true');
                            setState(() {});
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Posters'
                        ,style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        )
                    ),
                    leading: Checkbox(
                      value: posters,
                      onChanged: (value) {
                        setState(() {
                          if(posters){
                            posters=false;
                            print('posters false');
                            setState(() {});
                          }else{
                            posters=true;
                            print('posters true');
                            setState(() {});
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Newspaper Ads'
                        , style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        )
                    ),
                    leading: Checkbox(
                      value: newsPaperAds,
                      onChanged: (value) {
                        setState(() {
                          if(newsPaperAds){
                            newsPaperAds=false;
                            print('newsPaperAds false');
                            setState(() {});
                          }else{
                            newsPaperAds=true;
                            print('newsPaperAds true');
                            setState(() {});
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Social Media'
                        , style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        )
                    ),
                    leading: Checkbox(
                      value: socialMedia,
                      onChanged: (value) {
                        setState(() {
                          if(socialMedia){
                            socialMedia=false;
                            print('socialMedia false');
                            setState(() {});
                          }else{
                            socialMedia=true;
                            print('socialMedia true');
                            setState(() {});
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Banners'
                        , style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        )
                    ),
                    leading: Checkbox(
                      value: banners,
                      onChanged: (value) {
                        setState(() {
                          if(banners){
                            banners=false;
                            print('banners false');
                            setState(() {});
                          }else{
                            banners=true;
                            print('banners true');
                            setState(() {});
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Radio Ads'
                        , style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        )
                    ),
                    leading: Checkbox(
                      value: radioAds,
                      onChanged: (value) {
                        setState(() {
                          if(radioAds){
                            radioAds=false;
                            print('radioAds false');
                            setState(() {});
                          }else{
                            radioAds=true;
                            print('radioAds true');
                            setState(() {});
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Others'
                        , style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        )
                    ),
                    leading:Checkbox(
                      value: Others,
                      onChanged: (value) {
                        setState(() {
                          if(Others){
                            Others=false;
                            print('Others false');
                            setState(() {});
                          }else{
                            Others=true;
                            print('Others true');
                            setState(() {});
                          }
                        });
                      },
                    ),
                  ),
                ],
              ) ,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  "Business Product/Service Information",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child:Column(
                children: [
                  dataMainProductsTable(),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        "Supply of Raw Material",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: rawMatarialSupplyDropDown == null
                              ? Text('--Select--')
                              : Text(
                            rawMatarialSupplyDropDown,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Locally','Internationally','Locally and Internationally','N/A'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(() {
                              rawMatarialSupplyDropDown = val;
                              setState(() {});
                            },

                            );
                          },
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        "Quality Certifications :",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text('Yes',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              leading: Radio(
                                value:true,
                                groupValue:qualityCerYes ,
                                onChanged: ( value) {
                                  setState(() {
                                    qualityCerYes=true;
                                    qualityCerNo=false;
                                    print('yes');
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child:ListTile(
                              title: const Text('No',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              leading: Radio(
                                value: true,
                                groupValue: qualityCerNo,
                                onChanged: ( value) {
                                  setState(() {
                                    qualityCerNo=true;
                                    qualityCerYes=false;
                                    print('No');
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  qualityCerYes!=null && qualityCerYes==true ? dataQualityCertificationsTable():SizedBox()
                ],
              ) ,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  "Legal Information",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child:Column(
                children: [
                  dataLegalInformationTable(),
                  SizedBox(height: 20,),
                ],
              ) ,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  "Award Information",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child:Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            " Award Received :",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text('Yes',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              leading: Radio(
                                value:true,
                                groupValue:awardInfoYes ,
                                onChanged: ( value) {
                                  setState(() {
                                    awardInfoYes=true;
                                    awardInfoNo=false;
                                    print('yes');
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child:ListTile(
                              title: const Text('No',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              leading: Radio(
                                value: true,
                                groupValue: awardInfoNo,
                                onChanged: ( value) {
                                  setState(() {
                                    awardInfoNo=true;
                                    awardInfoYes=false;
                                    print('No');
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  awardInfoYes!=null && awardInfoYes==true ? dataAwardInformationTable():SizedBox()
                ],
              ) ,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  "Costing & Pricing",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Practicing Costing Methods:',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: Text(
                              'Paying Tax',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: practiceCostingMethods == null
                              ? Text('--Select--')
                              : Text(
                            practiceCostingMethods,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Yes','No','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                practiceCostingMethods = val;
                                if(practiceCostingMethods=="Yes"){
                                  checkPraticeCosting=true;
                                  setState(() {});
                                }else{
                                  checkPraticeCosting=false;
                                }
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: payingTax == null
                              ? Text('--Select--')
                              : Text(
                            payingTax,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['No','Yes','Registered only','Applicable but not pay','Decision Pending'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(() {
                                payingTax = val;
                                if(payingTax=="Yes"){
                                  checkPayingTax=true;
                                  setState(() {});
                                }else{
                                  checkPayingTax=false;
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Officer rating :',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Expanded(
                            child: Text(
                              'Practicing Pricing Methods :',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(

                          hint: officerRating == null
                              ? Text('--Select--')
                              : Text(
                            officerRating,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Non','Not Satisfy','Below Average','Average',
                            'Good','Excellent'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: checkPraticeCosting ? (value)=> setState(() => officerRating = value) : null,
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: DropdownButton(
                          hint: practicingPricingMethods == null
                              ? Text('--Select--')
                              : Text(
                            practicingPricingMethods,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Cost-plus Pricing','Markup Pricing','Demand-base Pricing','Competition-based Pricing',
                            'Decision Pending','None'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged:(val) {
                            setState(
                                  () {
                                    practicingPricingMethods = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Officer rating:',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 130,
                          ),
                          Expanded(
                            child: Text(
                              'Describe your Tax:',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          hint: officerRating2 == null
                              ? Text('--Select--')
                              : Text(
                            officerRating2,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: ['Non','Not Satisfy','Below Average','Average',
                            'Good','Excellent'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                officerRating2 = val;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: TextFormField(
                          enabled: checkPayingTax,
                          style: TextStyle(color: Colors.grey),
                          controller: describeTaxController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Describe your tax',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              print(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Evaluation Officer’s/Consultancy Officer’s Comments & Suggestions',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.grey),
                          controller: evaluationOfficerSuggestionController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Evaluation Officer’s/Consultancy Officer’s Comments & Suggestions',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              print(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              controlAffinity:
                              ListTileControlAffinity.leading,
                              value: valueCheck,
                              title: Text(
                                "Collected Officer is same as the entered officer",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onChanged: (valueCheck) => setState(
                                      () => this.valueCheck = valueCheck),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  !valueCheck
                      ? Row(
                    children: [
                      SizedBox(width: 10),
                      SvgPicture.asset(
                        'assets/Icons/officer_icon.svg',
                        width: 15.84,
                        height: 19.839,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: collOfficerNameController,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '*Collected Officer Name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                            //hintText: 'Enter your Username'
                          ),
                        ),
                      ),
                    ],
                  )
                      : SizedBox(),
                  !valueCheck
                      ? Row(
                    children: [
                      SizedBox(width: 10),
                      SvgPicture.asset(
                        'assets/Icons/officer_icon.svg',
                        width: 15.84,
                        height: 19.839,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: collOfficerNicController,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '*Collected Officer Nic',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                            //hintText: 'Enter your Username'
                          ),
                        ),
                      ),
                    ],
                  )
                      : SizedBox(),
                  !valueCheck
                      ? Row(
                    children: [
                      SizedBox(width: 10),
                      SvgPicture.asset(
                        'assets/Icons/officer_icon.svg',
                        width: 15.84,
                        height: 19.839,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: collOfficerDesigController,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '*Collected Officer Designation',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                            //hintText: 'Enter your Username'
                          ),
                        ),
                      ),
                    ],
                  ) : SizedBox(),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 50,),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: MaterialButton(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Edit Initial Assets',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 50,),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: MaterialButton(
                          onPressed: () async {
                            bool validation=checkAllValidations();
                            if(validation){
                              await sendEvaluationData();
                              showSuccessDialog(context);
                            }
                          },
                          child: const Text(
                            'Save Data',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ) ,
            ),

          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: searchResultDisplayUI(),
      ),
    );
  }
}
