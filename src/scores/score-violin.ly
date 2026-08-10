\version "2.24.3"
\include "../global.ly"
\include "../parts/violin.ly"
\include "../parts/cello.ly"

violinPart = \relative c' {
  \violinMelody
  \bar "|."
}

\score {
  <<
    \new Staff \with {
      \violinStaffSettings
    } {
      \context Voice = "violin" { << \global \violinPart >> }
    }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
