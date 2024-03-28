import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
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
    return Column(
      children: [
        const Text('Flutter TeX:'),
        const SizedBox(height: 10),
        const Wrap(
          direction: Axis.horizontal,
          children: [
            Text('Flutter TeX:'),
            TeXView(
              child: TeXViewDocument(r"""<p>                                
                     \(a \ne 0 \) \(ax^2 + bx + c = 0\)  $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$</p>"""),
            ),
          ],
        ),
        const Text('Flutter Material:'),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.nomor != null
                ? Text('${widget.nomor.toString()}.')
                : const SizedBox(),
            const SizedBox(width: 10),
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
                  Column(
                    children: [
                      Row(
                        children: [
                          Radio(value: 1, groupValue: 2, onChanged: (a) {}),
                          const SizedBox(width: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${widget.soal.pilihan.keys.elementAt(i)}.'),
                              const SizedBox(width: 5),
                              Column(
                                children: [
                                  for (var j = 0;
                                      j <
                                          widget.soal.pilihan.values
                                              .elementAt(i)
                                              .length;
                                      j++)
                                    Text(widget.soal.pilihan.values
                                        .elementAt(i)[j]),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
