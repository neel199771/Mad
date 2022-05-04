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
void main(List<String> arguments) {
  Hangman().start();
}
