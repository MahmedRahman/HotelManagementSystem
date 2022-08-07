class NoteForCustomer {
  final String note;
  final String customerId;
  final String createdBy;
  final String createdAt;

  NoteForCustomer(
      {required this.note,
      required this.createdBy,
      required this.createdAt,
      required this.customerId});
}
