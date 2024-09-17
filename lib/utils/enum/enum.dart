
enum DeliveryPersonStatus {
  available,
  busy
}

enum OrderStatus {
  inProgress,
  pending,
  delivered,
  echec
}

enum NotificationType {
  newDeliver,
  newOrder,
  paymentProblem,
  deliveryAddressChanged,
  newPromotionCode,
  newCommentOnOrder,
  newProposal,
  updateOrder,
}