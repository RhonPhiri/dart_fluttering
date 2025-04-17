void main() {
  final localMap = {
    'verses': ['verse 1', 'verse 2', 'verse 3'],
    'chorus': 'refrain'
  };
  final List<String> verses = localMap['verses'] as List<String>;
  print(verses.any((verse) => verse.contains('ver')));
}
