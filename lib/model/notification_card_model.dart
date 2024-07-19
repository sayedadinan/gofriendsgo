class NotificationCardModel {
  final String mainText;
  final String timeText;
  final String imageIcon;
  final String subText;

  NotificationCardModel(
      {required this.mainText,
      required this.timeText,
      required this.imageIcon,
      required this.subText});
}

List<NotificationCardModel> notificationCard = [
  NotificationCardModel(
      mainText: 'Lorem ipsum dolor sit\namet, consectetur ',
      timeText: '1m ago.',
      imageIcon: 'assets/images/Hotel icon.png',
      subText:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor sit amet, consectetur\n adipiscing elit.  '),
  NotificationCardModel(
      mainText: 'Lorem ipsum dolor sit\namet, consectetur ',
      timeText: '1m ago.',
      imageIcon: 'assets/images/Hotel icon.png',
      subText:
          ' Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor sit amet, consectetur\n adipiscing elit.  '),
  NotificationCardModel(
      mainText: 'Lorem ipsum dolor sit\namet, consectetur ',
      timeText: '1m ago.',
      imageIcon: 'assets/images/Hotel icon.png',      
      subText:
          ' Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor sit amet, consectetur\n adipiscing elit.  '),
  NotificationCardModel(
      mainText: 'Lorem ipsum dolor sit\namet, consectetur ',
      timeText: '1m ago.',
      imageIcon: 'assets/images/Hotel icon.png',
      subText:
          ' Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor sit amet, consectetur\n adipiscing elit.  '),
  NotificationCardModel(
      mainText: 'Lorem ipsum dolor sit\namet, consectetur ',
      timeText: '1m ago.',
      imageIcon: 'assets/images/Hotel icon.png',
      subText:
          ' Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor sit amet, consectetur\n adipiscing elit.  '),
];
