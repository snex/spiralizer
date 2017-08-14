# spiralizer

Ruby gem that takes a matrix (or two dimensional array) and returns a string. The matrix may be of arbitrary size and must consist of uppercase English letters. The returned string will consist of all elements of the matrix ordered in a clockwise spiral pattern starting with element [0, 0]. Each letter is converted to lowercase and separated by a single whitespace character.

For example, given the following matrix:
```
A B C D
E F G H
I J K L
```

The resulting string would be:
```
"a b c d h l k j i e f g"
```
