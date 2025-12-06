import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class DraftRepository {
  static const String draftsBoxName = 'drafts';

  /// Register Hive adapters for any custom models
  static void registerAdapters() {
    // Example: Hive.registerAdapter(DraftModelAdapter());
    // If you create models later, add their adapters here
  }

  /// Ensure Hive is initialized and boxes are opened before app loads UI
  static Future<void> ensureBoxesOpen() async {
    // Web handles Hive storage differently, no directory needed
    if (!Hive.isBoxOpen(draftsBoxName)) {
      await Hive.openBox(draftsBoxName);
    }
  }

  /// Add new draft
  static Future<void> addDraft(Map<String, dynamic> draftData) async {
    final box = Hive.box(draftsBoxName);
    await box.add(draftData);
  }

  /// Get all drafts
  static List<Map<String, dynamic>> getDrafts() {
    final box = Hive.box(draftsBoxName);
    return box.values.cast<Map<String, dynamic>>().toList();
  }

  /// Update a draft
  static Future<void> updateDraft(int index, Map<String, dynamic> draftData) async {
    final box = Hive.box(draftsBoxName);
    await box.put(index, draftData);
  }

  /// Delete a draft
  static Future<void> deleteDraft(int index) async {
    final box = Hive.box(draftsBoxName);
    await box.delete(index);
  }
}
