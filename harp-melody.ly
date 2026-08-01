harpInstructionPickup = {
  \partial 4 r4^\markup \italic "Weave tin foil between strings"
}

harpLeadIn = \relative c' {
  r4 r4 r4 fis8 a8
}

harpSecondHalfLeadIn = \relative c' {
  r4 r4 r4 d8 fis8
}

harpSecondHalfSharedMelody = \relative c' {
  a'4 d,8 fis8 a4 d,8 fis8 |
  a8 \acciaccatura g8 a8 g8 fis8 e4 d8 e8 |
  g4 d8 e8 g4 d8 e8 |
}

harpSharedMelody = \relative c' {
  d'2~ d8 a'8 fis8 d8 |
  cis2 \acciaccatura b8 cis8 b8 a8 g8 |
  b2 \acciaccatura a8 b8 a8 g8 fis8 |
  a4 fis8 e8 d4 d8 fis8 |
  \harpSecondHalfSharedMelody
}

harpRepeat = \relative c' {
  a'8 \acciaccatura g8 a8 fis8 e8 d4 fis8 a8
}

harpSecondHalfRepeatMelody = {
  \harpSecondHalfSharedMelody
  \harpRepeat
}

harpRepeatMelody = {
  \harpSharedMelody
  \harpRepeat
}

harpOutro = \relative c' {
  a'8 \acciaccatura g8 a8 fis8 e8 d2
}

harpSecondHalfOutroMelody = {
  \harpSecondHalfSharedMelody
  \harpOutro
}

harpOutroMelody = {
  \harpSharedMelody
  \harpOutro
}
