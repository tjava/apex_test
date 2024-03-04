extension StringTitleCase on String {
  String toTitleCase() {
    if (isEmpty) {
      return '';
    }

    List<String> words = toLowerCase().split(' ');
    List<String> capitalizedWords = [];

    for (String word in words) {
      String capitalizedWord = word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : word;
      capitalizedWords.add(capitalizedWord);
    }

    return capitalizedWords.join(' ');
  }
}
