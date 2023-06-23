import 'package:flutter/material.dart';
import 'package:sed_project/screens/progress_screen_results.dart';
import 'package:sed_project/services/api_endpoints.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({Key key}) : super(key: key);

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  DateTime date;
  String startDate;
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ]; // Option 2
  String selectedMonth; // Option 2
  List<String> years = ['2020', '2021', '2022']; // Option 2
  String selectedYear; // Opti

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (newDate == null) return;
    setState(() => date = newDate);
  }

  String getText() {
    if (date == null) {
      return '*Started Date';
    } else {
      startDate = '${date.day}/${date.month}/${date.year}';
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  Future<void> checkDetails(String month,String year) async {
    // String url = Endpoints.getProgress + year + "/" + month;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProgressScreenResults()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: Container(
                    child: Image.asset('assets/image/evaluation_back.jpg')),
              ),
            ),
            SizedBox(height: 40),
            const Text(
              "Monthly Individual Progress",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 110,
                ),
                DropdownButton(
                  hint: Text('Year'), // Not necessary for Option 1
                  value: selectedYear,
                  onChanged: (newValue) {
                    setState(() {
                      selectedYear = newValue;
                    });
                  },
                  items: years.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location),
                      value: location,
                    );
                  }).toList(),
                ),
                SizedBox(
                  width: 30,
                ),
                DropdownButton(
                  hint: Text('Month'), // Not necessary for Option 1
                  value: selectedMonth,
                  onChanged: (newValue) {
                    setState(() {
                      selectedMonth = newValue;
                    });
                  },
                  items: months.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location),
                      value: location,
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 160,
                ),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () async {
                      checkDetails(selectedMonth,selectedYear);
                      try {} catch (error) {}
                    },
                    child: const Text(
                      'View',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }


}
