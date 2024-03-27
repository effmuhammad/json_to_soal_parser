import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_text_field/json_text_field.dart';
import 'package:json_to_soal_parser/src/models/soal_model/soal_model.dart';
import 'package:json_to_soal_parser/src/views/widgets/soal_widget/soal_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = JsonTextFieldController();
  bool isFormating = true;

  Widget get generated {
    String jsonString = controller.text;
    if (jsonString.isEmpty) {
      return const Text('Masukkan data terlebih dahulu',
          style: TextStyle(color: Colors.grey));
    }
    try {
      final soal = SoalModel.fromJson(jsonDecode(jsonString));
      return SoalWidget(soal: soal);
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
        showErrorMessage: true,
        controller: controller,
        isFormatting: isFormating,
        keyboardType: TextInputType.multiline,
        expands: true,
        maxLines: null,
        textAlignVertical: TextAlignVertical.top,
        onChanged: (value) {
          controller.formatJson(sortJson: false);
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
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Json Parser'),
              const SizedBox(height: 20),
              Expanded(
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
                          const Text('Output'),
                          const SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 2),
                              ),
                              child: SingleChildScrollView(
                                child: generated,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    controller.formatJson(sortJson: false),
                                child: const Text('Format JSON'),
                              ),
                              const SizedBox(width: 20),
                              ElevatedButton(
                                onPressed: () =>
                                    controller.formatJson(sortJson: true),
                                child: const Text('Format JSON (sort)'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Trial Version 0.0.1'),
            ],
          ),
        ),
      ),
    ));
  }
}
