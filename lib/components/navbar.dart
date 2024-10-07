import 'package:flutter/material.dart';
import 'customPopup.dart'; // Import the CustomPopup widget

class CustomNavbar extends StatelessWidget implements PreferredSizeWidget {
  final Function onLogoutTap;
  final String titleText;

  const CustomNavbar({
    Key? key,
    required this.onLogoutTap,
    this.titleText = 'Monitoring Kumbung Jamur', // Default value for title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        titleText, // Display the passed title
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          tooltip: 'Keluar',
          color: Colors.white,
          onPressed: () {
            // Show CustomPopup when logout icon is tapped
            showDialog(
              context: context,
              builder: (context) {
                return CustomPopup(
                  title: 'Konfirmasi Logout',
                  content: 'Apakah Anda yakin ingin keluar?',
                  buttonText: 'Ya',
                  secondButtonText: 'Tidak',
                  onButtonPressed: () {
                    // If 'Ya' is pressed
                    // Navigator.of(context).pop();
                  },
                  onSecondButtonPressed: () {
                    // If 'Tidak' is pressed, close the dialog
                    
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
