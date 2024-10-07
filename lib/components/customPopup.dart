import 'package:flutter/material.dart';
import 'package:jamur/components/customButton.dart'; // Pastikan untuk mengimpor CustomButton

class CustomPopup extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;
  final String? secondButtonText;
  final VoidCallback onButtonPressed;
  final VoidCallback? onSecondButtonPressed;

  const CustomPopup({
    Key? key,
    required this.title,
    required this.content,
    this.buttonText = 'OK',
    this.secondButtonText, // Optional second button text
    required this.onButtonPressed,
    this.onSecondButtonPressed, // Optional callback for second button
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              content,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: secondButtonText != null
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              children: [
                if (secondButtonText != null && onSecondButtonPressed != null)
                  CustomButton(
                    text: secondButtonText!,
                    onPressed: () {
                      onSecondButtonPressed!();
                      Navigator.of(context).pop(); // Menutup dialog
                    },
                    color: Colors.blue, // Sesuaikan warna jika diperlukan
                  ),
                CustomButton(
                  text: buttonText,
                  onPressed: () {
                    onButtonPressed();
                    Navigator.of(context).pop(); // Menutup dialog
                  },
                  color: Colors.blue, // Sesuaikan warna jika diperlukan
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
