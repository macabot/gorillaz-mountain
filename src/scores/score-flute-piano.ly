\version "2.24.3"
\include "../global.ly"
\include "../parts/flute.ly"
\include "../parts/piano.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteOutroMelody
  \bar "|."
}

pianoPart = \relative c' {
  \partial 4 r4
  \ottava #1
  \pianoMelody
  \ottava #0
  \bar "|."
}

\score {
  <<
    \new Staff \with {
      midiInstrument = #"flute"
      midiMinimumVolume = #0.7
      midiMaximumVolume = #0.9
      midiBalance = #0.0
      instrumentName = #"Flute"
      shortInstrumentName = #"Fl."
    } {
      \context Voice = "flute" { << \global \flutePart >> }
    }

    \new Staff \with {
      midiInstrument = #"acoustic grand"
      midiMinimumVolume = #0.7
      midiMaximumVolume = #0.9
      midiBalance = #0.0
      instrumentName = #"Piano"
      shortInstrumentName = #"Pi."
    } {
      \context Voice = "paino" { << \global \pianoPart >> }
    }
  >>
  \layout { }
  \midi { }
}
