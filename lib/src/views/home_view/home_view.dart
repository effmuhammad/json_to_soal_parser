import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:json_text_field/json_text_field.dart';
import 'package:json_to_soal_parser/src/models/soal_model/soal_model.dart';
import 'package:json_to_soal_parser/src/viewmodel/soal_viewmodel.dart';
import 'package:json_to_soal_parser/src/views/widgets/soal_widget/soal_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final jsonController = JsonTextFieldController();
  final dirController = TextEditingController();
  FilePickerResult? picked;
  Map<String, Uint8List> files = {};
  bool isFormating = true;

  void pickFile() async {
    picked = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowCompression: false,
    );
    if (picked != null) {
      for (final file in picked!.files) {
        files[file.name] = file.bytes!;
      }

      if (files.containsKey('soal.json')) {
        String jsonString = utf8.decode(files['soal.json']!);
        var jsonData = jsonDecode(jsonString);
        jsonController.text = jsonEncode(jsonData);
        jsonController.formatJson(sortJson: true);
        setState(() {});
      }
    }
  }

  void readFilesFromDirectory(String directoryPath) async {
    final dir = Directory(directoryPath);
    if (await dir.exists()) {
      List<FileSystemEntity> files = dir.listSync();
      for (FileSystemEntity file in files) {
        if (file is File) {
          Uint8List bytes = await file.readAsBytes();
          print('File: ${file.path}, Bytes: $bytes');
        }
      }
    } else {
      print('Directory does not exist');
    }
  }

  Widget get generated {
    String jsonString = jsonController.text;
    if (jsonString.isEmpty) {
      return const Text('Masukkan data terlebih dahulu',
          style: TextStyle(color: Colors.grey));
    }
    try {
      var jsonObject = jsonDecode(jsonString);
      if (jsonObject is List) {
        debugPrint('jsonObject is List');
        final soalList = SoalViewModel.fromJsonList(
            jsonObject.map((e) => e as Map<String, dynamic>).toList());
        return Column(
          children: soalList.asMap().entries.map((e) {
            int index = e.key;
            SoalModel soal = e.value;
            // Now you can use both index and soal
            return SoalWidget(nomor: index + 1, soal: soal, files: files);
          }).toList(),
        );
      }
      final soal = SoalModel.fromJson(jsonDecode(jsonString));
      return SoalWidget(soal: soal, files: files);
    } catch (e) {
      return Text(
        e.toString(),
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  Widget get jsonInput => JsonTextField(
        onError: (error) => debugPrint(error),
        showErrorMessage: false,
        controller: jsonController,
        isFormatting: isFormating,
        keyboardType: TextInputType.multiline,
        expands: true,
        maxLines: null,
        textAlignVertical: TextAlignVertical.top,
        onChanged: (value) {
          jsonController.formatJson(sortJson: false);
          setState(() {});
        },
        decoration: InputDecoration(
          hintText: "Masukkan data disini",
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.outline.withOpacity(
                  0.6,
                ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary.withOpacity(
                    0.6,
                  ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.surfaceVariant,
            ),
          ),
          filled: true,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'JSON to SOAL Parser',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Project bank soal untuk aplikasi mobile milik EffDev Studio',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 20,
                runSpacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: pickFile,
                      child: const Text("Pick Files (json dan gambar)")),
                  const SizedBox(width: 50),
                  ElevatedButton(
                    onPressed: () async {
                      final data = await Clipboard.getData('text/plain');
                      jsonController.text = data?.text ?? '';
                      setState(() {});
                    },
                    child: const Text('Paste'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await Clipboard.setData(
                        ClipboardData(text: jsonController.text),
                      );
                    },
                    child: const Text('Copy'),
                  ),
                  ElevatedButton(
                    onPressed: () => jsonController.formatJson(sortJson: true),
                    child: const Text('Rapihkan'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      jsonController.text = '';
                      setState(() {});
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 500,
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Expanded(child: jsonInput),
                              ],
                            )),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 2),
                                      ),
                                      child: SingleChildScrollView(
                                        child: generated,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Copyright EffDev Studio, Version 0.0.1'),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
