import 'package:isar/isar.dart';

part 'until.g.dart';

@Collection()
class Until {
  Until(this.event, this.date, this.couleur, this.finished);
  Id id = Isar.autoIncrement;
  late String event;
  late DateTime date;
  late String couleur;
  late bool finished;
}
