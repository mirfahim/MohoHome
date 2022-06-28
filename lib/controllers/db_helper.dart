import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DbHelper {
  late Box box;
  late Box noteBox;
  late Box budgetBox;
  late SharedPreferences preferences;

  DbHelper() {
    openBox();
  }

  openBox() {
    box = Hive.box('money');
    noteBox = Hive.box("notes");
    budgetBox = Hive.box("budget");
  }
  void addBudget(int amount) async {
    var value = {'amount': amount,};
    box.add(value);
  }
  void addData(int amount, DateTime date, String type, String note) async {
    var value = {'amount': amount, 'date': date, 'type': type, 'note': note};
    box.add(value);
  }
  void addNote(String title, DateTime date,  String note) async {
    var value = {'title': title, 'date': date, 'note': note};
    noteBox.add(value);
  }

  void editNoteData(String title, DateTime date, String type, String note, int index) async {
    var value = {'title': title, 'date': date,  'note': note};
    noteBox.putAt(index, value);
  }


  void editData(int amount, DateTime date, String type, String note, int index) async {
    var value = {'amount': amount, 'date': date, 'type': type, 'note': note};
    box.putAt(index,value);
  }

  Future deleteData(
    int index,
  ) async {
    await box.deleteAt(index);
  }

  Future cleanData() async {
    await box.clear();
  }

  addName(String name) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString('name', name);
  }

  getName() async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getString('name');
  }

  setLocalAuth(bool val) async {
    preferences = await SharedPreferences.getInstance();
    return preferences.setBool('auth', val);
  }

  Future<bool> getLocalAuth() async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getBool('auth') ?? false;
  }
}
