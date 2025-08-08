import 'package:respo_app/data/models/attachment.dart';
import 'package:respo_app/data/models/user.dart';

class Email {
  final User sender;
  final List<User> recipients;
  final String subject;
  final String content;
  final List<Attachment> attachments;
  final double replies;
  const Email({
    required this.sender,
    required this.recipients,
    required this.subject,
    required this.content,
    this.attachments = const [],
    this.replies = 0,
  });
}
