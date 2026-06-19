celloPickup = \relative c' {
  \partial 4 r4
}

celloLeadIn = \relative c, {
  r1
}

celloSharedMelody = \relative c, {
  e'1 |
  dis1 |
  cis1 |
  b2 e2 |
  b2 b2 |
  b2 fis2 |
  a2 a2 |
}

celloRepeatMelody  = {
  \celloSharedMelody
  \relative c, { b'2 e2 }
}
celloOutroMelody = {
  \celloSharedMelody
  \relative c, { b'2 e4 r4 }
}
