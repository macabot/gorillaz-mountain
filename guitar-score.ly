\version "2.24.3"
\include "global.ly"
\include "guitar-melody.ly"

guitarPart = \relative c' {
  \clef "treble_8"
  \guitarPickup
  \guitarOutroChords
  \bar "|."
}

\score {
  \new Staff \with {
    midiInstrument = #"acoustic guitar (nylon)"
  } {
    \context Voice = "guitar" { << \global \guitarPart >> }
  }
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
