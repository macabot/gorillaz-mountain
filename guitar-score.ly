\version "2.24.3"
\include "global.ly"
\include "guitar-melody.ly"

guitarShared = {
  \partial 4 r4
  R1 * 8
  \guitarOutroChords
}
guitarChordNames = {
  \set chordChanges = ##t
  \guitarShared
}
guitarPart = {
  \clef "treble_8"
  \guitarShared
  \bar "|."
}

\score {
  <<
    \new ChordNames {
      \guitarChordNames
    }
    \new Staff \with {
      midiInstrument = #"acoustic guitar (nylon)"
    } {
      \context Voice = "guitar" { << \global \guitarPart >> }
    }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
