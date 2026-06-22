recorderPickup = \relative c' {
  \partial 4 fis8 a8
}

recorderLeadIn = \relative c' {
  r4 r4 r4 fis8 a8
}

recorderSharedMelody = \relative c' {
  d'2. fis,8 a8 |
  cis2 \acciaccatura b8 cis8 b8 a8 g8 |
  b2 \acciaccatura a8 b8 a8 g8 fis8 |
  a4 fis8 e8 d4 d8 fis8 |
  a4 d,8 fis8 a4 d,8 fis8 |
  a8 \acciaccatura g8 a8 g8 fis8 e4 d8 e8 |
  g4 d8 e8 g4 d8 e8 |
}

recorderRepeatMelody  = {
  \recorderSharedMelody
  \relative c' { a'8 \acciaccatura g8 a8 fis8 e8 d4 fis8 a8 }
}

recorderOutroMelody = {
  \recorderSharedMelody
  \relative c' { a'8 \acciaccatura g8 a8 fis8 e8 d4 r4 }
}