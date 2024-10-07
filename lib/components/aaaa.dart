import 'package:flutter/material.dart';

// CustomClipper untuk membuat sudut kanan bawah cekung
class BottomRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Membuat segitiga siku-siku normal di bagian kiri atas dan kanan atas
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    
    // Membuat sudut cekung di kanan bawah
    path.quadraticBezierTo(
      size.width, size.height, 
      size.width, size.height - 50
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Custom Widget untuk AppBar
class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar1({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomRightClipper(),
      child: Container(
        height: preferredSize.height,
        color: Colors.blue,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.0);
}