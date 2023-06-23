import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sed_project/model/evaluation_models/initial_assets.dart';
import 'package:sed_project/model/user_details.dart';

import 'evaluation_finalInfoPage.dart';

class EvaluationInitialAssetsScreen extends StatefulWidget {
  UserDetails userDetails;
  String businessId;

  EvaluationInitialAssetsScreen(this.userDetails,this.businessId);

  @override
  _EvaluationInitialAssetsScreenState createState() =>
      _EvaluationInitialAssetsScreenState();
}

class _EvaluationInitialAssetsScreenState extends State<EvaluationInitialAssetsScreen> {
  String todayDate = '';
  String landAndBuilding;
  String finishedStocks;
  DateTime date;
  String dateStr = '*Select a date';
  int totalInv = 0;

  final monthlySalesIncome = TextEditingController();
  final monthlyExpensesIncome = TextEditingController();
  final salesReceivesIncome = TextEditingController();
  final landAndBuildingIncome = TextEditingController();
  final finishedStocksIncome = TextEditingController();
  final vehiclesIncome = TextEditingController();
  final machineAndEquipIncome = TextEditingController();
  final funitureIncome = TextEditingController();
  final cashIncome = TextEditingController();
  final otherAssetsIncome = TextEditingController();
  final creditorsIncome = TextEditingController();
  final debitorsIncome = TextEditingController();

  final creditorsNoOfPersons = TextEditingController();
  final debitorsNoOfPersons = TextEditingController();

  final monthlySalesDesc = TextEditingController();
  final monthlyEnpensesDesc = TextEditingController();
  final salesreceivedEmpDesc = TextEditingController();
  final landBuildingDesc = TextEditingController();
  final finishedStocksDesc = TextEditingController();
  final vehiclesDesc = TextEditingController();
  final funitureAndFittingDesc = TextEditingController();
  final cashAndEquvalentDesc = TextEditingController();
  final machineAndEquipDesc = TextEditingController();
  final otherAssetsDesc = TextEditingController();
  final totalInvestments = TextEditingController();

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

  bool checkAllFields() {
    if (dateStr == null ||
        monthlySalesIncome.text.isEmpty ||
        monthlySalesDesc.text.isEmpty ||
        monthlyExpensesIncome.text.isEmpty ||
        monthlyEnpensesDesc.text.isEmpty ||
        salesReceivesIncome.text.isEmpty ||
        salesreceivedEmpDesc.text.isEmpty ||
        landAndBuildingIncome.text.isEmpty ||
        landBuildingDesc.text.isEmpty ||
        landAndBuilding == null ||
        finishedStocksIncome.text.isEmpty ||
        finishedStocks == null ||
        finishedStocksDesc.text.isEmpty ||
        vehiclesIncome.text.isEmpty ||
        vehiclesDesc.text.isEmpty ||
        machineAndEquipIncome.text.isEmpty ||
        machineAndEquipDesc.text.isEmpty ||
        funitureIncome.text.isEmpty ||
        cashIncome.text.isEmpty ||
        cashAndEquvalentDesc.text.isEmpty ||
        otherAssetsIncome.text.isEmpty ||
        otherAssetsDesc.text.isEmpty ||
        creditorsIncome.text.isEmpty ||
        creditorsNoOfPersons.text.isEmpty ||
        debitorsIncome.text.isEmpty ||
        debitorsNoOfPersons.text.isEmpty) {
      showSnackBar(context, 'Please enter all fields');
      return false;
    } else {
      return true;
    }
  }

  String getTotalInvestment() {
    if (finishedStocksIncome.text.isNotEmpty &&
        vehiclesIncome.text.isNotEmpty &&
        machineAndEquipIncome.text.isNotEmpty &&
        funitureIncome.text.isNotEmpty &&
        cashIncome.text.isNotEmpty &&
        otherAssetsIncome.text.isNotEmpty &&
        debitorsIncome.text.isNotEmpty) {
      totalInv = int.tryParse(finishedStocksIncome.text.toString()) +
          int.tryParse(vehiclesIncome.text.toString()) +
          int.tryParse(machineAndEquipIncome.text.toString()) +
          int.tryParse(funitureIncome.text.toString()) +
          int.tryParse(cashIncome.text.toString()) +
          int.tryParse(otherAssetsIncome.text.toString()) +
          int.tryParse(debitorsIncome.text.toString());
      setState(() {});
      return totalInv.toString();
    } else {
      setState(() {});
      return totalInv.toString();
    }
  }

  getDate() {
    final DateTime now = DateTime.now();
    todayDate = '${now.day}/${now.month}/${now.year}';
    setState(() {});
  }

