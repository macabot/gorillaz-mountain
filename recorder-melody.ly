recorderPickup = \relative c' {
  \partial 4 r4
}

recorderLeadIn = \relative c' {
  r1
}

recorderSharedMelody = \relative c' {
  r4 fis8 a8 d2 |
  r4 fis,8 a8 cis2 |
  \acciaccatura b8 cis8 b8 a8 g8 b2 |
  \acciaccatura a8 b8 a8 fis8 e8 d2 |
  a'8 a8 a8 r8 a8 a8 a8 r8 |
  a8 \acciaccatura g8 a8 g8 fis8 e4 d8 e8 |
  g8 g8 g8 r8 g8 g8 g8 r8 |
}

recorderRepeatMelody  = {
  \recorderSharedMelody
  \relative c' { a'8 \acciaccatura g8 a8 fis8 e8 d4 r4 }
}

recorderOutroMelody = {
  \recorderSharedMelody
  \relative c' { a'8 \acciaccatura g8 a8 fis8 e8 d4 r4 }
}