import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  final String message;

  const CustomLoader({Key? key, this.message = 'Loading...'}) : super(key: key);

  @override
  _CustomLoaderState createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // Mengulang animasi

    _animation = Tween<double>(begin: 0.0, end: 30.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Menggunakan Transform untuk menggerakkan gambar
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value), // Gerakkan gambar
                child: Image.asset('assets/images/jamur.png', width: 100),
              );
            },
          ),
          const SizedBox(height: 20),
          // const CircularProgressIndicator(),
          const SizedBox(height: 20),
          Text(
            widget.message,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
