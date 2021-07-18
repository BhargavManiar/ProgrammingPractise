
# Project 5

## Contents

### Day 27
1. Setting up
2. Reading from disk: contentsOfFile
3. Pick a word, any word: UIAlertController

### Day 28
1. Prepare for submission: lowercased() and IndexPath
2. Checking for valid answers
3. Or else what? 

### Day 29
1. Wrap up

## Project 5 Challenges

1. Disallow answers that are shorter than three letters or are just our start word. For the three-letter check, the easiest
thing to do is put a check into isReal() that returns false if the word length is under three letters. For the second part,
just compare the start word against their input word and return false if they are the same.

2. Refactor all the else statements we just added so that they call a new method called showErrorMessage(). This 
should accept an error message and a title, and do all the UIAlertController work from there.

3. Add a left bar button item that calls startGame(), so users can restart with a new word whenever they want to.

### Bonus 

Once you’ve done those three, there’s a really subtle bug in our game and I’d like you to try finding and fixing it.

To trigger the bug, look for a three-letter word in your starting word, and enter it with an uppercase letter. Once it appears in the
table, try entering it again all lowercase – you’ll see it gets entered. Can you figure out what causes this and how to fix it?

Project 12 Challenge 3 requires editing this app.
