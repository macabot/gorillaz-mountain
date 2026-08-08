\version "2.24.3"

violinFirstHalfMelody = \relative c' {
  fis1 | % D
  a1 | % Fis:m
  d1 | % G
  a1 | % A D
}

violinSecondHalfMelody = \relative c' {
  fis2 a2 | % D
  d,2 e2 | % D A
  b2 g'2 | % G E:m
  e2 d2 | % G:m D
}

violinMelody = \relative c' {
  \violinFirstHalfMelody
  \violinSecondHalfMelody
}

violinStaffSettings = \with {
  midiInstrument = #"violin"
  midiMinimumVolume = #0.4
  midiMaximumVolume = #0.6
  midiBalance = #-0.4
  instrumentName = #"Viool"
  shortInstrumentName = #"Vl."
}
