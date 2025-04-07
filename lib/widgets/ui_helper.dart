import 'package:flutter/material.dart';

class UiHelper {
  /// A method to create a custom text field with a label and an icon.
  static Widget customTextField({
    required String label,
    required IconData icon,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
    );
  }

  /// A method to create a custom button with a callback and title.
  /// The button has a fixed height and width.
  static Widget customButton({
    required VoidCallback callback,
    required String title,
    required context,
  }) {
    return SizedBox(
      height: 35,
      width: 300,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(title, style: const TextStyle(fontSize: 14)),
      ),
    );
  }

  static customTextStyle({
    required String text,
    Color? color,
    required double fontSize,
    FontWeight? fontWeight,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize,
        fontFamily: 'Roboto',
      ),
    );
  }
}
