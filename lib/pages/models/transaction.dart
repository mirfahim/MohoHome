class TransactionModel {
  int amount;
  final String note;
  final DateTime date;
  final String type;

  addAmount(int amount) {
    this.amount = this.amount + amount;
  }

  TransactionModel(this.amount, this.note, this.date, this.type);
}

class NewNoteModel{

  final String note;
  final DateTime date;
  final String title;



  NewNoteModel(this.title, this.note, this.date,);
}
