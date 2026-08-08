\version "2.24.3"

celloFirstHalfMelody = \relative c, {
  d'1 |
  cis1 |
  b1 |
  a2 d,2 |
}

celloSecondHalfMelody = \relative c, {
  a'1 |
  a2 e2 |
  g1 |
  a2 d,2 |
}

celloMelody = \relative c, {
  \celloFirstHalfMelody
  \celloSecondHalfMelody
}

celloStaffSettings = \with {
  midiInstrument = #"cello"
  midiMinimumVolume = #0.3
  midiMaximumVolume = #0.5
  midiBalance = #0.4
  instrumentName = #"Cello"
  shortInstrumentName = #"Vc."
}
