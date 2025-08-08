import 'package:respo_app/data/repositories/user_repo.dart';
import '../models/models.dart';

final List<Email> emails = [
  Email(
    sender: user_1,
    recipients: [],
    subject: '豆花鱼',
    content: "最近忙吗？昨晚我去了你最爱的那家饭馆，点了他们的特色豆花鱼，吃着吃着就想你了。",
  ),
  Email(
    sender: user_2,
    recipients: [],
    subject: 'Dinner Club',
    content:
        "I think it's time for us to finally try that new noodle shop downtown that doesn't use menus. Anyone else have other suggestions for dinner club this week? I'm so intrigued by this idea of a noodle restaurant where no one gets to order for themselves - could be fun, or terrible, or both :)\n\nSo",
  ),
  Email(
    sender: user_3,
    recipients: [],
    subject: 'This food show is made for you',
    content:
        "Ping– you'd love this new food show I started watching. It's produced by a Thai drummer who started getting recognized for the amazing vegan food she always brought to shows.",
    attachments: [const Attachment(url: 'assets/thumbnail_1.png')],
  ),
  Email(
    sender: user_4,
    recipients: [],
    subject: 'Volunteer EMT with me?',
    content:
        "What do you think about training to be volunteer EMTs? We could do it together for moral support. Think about it??",
  ),
];
