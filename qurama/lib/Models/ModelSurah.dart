// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'dart:convert';

class SurahService {
  Future<List<dynamic>> getSurahData() async {
    var response = await http
        .get(Uri.parse('https://quran-api.santrikoding.com/api/surah'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List<dynamic>;
      return data;
    } else {
      throw Exception('Failed to load surah data');
    }
  }

  Future<List<dynamic>> getAyahData(int surahNumber) async {
    var response = await http.get(
        Uri.parse('https://quran-api.santrikoding.com/api/surah/$surahNumber'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return data['ayat'] as List<dynamic>;
    } else {
      throw Exception('Failed to load ayah data');
    }
  }
}
