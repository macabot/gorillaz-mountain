% HARP UPPER
harpUpperEmptyPickup = {
  \partial 4 r4^\markup \italic "Weave tin foil between strings"
}

harpUpperLeadIn = \relative c' {
  r4 r4 r4 d8 fis8
}

harpUpperSecondHalfSharedMelody = \relative c' {
  a'4 d,8 fis8 a4 d,8 fis8 |
  a8 \acciaccatura g8 a8 g8 fis8 e4 d8 e8 |
  g4 d8 e8 g4 d8 e8 |
}

harpUpperSharedMelody = \relative c' {
  d'2~ d8 a'8 fis8 d8 |
  cis2 \acciaccatura b8 cis8 b8 a8 g8 |
  b2 \acciaccatura a8 b8 a8 g8 fis8 |
  a4 fis8 e8 d4 d8 fis8 |
  \harpUpperSecondHalfSharedMelody
}

harpUpperRepeat = \relative c' {
  a'8 \acciaccatura g8 a8 fis8 e8 d4 fis8 a8
}

harpUpperSecondHalfRepeatMelody = {
  \harpUpperSecondHalfSharedMelody
  \harpUpperRepeat
}

harpUpperRepeatMelody = {
  \harpUpperSharedMelody
  \harpUpperRepeat
}

harpUpperOutro = \relative c' {
  a'8 \acciaccatura g8 a8 fis8 e8 d4 r4
}

harpUpperSecondHalfOutroMelody = {
  \harpUpperSecondHalfSharedMelody
  \harpUpperOutro
}

harpUpperOutroMelody = {
  \harpUpperSharedMelody
  \harpUpperOutro
}

% HARP LOWER
harpLowerPickup = \relative c' {
  \partial 4 r4
}

harpLowerLeadIn = \relative c' {
  r1
}

harpLowerSharedMelody = \relative c' {
  <fis, a d>4.\arpeggio fis,8~ fis2 |
  <fis' a cis>4.\arpeggio cis,8~ cis2 |
  <b' d g>4.\arpeggio d,8~ d2 |
  <cis' e a>2\arpeggio r8 fis,8 a8 d8 |
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
