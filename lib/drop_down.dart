import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class DropdownPage extends StatefulWidget {
  @override
  _DropdownPageState createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];
  final TextEditingController _typeAheadController = TextEditingController();

  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Searchable Dropdown'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _typeAheadController,
                decoration: InputDecoration(
                  labelText: 'Select an option',
                ),
              ),
              suggestionsCallback: (pattern) async {
                // Implement your own logic to fetch suggestions based on the input pattern
                // Here, we'll just filter the options list based on the pattern
                return options.where((option) =>
                    option.toLowerCase().contains(pattern.toLowerCase()));
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (suggestion) {
                setState(() {
                  selectedOption = suggestion;
                  _typeAheadController.text = suggestion;
                });
              },
              onSaved: (value) => selectedOption = value!,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please select an option';
                }
                return null;
              },
              noItemsFoundBuilder: (context) {
                return ListTile(
                  title: Text('No matching options found'),
                );
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Add New Option'),
                      content: TextField(
                        controller: _typeAheadController,
                        decoration: InputDecoration(
                          labelText: 'Option',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              options.add(_typeAheadController.text);
                              selectedOption = _typeAheadController.text;
                              _typeAheadController.clear();
                              Navigator.pop(context);
                            });
                          },
                          child: Text('Add'),
                        ),
                        TextButton(
                          onPressed: () {
                            _typeAheadController.clear();
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Add New Option'),
            ),
            SizedBox(height: 16.0),
            Text('Selected Option: $selectedOption'),
          ],
        ),
      ),
    );
  }
}
