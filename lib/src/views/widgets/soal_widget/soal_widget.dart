import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:json_to_soal_parser/src/models/soal_model/soal_model.dart';
import 'package:json_to_soal_parser/src/views/widgets/image_popup.dart';

class SoalWidget extends StatefulWidget {
  const SoalWidget(
      {super.key, this.nomor, required this.soal, required this.files});
  final int? nomor;
  final SoalModel soal;
  final Map<String, Uint8List> files;

  @override
  State<SoalWidget> createState() => _SoalWidgetState();
}

class _SoalWidgetState extends State<SoalWidget> {
  Widget imageBytesInlineText(String name) {
    return Image.memory(
      widget.files[name]!,
      height: 40,
    );
  }

  Widget imageBytesBig(String name) {
    return Image.memory(
      widget.files[name]!,
      height: 150,
    );
  }

  Widget parseText(String text) {
    const pattern = r'<img:(.*?)>';
    final regExp = RegExp(pattern);
    final matches = regExp.allMatches(text).toList();

    if (matches.isEmpty) {
      return Text(text);
    } else if (matches.length == 1 &&
        matches[0].start == 0 &&
        matches[0].end == text.length) {
      final imageName = matches[0].group(1)!;
      return Center(
          child: GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (context) => ImagePopup(
            image: widget.files[imageName]!,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: imageBytesBig(imageName),
        ),
      ));
    } else {
      final widgets = <Widget>[];
      var lastMatchEnd = 0;

      for (final match in matches) {
        final beforeImgText = text.substring(lastMatchEnd, match.start);
        if (beforeImgText.isNotEmpty) {
          widgets.add(Text(beforeImgText));
        }

        final imageName = match.group(1)!;
        widgets.add(
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) => ImagePopup(
                image: widget.files[imageName]!,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: imageBytesInlineText(imageName),
            ),
          ),
        );

        lastMatchEnd = match.end;
      }

      final afterLastImgText = text.substring(lastMatchEnd);
      if (afterLastImgText.isNotEmpty) {
        widgets.add(Text(afterLastImgText));
      }

      return Wrap(
          crossAxisAlignment: WrapCrossAlignment.center, children: widgets);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.nomor != null
                ? Text('${widget.nomor.toString()}.')
                : const SizedBox(),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < widget.soal.question.length; i++)
                    Column(
                      children: [
                        Text(widget.soal.question[i]),
                      ],
                    ),
                  const SizedBox(height: 10),
                  for (var i = 0; i < widget.soal.choices.length; i++)
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
                                Text(
                                    '${widget.soal.choices.keys.elementAt(i)}.'),
                                const SizedBox(width: 5),
                                Column(
                                  children: [
                                    for (var j = 0;
                                        j <
                                            widget.soal.choices.values
                                                .elementAt(i)
                                                .length;
                                        j++)
                                      Text(widget.soal.choices.values
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
                  const SizedBox(height: 10),
                  Text(
                    'Jawaban: ${widget.soal.answer}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Pembahasan:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < widget.soal.answerDetail.length; i++)
                        parseText(widget.soal.answerDetail[
                            i]), // Text(widget.soal.answerDetail[i]),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
