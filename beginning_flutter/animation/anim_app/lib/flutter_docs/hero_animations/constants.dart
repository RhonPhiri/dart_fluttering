enum Dash {
  entertainment(
    title: 'Music and Programming',
    photoName: 'assets/dash0.jfif',
    details:
        'Dash loves dancing to pop and classic tunes. He is also a progrmmer, mergering Dart and Flutter',
  ),
  community(
    title: 'Social Network and Friendship',
    photoName: 'assets/dash1.jfif',
    details:
        'Dart has best friends with whom he loves sharing experiences with. Together they have created a strong bond that goes deep',
  ),
  adventure(
    title: 'Nature and Travelling',
    photoName: 'assets/dash2.jfif',
    details:
        'Dash loves the outdoors, exploring nature, observing the marvelous beauty that is presented. He is also part of the travellors club, journeying where the wind might take them',
  ),
  education(
    title: 'Zoology Major',
    photoName: 'assets/dash3.jfif',
    details:
        'Dart goes to the University of Mach where he is persuing his Master of Science in Zoology. He is also writting his thesis for his PhD',
  );

  const Dash({
    required this.title,
    required this.photoName,
    required this.details,
  });
  final String photoName;
  final String title;
  final String details;
}
