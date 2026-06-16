recorderPickup = \relative c' {
  \partial 4 gis'8 b8
}

recorderLeadIn = \relative c' {
  r4 r4 r4 gis'8 b8
}

recorderSharedMelody = \relative c' {
  e'2. gis,8 b8 |
  dis2 \acciaccatura cis8 dis8 cis8 b8 a8 |
  cis2 \acciaccatura b8 cis8 b8 a8 gis8 |
  b4 gis8 fis8 e4 e8 gis8 |
  b4 e,8 gis8 b4 e,8 gis8 |
  b8 \acciaccatura a8 b8 a8 gis8 fis4 e8 fis8 |
  a4 e8 fis8 a4 e8 fis8 |
}

recorderRepeatMelody  = {
  \recorderSharedMelody
  \relative c' { b'8 \acciaccatura a8 b8 gis8 fis8 e4 gis8 b8 }
}
recorderOutroMelody = {
  \recorderSharedMelody
  \relative c' { b'8 \acciaccatura a8 b8 gis8 fis8 e4 r4 }
}
