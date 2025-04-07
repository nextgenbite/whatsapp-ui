import 'package:flutter/material.dart';

class UiHelper {
  /// A method to create a custom text field with a label and an icon.
  static Widget customTextField({required String label, IconData? icon}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        // border: const OutlineInputBorder(),
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
      width: MediaQuery.of(context).size.width - 20,
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
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow? overflow,
  }) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize,
        fontFamily: 'Roboto',
      ),
    );
  }

  static customContainer(TextEditingController controller) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0XFFD9D9D9),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ),
    );
  }
}
