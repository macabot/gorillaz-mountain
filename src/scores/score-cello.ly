\version "2.24.3"
\include "../global.ly"
\include "../parts/cello.ly"

celloPart = \relative c' {
  \clef bass
  \partial 4 r4
  \celloMelody
  \bar "|."
}

\score {
  <<
    \new Staff \with {
      \celloStaffSettings
    } {
      \context Voice = "cello" { << \global \celloPart >> }
    }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
