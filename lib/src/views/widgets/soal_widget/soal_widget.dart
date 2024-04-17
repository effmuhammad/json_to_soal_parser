import 'dart:typed_data';

import 'package:flutter/material.dart';
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
  Widget imageBytes(String name, height) {
    return Image.memory(
      widget.files[name]!,
      fit: BoxFit.contain,
      height: height,
    );
  }

  Widget processText(String text) {
    const patterns = {
      r'<b:(.*?)>': FontWeight.bold,
      r'<u:(.*?)>': TextDecoration.underline,
      r'<i:(.*?)>': FontStyle.italic,
      r'<s:(.*?)>': TextDecoration.lineThrough,
    };

    final widgets = <TextSpan>[];
    var lastMatchEnd = 0;
    String lastTextAdded = '';

    for (final entry in patterns.entries) {
      final regExp = RegExp(entry.key);
      final matches = regExp.allMatches(text).toList();

      for (final match in matches) {
        final beforeText = text.substring(lastMatchEnd, match.start);
        if (beforeText.isNotEmpty) {
          widgets.add(TextSpan(text: beforeText));
        }

        final matchedText = match.group(1)!;
        widgets.add(TextSpan(
          text: matchedText,
          style: TextStyle(
            fontWeight: entry.value == FontWeight.bold ? FontWeight.bold : null,
            decoration: entry.value is TextDecoration
                ? entry.value as TextDecoration?
                : null,
            fontStyle:
                entry.value == FontStyle.italic ? FontStyle.italic : null,
          ),
        ));

        lastMatchEnd = match.end;
      }

      final afterText = text.substring(lastMatchEnd);
      if (afterText.isNotEmpty &&
          !afterText.contains('<s:') &&
          !afterText.contains('<b:') &&
          !afterText.contains('<i:') &&
          !afterText.contains('<u:') &&
          lastTextAdded != afterText) {
        widgets.add(TextSpan(text: afterText));
        lastTextAdded = afterText;
      }
    }

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: widgets,
      ),
    );
  }

  Widget parseText(String text) {
    const imgPattern = r'<img:(.*?):(.*?)>';

    final regExp = RegExp(imgPattern);
    final imgMatches = regExp.allMatches(text).toList();

    if (imgMatches.isEmpty) {
      return processText(text);
    } else {
      final widgets = <Widget>[];
      var lastMatchEnd = 0;

      for (final match in imgMatches) {
        final beforeImgText = text.substring(lastMatchEnd, match.start);
        if (beforeImgText.isNotEmpty) {
          widgets.add(Text(beforeImgText));
        }

        final imageName = match.group(1)!;
        final imageHeight = double.parse(match.group(2)!);
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
              child: imageBytes(
                  imageName, imageHeight), // Use the imageHeight here
            ),
          ),
        );

        lastMatchEnd = match.end;
      }

      final afterLastImgText = text.substring(lastMatchEnd);
      if (afterLastImgText.isNotEmpty) {
        widgets.add(processText(afterLastImgText));
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
                ? Text('${widget.soal.id.toString()}.')
                : const SizedBox(),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < widget.soal.question.length; i++)
                    Column(
                      children: [
                        parseText(widget.soal.question[i]),
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
                                      parseText(widget.soal.choices.values
                                          .elementAt(i)[j])
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
