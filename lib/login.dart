import 'package:flutter/material.dart';
import 'package:sample_button/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _selectedUserType = 'Admin';
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  String? emailError;
  String? passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  List<String> _userTypes = [
    'Admin',
    'Company',
    'Student',
  ];

  void emailVal(String? value) {
    final regex = RegExp(
        r'^([a-zA-Z0-9_\-.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$');
    // if (value == null) {
    setState(() {
      emailError = 'Please enter valid email address';
    });
    // }
    // else {
    //   setState(() {
    //     emailError = regex.hasMatch(value) ? null : 'Invalid Email address';
    //   });
    // }
  }

  void passwordVal(String? value) {
    setState(() {
      passwordError =
          value == null || value.isEmpty ? 'Please enter your password' : null;
    });
  }

  void submit() {
    if (_emailController.text.isEmpty) {
      emailVal(_emailController.text);
    }
    if (_passwordController.text.isEmpty) {
      passwordVal(_passwordController.text);
    }
    if (emailError == null && passwordError == null) {
      // context
      //     .read<LoginCubit>()
      //     .login(_emailController.text, _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login Page'),
      // ),
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40.0),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'User Type',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                value: _selectedUserType,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: ColorConst.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  // labelText: 'User Type',
                ),
                items: _userTypes.map((String userType) {
                  return DropdownMenuItem<String>(
                    value: userType,
                    child: Text(userType),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedUserType = value ?? '';
                  });
                },
              ),
              const SizedBox(height: 30.0),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              CustomTextFormField(
                controller: _emailController,
                hint: 'Enter Email Address',
                errorText: emailError,
                onChanged: emailVal,
              ),
              const SizedBox(height: 30.0),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              CustomTextFormField(
                controller: _passwordController,
                hint: 'Enter your Password',
                errorText: passwordError,
                onChanged: passwordVal,
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorConst.black),
                  ),
                  child: const Text('Login'),
                  onPressed: () {
                    submit();
                    // String userType = _selectedUserType ?? '';
                    // String email = _emailController.text.trim();
                    // String password = _passwordController.text.trim();

                    // Perform login logic here
                    // You can validate the inputs and authenticate the user
                    // using the provided email and password

                    // Clear input fields after login
                    _emailController.clear();
                    _passwordController.clear();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hint,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final String? hint;
  final String? errorText;
  final void Function(String)? onChanged;
  final void Function(String?)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        hoverColor: Colors.transparent,
        focusColor: ColorConst.white,
        fillColor: ColorConst.white,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: ColorConst.lightGrey3,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: ColorConst.dartGrey3,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: ColorConst.black,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: ColorConst.red,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: ColorConst.red,
            width: 1,
          ),
        ),
        // prefixIcon: prefixIcon,
        // prefixIconColor: ColorConst.burgundy,
        // suffixIcon: suffixIcon,
        // suffixIconColor: ColorConst.burgundy,
        hintText: hint,
        hintStyle: const TextStyle(
          // TextType.subHeading2,
          color: ColorConst.dartGrey3,
          fontSize: 16,
        ),
        errorText: errorText,
        errorStyle: const TextStyle(
          // TextType.text6,
          color: ColorConst.red,
          fontSize: 16,
        ),
        enabled: true,

        // helperText: helperText,
        // helperStyle: getTextStyle(
        //   // TextType.text6,
        //   color: ColorConst.dartGrey3,
        //   fontSize: helperFontSize,
        // ),
        // contentPadding: contentPadding,
      ),
      style: const TextStyle(
        // TextType.subHeading1,
        color: ColorConst.dartGrey3,
        fontSize: 18,
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );
  }
}
