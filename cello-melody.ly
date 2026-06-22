celloPickup = \relative c' {
  \partial 4 r4
}

celloLeadIn = \relative c, {
  r1
}

celloSharedMelody = \relative c, {
  d'1 |
  cis1 |
  b1 |
  a2 d2 |
  a2 a2 |
  a2 e2 |
  g2 g2 |
}

celloRepeatMelody  = {
  \celloSharedMelody
  \relative c, { a'2 d2 }
}

celloOutroMelody = {
  \celloSharedMelody
  \relative c, { a'2 d4 r4 }
}
