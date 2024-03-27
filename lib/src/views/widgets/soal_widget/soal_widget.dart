import 'package:flutter/material.dart';
import 'package:json_to_soal_parser/src/models/soal_model/soal_model.dart';

class SoalWidget extends StatefulWidget {
  const SoalWidget({super.key, required this.soal});
  final SoalModel soal;

  @override
  State<SoalWidget> createState() => _SoalWidgetState();
}

class _SoalWidgetState extends State<SoalWidget> {
  @override
  Widget build(BuildContext context) {
    return const Text("1");
  }
}
