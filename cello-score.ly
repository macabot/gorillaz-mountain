\version "2.24.3"
\include "global.ly"
\include "cello-melody.ly"

celloPart = \relative c' {
  \clef bass
  \celloPickup
  \celloOutroMelody
  \bar "|."
}

\score {
  \new Staff \with {
    midiInstrument = #"cello"
  } {
    \context Voice = "cello" { << \global \celloPart >> }
  }
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
