class NoteForCustomer {
  String note;
  String? customerId;
  String? createdBy;
  String? createdAt;

  NoteForCustomer(
      {required this.note, this.createdBy, this.createdAt, this.customerId});

  set setNote(String note) {
    this.note = note;
  }
  @override
  String toString() {
    return 'NoteForCustomer{note: $note, customerId: $customerId, createdBy: $createdBy, createdAt: $createdAt}';
  }
}
