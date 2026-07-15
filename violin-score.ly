\version "2.24.3"
\include "global.ly"
\include "flute-melody.ly"
\include "violin-melody.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteOutroMelody
  \bar "|."
}

violinPart = \relative c' {
  \partial 4 r4
  \violinMelody
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
      midiInstrument = #"violin"
      instrumentName = #"Violin"
      shortInstrumentName = #"Vln."
    } {
      \context Voice = "violin" { << \global \violinPart >> }
    }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
