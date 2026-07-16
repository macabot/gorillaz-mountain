guitarPickup = \relative c' {
  \partial 4 r4
}

guitarLeadIn = \relative c' {
  r1
}

guitarSharedChords = \transpose c c, \chordmode {
  d8 d8 d8 d8 d8 d8 d8 d8 |
  fis8:m fis8:m fis8:m fis8:m fis8:m fis8:m fis8:m fis8:m |
  g8 g8 g8 g8 g8 g8 g8 g8 |
  a8 a8 a8 a8 d8 d8 d8 d8 |
  d8 d8 d8 d8 d8 d8 d8 d8 |
  d8 d8 d8 d8 a8 a8 a8 a8 |
  g8 g8 g8 g8 e8:m e8:m e8:m e8:m |
}

% TODO: Is G minor correct?
guitarRepeatChords = {
  \guitarSharedChords
  \transpose c c, \chordmode {
    g8:m g8:m g8:m g8:m d8 d8 d8 d8 |
  }
}

guitarOutroChords = {
  \guitarSharedChords
  \transpose c c, \chordmode {
    g8:m g8:m g8:m g8:m d8 d8 r4 |
  }
}