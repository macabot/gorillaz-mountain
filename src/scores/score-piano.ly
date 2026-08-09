\version "2.24.3"
\include "../global.ly"
\include "../parts/piano.ly"

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
      \pianoStaffSettings
    } {
      \context Voice = "piano" { << \global \pianoPart >> }
    }
  >>
  \layout { }
  \midi { }
}
