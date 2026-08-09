\version "2.24.3"

flutePickup = \relative c' {
  \partial 4 fis8 a8
}

fluteLeadIn = \relative c' {
  r4 r4 r4 fis8 a8
}

fluteSharedMelody = \relative c' {
  d'2. fis,8 a8 |
  cis2 cis8 b8 a8 g8 |
  b2 b8 a8 g8 fis8 |
  a4 fis8 e8 d4 d8 fis8 |
  a4 d,8 fis8 a4 d,8 fis8 |
  a4 g8 fis8 e4 d8 e8 |
  g4 d8 e8 g4 d8 e8 |
}

fluteRepeatEnd = \relative c' {
  a'4 fis8 e8 d4 fis8 a8 |
}

fluteOutroEnd = \relative c' {
  a'4 fis8 e8 d2 |
}

fluteRepeatMelody  = {
  \fluteSharedMelody
  \fluteRepeatEnd
}

fluteOutroMelody = {
  \fluteSharedMelody
  \fluteOutroEnd
}

fluteVoltaMelody = {
  \repeat volta 2 {
    \fluteSharedMelody
  }
  \alternative {
    { \fluteRepeatEnd }
    { \fluteOutroEnd }
  }
}

fluteStaffSettings = \with {
  midiInstrument = #"flute"
  midiMinimumVolume = #0.7
  midiMaximumVolume = #0.9
  midiBalance = #0.0
  instrumentName = #"Dwarsfluit"
  shortInstrumentName = #"Fl."
}
