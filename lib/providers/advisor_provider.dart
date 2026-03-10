import 'package:flutter/foundation.dart';
import '../models/advisor.dart';
import '../services/data_service.dart';

class AdvisorProvider extends ChangeNotifier {
  List<Advisor> _allAdvisors = [];
  List<Advisor> _searchResults = [];
  String _searchQuery = '';
  bool _isLoading = true;
  bool _isSearching = false;

  List<Advisor> get allAdvisors => _allAdvisors;
  List<Advisor> get searchResults => _searchResults;
  String get searchQuery => _searchQuery;
  bool get isLoading => _isLoading;
  bool get isSearching => _isSearching;

  List<String> get universities => DataService.getUniversities(_allAdvisors);

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    _allAdvisors = await DataService.loadAdvisors();
    _isLoading = false;
    notifyListeners();
  }

  void search(String query) {
    _searchQuery = query;
    _isSearching = query.isNotEmpty;
    if (_isSearching) {
      _searchResults = DataService.searchAdvisors(_allAdvisors, query);
    } else {
      _searchResults = [];
    }
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    _isSearching = false;
    _searchResults = [];
    notifyListeners();
  }

  List<Advisor> getAdvisorsByUniversity(String university) {
    return DataService.getAdvisorsByUniversity(_allAdvisors, university);
  }
}