\version "2.24.3"
\include "global.ly"
\include "recorder-melody.ly"

recorderPart = \relative c' {
  \recorderPickup
  \recorderOutroMelody
  \bar "|."
}

\score {
  \new Staff \with {
    midiInstrument = #"recorder"
  } {
    \context Voice = "recorder" { << \global \recorderPart >> }
  }
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
