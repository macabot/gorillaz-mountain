harpUpperEmptyPickup = {
  \partial 4 r4^\markup \italic "Weave tin foil between strings"
}

harpUpperPickup = \relative c' {
  \partial 4 fis8 a8
}

harpUpperLeadIn = \relative c' {
  r4 r4 r4 fis8 a8
}

harpUpperSharedMelody = \relative c' {
  d'2~ d8 a'8 fis8 d8 |
  cis2 \acciaccatura b8 cis8 b8 a8 g8 |
  b2 \acciaccatura a8 b8 a8 g8 fis8 |
  a4 fis8 e8 d4 d8 fis8 |
  a4 d,8 fis8 a4 d,8 fis8 |
  a8 \acciaccatura g8 a8 g8 fis8 e4 d8 e8 |
  g4 d8 e8 g4 d8 e8 |
}

harpUpperRepeatMelody = {
  \harpUpperSharedMelody
  \relative c' { a'8 \acciaccatura g8 a8 fis8 e8 d4 fis8 a8 }
}

harpUpperOutroMelody = {
  \harpUpperSharedMelody
  \relative c' { a'8 \acciaccatura g8 a8 fis8 e8 d4 r4 }
}

harpLowerPickup = \relative c' {
  \partial 4 r4
}

harpLowerLeadIn = \relative c' {
  r1
}

harpLowerSharedMelody = \relative c' {
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
  r1 |
}

harpLowerRepeatMelody = {
  \harpLowerSharedMelody
  \relative c' { r1 }
}

harpLowerOutroMelody = {
  \harpLowerSharedMelody
  \relative c' { r1 }
}
