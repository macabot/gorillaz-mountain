\version "2.24.3"

pianoMelody = \relative c'' {
  d'4 a'4~ a8 d,4 cis8~ |
  cis8 a'4 cis,8 a'4 cis,4 |
  b4 a'4~ a8 b,4 a8~ |
  a8 a'4 a,8 a'4 a,4 |
  a4 a'4~ a8 a,4 a8~ |
  a8 a'4 a,8 a'4 a,4 |
  g4 g'4~ g8 g,4 cis8~ |
  cis1
  %cis8 a'4 cis,8 a'4 cis,4 |
}

pianoStaffSettings = \with {
  midiInstrument = #"acoustic grand"
  midiMinimumVolume = #0.7
  midiMaximumVolume = #0.9
  midiBalance = #0.0
  instrumentName = #"Piano"
  shortInstrumentName = #"Pno."
}
