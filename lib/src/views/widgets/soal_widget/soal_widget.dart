import 'package:flutter/material.dart';
import 'package:json_to_soal_parser/src/models/soal_model/soal_model.dart';

class SoalWidget extends StatefulWidget {
  const SoalWidget({super.key, this.nomor, required this.soal});
  final int? nomor;
  final SoalModel soal;

  @override
  State<SoalWidget> createState() => _SoalWidgetState();
}

class _SoalWidgetState extends State<SoalWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.nomor != null ? Text(widget.nomor.toString()) : const SizedBox(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < widget.soal.pertanyaan.length; i++)
              Column(
                children: [
                  Text(widget.soal.pertanyaan[i]),
                ],
              ),
            const SizedBox(height: 10),
            for (var i = 0; i < widget.soal.pilihan.length; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.soal.pilihan.keys.elementAt(i)}.'),
                  const SizedBox(width: 5),
                  Column(
                    children: [
                      for (var j = 0;
                          j < widget.soal.pilihan.values.elementAt(i).length;
                          j++)
                        Text(widget.soal.pilihan.values.elementAt(i)[j]),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
