import 'package:flutter/material.dart';

class ProgressScreenResults extends StatefulWidget {
  const ProgressScreenResults({Key key}) : super(key: key);

  @override
  _ProgressScreenResultsState createState() => _ProgressScreenResultsState();
}

class _ProgressScreenResultsState extends State<ProgressScreenResults> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            const Text(
              "KPI Target",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text(''),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('Start Up New Business'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('Development of Existing Business'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('Business Consultancy'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('SED Database Registration'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('Technical support (Individual)'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Book Keeping'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Business 1st Evaluation'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Marketing Linkages'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Business Registration'),
                              tooltip: 'represents phone number of the user'),
                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('KPI Assigned (Dis.Level)')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('KPI Assigned (Dis.Level)')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Total KPI Target (Div.Level total)')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Total Target')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Total Achievement (This Month)')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Total Achievement (CUM)')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Balance To Achieve')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 40,),
            const Text(
              "Programme Conducted",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('Project Name'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('Programme Name'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('DS Division'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('Dates of Conducted'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('No: of Participants'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Expenses (Rs.)'),
                              tooltip: 'represents phone number of the user'),
                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 40,),
            const Text(
              "StartUp New Business",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('En. NIC'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('En. Name'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('Business Consultancy'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('Address'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('Biz. Name'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Date'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Biz. Category'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Initial Investment'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Spt. Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Entered Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Add'),
                              tooltip: 'represents phone number of the user'),
                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 40,),
            const Text(
              "Development of Existing Business",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('BUSINESS_NAME'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('RECORD_ID'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('ENTREPRENEUR_NIC'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('ENTREPRENEUR_INITIALS'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('ENTREPRENEUR_NAME'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('APPROVED_DATE'),
                              tooltip: 'represents phone number of the user'),
                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 40,),
            const Text(
              "Business Consultancy",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('BUSINESS_NAME'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('RECORD_ID'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('ENTREPRENEUR_NIC'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('ENTREPRENEUR_INITIALS'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('ENTREPRENEUR_NAME'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('APPROVED_DATE'),
                              tooltip: 'represents phone number of the user'),
                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 40,),
            const Text(
              "SED Database Registration ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('En. NIC'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('	En. Name'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('Address'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('District'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('Ds Division'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('Gn Division'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Registered date/time'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Spt. Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Entered Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Add'),
                              tooltip: 'represents phone number of the user'),
                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 40,),
            const Text(
              "Technical support (Individual)",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('En. NIC'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('	En. Name'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('Address'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('Biz. Name'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('Date'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('Description'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Spt. Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Entered Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Add'),
                              tooltip: 'represents phone number of the user'),

                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 40,),
            const Text(
              "Book Keeping",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('En. NIC'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('	En. Name'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('Address'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('Biz. Name'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('Date'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('Description'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Spt. Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Entered Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Add'),
                              tooltip: 'represents phone number of the user'),

                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 40,),
            const Text(
              "Business 1st Evaluation",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('En. NIC'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('	En. Name'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('Address'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('Biz. Name'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('Date'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('Description'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Spt. Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Entered Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Add'),
                              tooltip: 'represents phone number of the user'),

                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 40,),
            const Text(
              "Marketing Linkages",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('En. NIC'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('	En. Name'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('Place'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('Biz. Name'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('Date'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('Description'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Spt. Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Entered Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Add'),
                              tooltip: 'represents phone number of the user'),

                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 40,),
            const Text(
              "Business Registration ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('En. NIC'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('	En. Name'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('Address'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('Biz. Name'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('Date'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('Description'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Spt. Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Entered Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Add'),
                              tooltip: 'represents phone number of the user'),

                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 40,),
            const Text(
              "Other KPI & Non KPI Business Support",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('En. NIC'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('	En. Name'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('KPI name'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('Biz. Name'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('Date'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('Description'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Spt. Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Entered Officer'),
                              tooltip: 'represents phone number of the user'),

                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 40,),
            const Text(
              "Individual Technology",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('En. NIC'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('	En. Name'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('Amount'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('Biz. Name'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('Date'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('Description'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Spt. Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Entered Officer'),
                              tooltip: 'represents phone number of the user'),

                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 40,),
            const Text(
              "Business Finance Coordination ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('En. NIC'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('	En. Name'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('Amount'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('Biz. Name'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('Date'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('Reason'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Service Type'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('Spt. Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Entered Officer'),
                              tooltip: 'represents phone number of the user'),

                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 40,),
            const Text(
              "Business Finance Coordination ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('En. NIC'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('	En. Name'),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text('Description'),
                              tooltip: 'represents first name of the user'),
                          DataColumn(
                              label: Text('Biz. Name'),
                              tooltip: 'represents last name of the user'),
                          DataColumn(
                              label: Text('Date'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('Prefered Organization'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Nature of Coordination'),
                              tooltip: 'represents email address of the user'),
                          DataColumn(
                              label: Text('Spt. Officer'),
                              tooltip: 'represents phone number of the user'),
                          DataColumn(
                              label: Text('Entered Officer'),
                              tooltip: 'represents phone number of the user'),

                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                              DataCell(Text('0')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      )
    );
  }
}
