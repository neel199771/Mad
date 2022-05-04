import 'dart:io';
import 'dart:math';

class Hangman {
  late String word;
  final List<String> words = [
    "apple",
    "banana",
    "orange",
    "pear",
  ];
  late List<String> guessedLetters;
  late List<int> guessedLettersIndex;
  int lives = 6;

  Hangman() {
    word = words[Random().nextInt(words.length)];
    guessedLetters = List.generate(word.length, (i) => '_');
    guessedLettersIndex = <int>[];
  }

  void guessIndex(int index, String letter) {
    if (!word.contains(letter)) {
      print("Worng Input");
      lives--;
    } else {
      guessedLetters[index] = letter;
      guessedLettersIndex.add(index);
    }
  }

  bool validate(int index, String letter) {
    return index < word.length && letter.length == 1;
  }

  void start() {
    while (lives >= 0) {
      print(guessedLetters);
      print("Lives: ${lives}");
      print("Enter the index: ");
      int index = int.parse(stdin.readLineSync()!);
      print("Enter the letter: ");
      String letter = stdin.readLineSync()!;
      if (validate(index, letter)) {
        guessIndex(index, letter);
      } else {
        print("Enter a correct input");
        lives--;
      }
      if (guessedLettersIndex.length == word.length) {
        print("You won");
        return;
      }
    }
    print("Bye loser");
  }
}

class HangmanV2 {
  late String word;
  final List<String> words = [
    "apple",
    "banana",
    "orange",
    "pear",
  ];
  late List<String> guessedRightLetters;
  late List<String> guessedWrongLetters;
  late List<String> output;
  int lives = 6;

  HangmanV2() {
    word = words[Random().nextInt(words.length)];
    output = List.generate(word.length, (i) => '_');
    guessedWrongLetters = <String>[];
    guessedRightLetters = <String>[];
  }

  bool validate(String letter) {
    try {
      return letter.length == 1;
    } catch (e) {
      return false;
    }
  }

  void guessIndex(String letter) {
    if (!word.contains(letter)) {
      guessedWrongLetters.add(letter);
      print("Character not in the string");
      lives--;
    } else if (guessedRightLetters.contains(letter) ||
        guessedWrongLetters.contains(letter)) {
      print("Character already guessed");
    } else {
      guessedRightLetters.add(letter);
      for (int i = 0; i < word.length; i++) {
        if (word[i] == letter) {
          output[i] = letter;
        }
      }
    }
  }

  void start() {
    while (lives >= 0) {
      print(output);
      print("Lives: $lives");
      print("Enter the letter: ");
      String letter = stdin.readLineSync()!;
      if (validate(letter)) {
        guessIndex(letter);
      } else {
        print("Enter a correct input");
        lives--;
      }
      if (!output.contains("_")) {
        print("You won Bitch");
        return;
      }
    }
    print("Fuck off");
  }
}

class HangmanV3 {
  late String word;
  final List<String> words = [
    "apple",
    "banana",
    "orange",
    "pear",
  ];
  late List<String> guessedRightLetters;
  late List<String> guessedWrongLetters;
  late List<String> output;
  late int trys;

  HangmanV3() {
    word = words[Random().nextInt(words.length)];
    output = List.generate(word.length, (i) => '_');
    guessedWrongLetters = <String>[];
    guessedRightLetters = <String>[];
    trys = 0;
  }

  bool validate(String letter) {
    try {
      return letter.length == 1;
    } catch (e) {
      return false;
    }
  }

  void guessIndex(String letter) {
    if (!word.contains(letter)) {
      guessedWrongLetters.add(letter);
      print("Character not in the string");
    } else if (guessedRightLetters.contains(letter) ||
        guessedWrongLetters.contains(letter)) {
      print("Character already guessed");
    } else {
      guessedRightLetters.add(letter);
      for (int i = 0; i < word.length; i++) {
        if (word[i] == letter) {
          output[i] = letter;
        }
      }
    }
  }

  void start() {
    while (trys < word.length + 20) {
      print(output);
      trys++;
      print("Trys: $trys");
      print("Enter the letter: ");
      String letter = stdin.readLineSync()!;
      if (validate(letter)) {
        guessIndex(letter);
      } else {
        print("Enter a correct input");
      }
      if (!output.contains("_")) {
        print("You won Bitch");
        return;
      }
    }
    print("Padh jake! ek word nahi guess kar pa raha");
  }
}
