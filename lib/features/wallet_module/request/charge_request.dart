class ChargeRequest {
  dynamic total;
  int? cardId;

  ChargeRequest({
    required this.cardId,
    required this.total,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['card_id'] = cardId;
    return data;
  }
}
