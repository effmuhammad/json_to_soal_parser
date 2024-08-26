import 'dart:convert';
import 'dart:developer';
import 'package:archive/archive_io.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_text_field/json_text_field.dart';
import 'package:json_to_soal_parser/src/models/question.dart';
import 'package:json_to_soal_parser/src/viewmodel/fetch_questions.dart';
import 'package:json_to_soal_parser/src/viewmodel/question_viewmodel.dart';
import 'package:json_to_soal_parser/src/views/widgets/question_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key, this.link});
  final String? link;

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final jsonController = JsonTextFieldController();
  final linkController = TextEditingController();
  FilePickerResult? picked;
  Map<String, Uint8List> files = {};
  bool isFormating = true;

  void setJsonData(Map<String, Uint8List> files) {
    if (files.containsKey('soal.json')) {
      String jsonString = utf8.decode(files['soal.json']!);
      var jsonData = jsonDecode(jsonString);
      jsonController.text = jsonEncode(jsonData);
      jsonController.formatJson(sortJson: true);
      setState(() {});
    }
  }

  void handleZipByte(Uint8List byteData) {
    final extract = ZipDecoder().decodeBytes(byteData);

    for (final ArchiveFile file in extract) {
      final fileName = p.basename(file.name);
      files[fileName] = file.content as Uint8List;
      log('File: $fileName');
    }

    setJsonData(files);
  }

  void handleLinkInput(String link) async {
    EasyLoading.show(status: 'Mendownload ZIP...');
    try {
      final byteData = await ref.watch(fetchZipProvider(link).future);
      EasyLoading.dismiss();
      handleZipByte(byteData);
    } catch (e) {
      log(e.toString());
      EasyLoading.dismiss();
      EasyLoading.showError('Gagal mendownload ZIP');
    }
  }

  void pickFile() async {
    files.clear();

    picked = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowCompression: false,
    );
    if (picked != null) {
      for (final file in picked!.files) {
        files[file.name] = file.bytes!;
      }
      setJsonData(files);
    }
  }

  void pickZip() async {
    files.clear();

    picked = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowCompression: false,
      type: FileType.custom,
      allowedExtensions: ['zip'],
    );
    if (picked == null) {
      return;
    }

    final file = picked!.files.first;

    handleZipByte(file.bytes!);
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
        final soalList = SoalViewModel.fromJsonList(
            jsonObject.map((e) => e as Map<String, dynamic>).toList());
        return Column(
          children: soalList.asMap().entries.map((e) {
            int index = e.key;
            Question soal = e.value;
            return QuestionWidget(
                number: index + 1, question: soal, files: files);
          }).toList(),
        );
      }
      final soal = Question.fromJson(jsonDecode(jsonString));
      return QuestionWidget(question: soal, files: files);
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
        onError: (error) => log(error.toString()),
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
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
          ),
          filled: true,
        ),
      );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      log("Link = ${widget.link.toString()}");
      if (widget.link != null) {
        linkController.text = widget.link!;
        handleLinkInput(widget.link!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'JSON to SOAL Parser',
      color: Colors.black,
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: linkController,
                            decoration: const InputDecoration(
                              hintText: 'Masukkan link zip',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        FilledButton(
                          onPressed: () async {
                            if (linkController.text.isEmpty) {
                              EasyLoading.showError('Link belum diisi');
                              return;
                            }
                            handleLinkInput(linkController.text);
                          },
                          child: const Text('Buka'),
                        )
                      ],
                    ),
                  ),
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: pickFile,
                      child: const Text("Pick Folder Files"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: pickZip,
                      child: const Text("Pick ZIP"),
                    ),
                    Container(
                      width: 2,
                      height: 25,
                      color: Colors.grey,
                    ),
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
                      onPressed: () =>
                          jsonController.formatJson(sortJson: true),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 2,
                                          ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Copyright EffDev Studio'),
                            FutureBuilder(
                                future: PackageInfo.fromPlatform(
                                    baseUrl:
                                        'https://effdevstudio.web.app/apps/json-to-soal/'),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final packageInfo =
                                        snapshot.data as PackageInfo;
                                    return Text(
                                        ', Version ${packageInfo.version}');
                                  }
                                  return const SizedBox();
                                }),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
