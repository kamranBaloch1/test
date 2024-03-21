// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  const CustomTextField({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.textController,
    this.validator,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 350.w,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color:  Color.fromARGB(255, 108, 189, 255),
              width: 2.0,
            ),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                widget.icon,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: TextFormField(
                validator: widget.validator,
                controller: widget.textController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle:const TextStyle(color: Color.fromARGB(255, 119, 194, 255)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      
    );
  }
}

