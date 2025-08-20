import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({super.key});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController dateController=TextEditingController();

  final formKey = GlobalKey<FormState>();
  String? _gender;
  List<String> _hobbies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Form")),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView( // Add scrolling for small screens
            child: Column(
              children: [
                buildTextField(
                  controller: name,
                  label: 'Name *',
                  pattern: r'^[a-zA-Z]+$',
                  errorMsg: 'Please enter alphabets only',
                ),
                const SizedBox(height: 15),
                buildTextField(
                  controller: email,
                  label: 'Email *',
                  pattern: r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  errorMsg: 'Please enter a valid email',
                ),
                const SizedBox(height: 15),
                buildTextField(
                  controller: number,
                  label: 'Phone Number *',
                  pattern: r'^[0-9]{10}$',
                  errorMsg: 'Enter 10-digit number only',
                ),
                const SizedBox(height: 15),
                buildTextField(
                  controller: address,
                  label: 'Address *',
                  pattern: r'^[a-zA-Z0-9\s,.-]+$',
                  errorMsg: 'Please enter a valid address',
                ),
                const SizedBox(height: 15),
                // date
                TextField(
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Select Your BirthDate",
                    prefixIcon: Icon(Icons.date_range),
                  ),
                  onTap: () async {
                    print(DateTime.now().toString());
                    DateTime?  selectedDate=await showDatePicker(
                      initialDate: DateTime.now(),
                      context: context,
                      firstDate: DateTime(1965),
                      lastDate: DateTime.now(),
                    );
                    if(selectedDate!=null)
                    {
                      dateController.text=DateFormat("dd/MM/yyyy").format(selectedDate);
                      setState(() {

                      });
                    }
                  },
                ),
                const SizedBox(height: 15),
                CheckboxListTile(
                  title: const Text('Hobbies: Reading'),
                  value: _hobbies.contains('Reading'),
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _hobbies.add('Reading');
                      } else {
                        _hobbies.remove('Reading');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Hobbies: Traveling'),
                  value: _hobbies.contains('Traveling'),
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _hobbies.add('Traveling');
                      } else {
                        _hobbies.remove('Traveling');
                      }
                    });
                  },
                ),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Gender'),
                  value: _gender,
                  items: ['Male', 'Female', 'Other']
                      .map((gender) => DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Form Submitted Successfully')),
                      );

                      // Print values
                      print('Name: ${name.text}');
                      print('Email: ${email.text}');
                      print('Number: ${number.text}');
                      print('Address: ${address.text}');
                      print('Gender: $_gender');
                      print('Hobbies: $_hobbies');

                      // Clear fields
                      name.clear();
                      number.clear();
                      email.clear();
                      address.clear();

                      setState(() {
                        _gender = null;
                        _hobbies.clear();
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Validation failed')),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required String pattern,
    required String errorMsg,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textAlign: TextAlign.center,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your ${label.toLowerCase()}';
        }
        final regex = RegExp(pattern);
        if (!regex.hasMatch(value)) {
          return errorMsg;
        }
        return null;
      },
    );
  }
}
