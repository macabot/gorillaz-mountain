\version "2.24.3"
\include "global.ly"
\include "flute-melody.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteRepeatMelody
  \fluteOutroMelody
  \bar "|."
}

\score {
  \new Staff \with {
    midiInstrument = #"flute"
  } {
    \context Voice = "flute" { << \global \flutePart >> }
  }
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
