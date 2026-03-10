import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/advisor.dart';

class DataService {
  static Future<List<Advisor>> loadAdvisors() async {
    final String jsonString =
    await rootBundle.loadString('assets/data/advisors.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Advisor.fromJson(json)).toList();
  }

  static List<String> getUniversities(List<Advisor> advisors) {
    final universities = advisors.map((a) => a.university).toSet().toList();
    universities.sort();
    return universities;
  }

  static List<Advisor> getAdvisorsByUniversity(
      List<Advisor> advisors, String university) {
    return advisors.where((a) => a.university == university).toList();
  }

  static List<Advisor> searchAdvisors(List<Advisor> advisors, String query) {
    final lowerQuery = query.toLowerCase();
    return advisors.where((a) {
      return a.name.toLowerCase().contains(lowerQuery) ||
          a.university.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}