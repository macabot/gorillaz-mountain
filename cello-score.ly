\version "2.24.3"
\include "global.ly"
\include "flute-melody.ly"
\include "cello-melody.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteOutroMelody
  \bar "|."
}

celloPart = \relative c' {
  \clef bass
  \partial 4 r4
  \celloMelody
  \bar "|."
}

\score {
  <<
    \new Staff \with {
      midiInstrument = #"flute"
      instrumentName = #"Flute"
      shortInstrumentName = #"Fl."
    } {
      \context Voice = "flute" { << \global \flutePart >> }
    }
    \new Staff \with {
      midiInstrument = #"cello"
      instrumentName = #"Cello"
      shortInstrumentName = #"Vc."
    } {
      \context Voice = "cello" { << \global \celloPart >> }
    }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
