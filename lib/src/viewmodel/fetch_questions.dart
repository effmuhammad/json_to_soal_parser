import 'dart:developer';
import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'fetch_questions.g.dart';

@riverpod
Future<Uint8List> fetchZip(FetchZipRef ref, String url) async {
  final response = await http.get(Uri.parse(url));
  log(response.statusCode.toString());
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Failed to load zip');
  }
}
