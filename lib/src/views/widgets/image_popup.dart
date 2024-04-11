import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImagePopup extends StatelessWidget {
  const ImagePopup({super.key, required this.image});
  final Uint8List image;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Image.memory(image),
    );
  }
}
