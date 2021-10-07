class Transaction {
  // this class is not a widget, so not extending Stateless or Stateful
  
  String id;
  String title;
  double amount;
  DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
