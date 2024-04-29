import 'package:assignment_tg/model/resume_item.dart';
import 'package:flutter/material.dart';

class ResumeProvider extends ChangeNotifier {
  final List<ResumeItem> _resumeItems = [];

  List<ResumeItem> get resumeItems => _resumeItems;

  void addSection(String title) {
    _resumeItems.add(ResumeItem(title: title, details: []));
    notifyListeners();
  }

  void updateSection(int index, String title, List<String> details) {
    _resumeItems[index] = ResumeItem(title: title, details: details);
    notifyListeners();
  }

  void deleteSection(int index) {
    _resumeItems.removeAt(index);
    notifyListeners();
  }

  void reorderSections(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      final item = _resumeItems.removeAt(oldIndex);
      _resumeItems.insert(newIndex, item);
    } else {
      final item = _resumeItems.removeAt(oldIndex);
      _resumeItems.insert(newIndex - 1, item);
    }
    notifyListeners();
  }

  void updateData() {
    // Update data here
    notifyListeners(); // This line notifies dependent widgets
  }
}
