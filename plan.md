# Hangman Terminal Game - Plan
## 1 - Understand
The program outputs a 5 to 12 character-long English word (guess word) for which each character is hidden. Each character is hidden by an underscore "_". The guess word is randomly selected from a text file containing a list of words. The player is prompted to guess case-insensitive letters of the word. If they guess a letter contained in the guess word, that letter is revealed in the word. Letters guessed by the player are displayed so that the player doesn't repeat a guess. The player has a limited number of rounds to guess the guess word before they lose. They win if they manage to guess the guess word in the number of rounds alloted. There is a maximum of seven incorrect guesses. 

## 2 - Plan
### User Interface
The UI is the terminal. 

The progressive hangman graphics are found in *hangman_graphics.txt*.

Samples of the UI design can be found in *ui_design.txt*.

That's enough for today. Finish ui_design.txt and then move-on.

### Inputs
1. Guess Word from file
2. User input
3. Save game

### Outputs

### Steps
#### Filtered Text File
The text file can be filtered based on word length. Include min and max word length as parameters for the method.
Mind escape characters when counting string length. Test. 
Pseudocode
* Read word list
* Read each line
* Better to store words to array then write all to text file, or update text file every iteration? Prob store to array.
* Push to array if it passes filter
* Return within method
* Generate new text file outside of method. Simplify!




Ideas:
  * Create a program that filters the world txt document for only-valid words, so fetching them is faster. No, no need actually, because we only need one word from all of them. Still, it'd be cool to create a text file with only those words. Little bonus task that I'm happy to do. 
  * UI step: Actually plan what your UI should look like in the terminal. Plan exactly what it says and how it's formatted. Styling is cool if you do it right. 




