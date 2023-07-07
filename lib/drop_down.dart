import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: dateTime(),
//     );
//   }
// }
class dateTime extends StatefulWidget {
  const dateTime({super.key});

  @override
  State<dateTime> createState() => _dateTimeState();
}

class _dateTimeState extends State<dateTime> {
  List<String> dropdownOptions = ['Option 1', 'Option 2'];
  String? selectedOption;
  TextEditingController newOptionController = TextEditingController();

  @override
  void dispose() {
    newOptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown with Add Field'),
      ),
      body: Column(
        children: [
          DropdownButtonFormField<String>(
            value: selectedOption,
            items: dropdownOptions.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                selectedOption = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: newOptionController,
              decoration: InputDecoration(
                labelText: 'Add New Option',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String newOption = newOptionController.text;
              setState(() {
                dropdownOptions.add(newOption);
                selectedOption = newOption;
                newOptionController.clear();
              });
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}

// class DropdownWithAddField extends StatefulWidget {
//   @override
//   _DropdownWithAddFieldState createState() => _DropdownWithAddFieldState();
// }

// class _DropdownWithAddFieldState extends State<DropdownWithAddField> {
//   List<String> dropdownOptions = ['Option 1', 'Option 2'];
//   String? selectedOption;
//   TextEditingController newOptionController = TextEditingController();

//   @override
//   void dispose() {
//     newOptionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dropdown with Add Field'),
//       ),
//       body: Column(
//         children: [
//           DropdownButtonFormField<String>(
//             value: selectedOption,
//             items: dropdownOptions.map((String option) {
//               return DropdownMenuItem<String>(
//                 value: option,
//                 child: Text(option),
//               );
//             }).toList(),
//             onChanged: (String? value) {
//               setState(() {
//                 selectedOption = value;
//               });
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: newOptionController,
//               decoration: InputDecoration(
//                 labelText: 'Add New Option',
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               String newOption = newOptionController.text;
//               setState(() {
//                 dropdownOptions.add(newOption);
//                 selectedOption = newOption;
//                 newOptionController.clear();
//               });
//             },
//             child: Text('Add'),
//           ),
//         ],
//       ),
//     );
//   }
// }