  String getText() {
    if (date == null) {
      return '*Expected to start';
    } else {
      dateStr = '${date.day}/${date.month}/${date.year}';
      setState(() {});
      return dateStr;
    }
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (newDate == null) return;
    setState(() {
      date = newDate;
      getText();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Status When Join to SED',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      'Date:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      todayDate,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Initial Assets',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Evaluation Date',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: 30),
                SvgPicture.asset(
                  'assets/Icons/calender_icon.svg',
                  width: 15.84,
                  height: 19.839,
                  color: Colors.blue,
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () async {
                    pickDate(context);
                    setState(() {});
                  },
                  child: Text(
                    dateStr,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Monthly Sales Income',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Rs:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey),
                    controller: monthlySalesIncome,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter income',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Desc:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    maxLength: 128,
                    maxLines: null,
                    controller: monthlySalesDesc,
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Monthly Expenses',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Rs:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey),
                    controller: monthlyExpensesIncome,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter income',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Desc:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    maxLength: 128,
                    maxLines: null,
                    controller: monthlyEnpensesDesc,
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Salary Received Emp',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Rs:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey),
                    controller: salesReceivesIncome,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter income',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Desc:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    maxLength: 128,
                    maxLines: null,
                    controller: salesreceivedEmpDesc,
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Land & Building',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Rs:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey),
                    controller: landAndBuildingIncome,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter income',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: DropdownButton(
                    hint: landAndBuilding == null
                        ? Text('Unit')
                        : Text(
                            landAndBuilding,
                            style: TextStyle(color: Colors.blue),
                          ),
                    iconSize: 30.0,
                    style: TextStyle(color: Colors.blue),
                    items: ['Per', 'Arcs'].map(
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
                          landAndBuilding = val;
                        },
                      );
                    },
                  ),
                ),
                Text(
                  'Desc:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    maxLength: 128,
                    maxLines: null,
                    controller: landBuildingDesc,
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Finished Stocks',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Rs:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey),
                    controller: finishedStocksIncome,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter income',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: DropdownButton(
                    hint: finishedStocks == null
                        ? Text('Unit')
                        : Text(
                            finishedStocks,
                            style: TextStyle(color: Colors.blue),
                          ),
                    iconSize: 30.0,
                    style: TextStyle(color: Colors.blue),
                    items: ['Pis', 'Ltr', 'Kg', 'Box', 'Bottle'].map(
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
                          finishedStocks = val;
                        },
                      );
                    },
                  ),
                ),
                Text(
                  'Desc:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    maxLength: 128,
                    maxLines: null,
                    controller: finishedStocksDesc,
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Vehicles',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Rs:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey),
                    controller: vehiclesIncome,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter income',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Desc:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    maxLength: 128,
                    maxLines: null,
                    controller: vehiclesDesc,
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Machines & Equipments',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Rs:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey),
                    controller: machineAndEquipIncome,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter income',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Desc:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    maxLength: 128,
                    maxLines: null,
                    controller: machineAndEquipDesc,
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Funiture & Fitting',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Rs:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey),
                    controller: funitureIncome,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter income',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Desc:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    maxLength: 128,
                    maxLines: null,
                    controller: funitureAndFittingDesc,
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Cash and Equvalent',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Rs:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey),
                    controller: cashIncome,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter income',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Desc:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    maxLength: 128,
                    maxLines: null,
                    controller: cashAndEquvalentDesc,
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Other Assets',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Rs:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey),
                    controller: otherAssetsIncome,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter income',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Desc:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    maxLength: 128,
                    maxLines: null,
                    controller: otherAssetsDesc,
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Creditors',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Rs:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey),
                    controller: creditorsIncome,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter income',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'No of persons',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey),
                    controller: creditorsNoOfPersons,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type value here',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Debtors',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Rs:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey),
                    controller: debitorsIncome,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter income',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'No of persons',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey),
                    controller: debitorsNoOfPersons,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type value here',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      //hintText: 'Enter your Username'
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Total Investment (without land & buildings)',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Rs:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    getTotalInvestment(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 80,
                ),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        Navigator.pop(context);
                      } catch (error) {}
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        bool value = checkAllFields();
                        if (value) {
                          InitialAssets initialAssets = InitialAssets(
                            todayDate,
                            landAndBuilding,
                            finishedStocks,
                            monthlySalesIncome.text.toString(),
                            monthlyExpensesIncome.text.toString(),
                            salesReceivesIncome.text.toString(),
                            landAndBuildingIncome.text.toString(),
                            finishedStocksIncome.text.toString(),
                            vehiclesIncome.text.toString(),
                            machineAndEquipIncome.text.toString(),
                            funitureIncome.text.toString(),
                            cashIncome.text.toString(),
                            otherAssetsIncome.text.toString(),
                            creditorsIncome.text.toString(),
                            debitorsIncome.text.toString(),
                            creditorsNoOfPersons.text.toString(),
                            debitorsNoOfPersons.text.toString(),
                            monthlySalesDesc.text.toString(),
                            monthlyEnpensesDesc.text.toString(),
                            salesreceivedEmpDesc.text.toString(),
                            landBuildingDesc.text.toString(),
                            finishedStocksDesc.text.toString(),
                            vehiclesDesc.text.toString(),
                            funitureAndFittingDesc.text.toString(),
                            cashAndEquvalentDesc.text.toString(),
                            machineAndEquipDesc.text.toString(),
                            otherAssetsDesc.text.toString(),
                            totalInvestments.text.toString(),
                          );

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EvaluationFinalPage(initialAssets,widget.userDetails,widget.businessId)));
                        }
                      } catch (error) {}
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
