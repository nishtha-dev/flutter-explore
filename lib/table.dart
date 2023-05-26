import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class MyTable extends StatelessWidget {
  final List<List<String>> _tableData = [
    ['Name', 'Age', 'Country', 'Salary'],
    ['John', '25', 'USA', '5000'],
    ['Anna', '30', 'Canada', '6000'],
    ['Peter', '35', 'Germany', '7000'],
    ['Mary', '40', 'France', '8000'],
    ['David', '45', 'UK', '9000'],
    ['Sara', '50', 'Australia', '10000'],
    ['Mark', '55', 'Spain', '11000'],
    ['Jenny', '60', 'Italy', '12000'],
    ['Tom', '65', 'Brazil', '13000'],
    ['Lucy', '70', 'Japan', '14000'],
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable2(
          columnSpacing: 12.0,
          horizontalMargin: 12.0,
          minWidth: 600.0,
          columns: List<DataColumn>.generate(
            _tableData[0].length,
            (int index) => DataColumn(
              label: Text(_tableData[0][index]),
              numeric: index > 0 ? true : false,
            ),
          ),
          rows: List<DataRow>.generate(
            _tableData.length - 1,
            (int index) => DataRow(
              cells: List<DataCell>.generate(
                _tableData[0].length,
                (int cellIndex) => DataCell(
                  Text(_tableData[index + 1][cellIndex]),
                ),
              ),
            ),
          ),
          dataRowHeight: 48.0,
          headingRowHeight: 56.0,
          headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
          headingTextStyle: TextStyle(fontWeight: FontWeight.bold),
          dividerThickness: 1.0,
          showBottomBorder: true,
          fixedTopRows: 1),
    );
  }
}
