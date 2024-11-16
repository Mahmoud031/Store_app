import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
   CustomTextfield({
    super.key,this.hintText,this.onChanged,this.obscureText =false, this.inputType
  });
  Function(String)? onChanged; 
  String? hintText;
  TextInputType? inputType;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      keyboardType: inputType,
      
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          
        ),
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
                    )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            
          )
        )
      ),
    );
  }
}