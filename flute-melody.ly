flutePickup = \relative c' {
  \partial 4 gis'8 b8
}

fluteLeadIn = \relative c' {
  r4 r4 r4 gis'8 b8
}

fluteSharedMelody = \relative c' {
  e'2. gis,8 b8 |
  dis2 dis8 cis8 b8 a8 |
  cis2 cis8 b8 a8 gis8 |
  b4 gis8 fis8 e4 e8 gis8 |
  b4 e,8 gis8 b4 e,8 gis8 |
  b4 a8 gis8 fis4 e8 fis8 |
  a4 e8 fis8 a4 e8 fis8 |
}

fluteRepeatMelody  = {
  \fluteSharedMelody
  \relative c' { b'4 gis8 fis8 e4 gis8 b8 }
}
fluteOutroMelody = {
  \fluteSharedMelody
  \relative c' { b'4 gis8 fis8 e4 r4 }
}
