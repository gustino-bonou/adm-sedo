import 'package:adms/utils/enum/enum.dart';

class NotificationModel {
  String? id;
  NotificationType? type;
  String? title;
  String? userId;
  String? shippingProposalId;
  String? shippingOrderId;
  String? transactionId;
  dynamic data;

  NotificationModel({
    this.id,
    this.type,
    this.title,
    this.userId,
    this.shippingProposalId,
    this.shippingOrderId,
    this.transactionId,
    this.data,
  });

  factory NotificationModel.fromJson( json) {
    return NotificationModel(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      userId: json['userId'],
      shippingProposalId: json['shippingProposalId'],
      shippingOrderId: json['shippingOrderId'],
      transactionId: json['transactionId'],
      data: json['data'],
    );
  }
}
