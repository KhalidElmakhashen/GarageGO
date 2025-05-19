import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationDigits extends StatelessWidget {
  final int length;
  final ValueChanged<String> onCompleted;

  VerificationDigits({
    Key? key,
    this.length = 6,
    required this.onCompleted,
  }) : super(key: key);

  final List<TextEditingController> _controllers = [];

  @override
  Widget build(BuildContext context) {
    // Initialize controllers
    if (_controllers.isEmpty) {
      for (int i = 0; i < length; i++) {
        _controllers.add(TextEditingController());
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) => _buildDigitField(context, index)),
    );
  }

  Widget _buildDigitField(BuildContext context, int index) {
    return Container(
      width: 40.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: TextField(
        controller: _controllers[index], // Assign the controller
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 1 && index == length - 1) {
            onCompleted(_collectDigits());
          }
        },
      ),
    );
  }

  String _collectDigits() {
    String digits = '';
    for (var controller in _controllers) {
      digits += controller.text;
    }
    return digits;
  }
}