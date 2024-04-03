import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:hatraminy/models/until.dart';
import 'package:path_provider/path_provider.dart';

class UntilDatabase extends ChangeNotifier {
  static late Isar isar;
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([UntilSchema], directory: dir.path);
  }

  final List<Until> currentUntils = [];

  Future<void> addUntil(
      String event, DateTime date, String couleur, bool finished) async {
    final newUntil = Until(event, date, couleur, finished);
    await isar.writeTxn(() => isar.untils.put(newUntil));

    fetchUntils();
  }

  Future<void> fetchUntils() async {
    List<Until> fetchedUntils = await isar.untils.where().findAll();
    currentUntils.clear();
    currentUntils.addAll(fetchedUntils);
    notifyListeners();
  }

  Future<void> updateUntil(int id, String event, DateTime date, String couleur,
      bool finished) async {
    final existingUntil = await isar.untils.get(id);
    if (existingUntil != null) {
      existingUntil.event = event;
      existingUntil.date = date;
      existingUntil.couleur = couleur;
      existingUntil.finished = finished;
      await isar.writeTxn(() => isar.untils.put(existingUntil));
      await fetchUntils();
    }
  }

  Future<void> deleteUntil(int id) async {
    await isar.writeTxn(() => isar.untils.delete(id));
    await fetchUntils();
  }
}
