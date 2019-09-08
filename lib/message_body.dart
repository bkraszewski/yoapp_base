class MessageBody {
  final String priority;
  final MessageData data;
  final String to;

  MessageBody({this.priority, this.data, this.to});

  factory MessageBody.create(String token) {
    return MessageBody(
      priority: 'high',
      data: MessageData._create(),
      to: token,
    );
  }

  Map<String, dynamic> toJson() => {
        'priority': priority,
        'data': data.toJson().toString(),
        'to': to,
      };
}

class MessageData {
  final String clickAction;
  final String id;
  final String status;

  MessageData({this.clickAction, this.id, this.status});

  factory MessageData._create() {
    return MessageData(
      clickAction: 'FLUTTER_NOTIFICATION_CLICK',
      id: '1',
      status: 'done',
    );
  }

  Map<String, dynamic> toJson() => {
        'click_action': clickAction,
        'id': id,
        'status': status,
      };
}
