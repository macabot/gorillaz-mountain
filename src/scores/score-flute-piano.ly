\version "2.24.3"
\include "../global.ly"
\include "../parts/flute.ly"
\include "../parts/piano.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteOutroMelody
  \bar "|."
}

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
      \fluteStaffSettings
    } {
      \context Voice = "flute" { << \global \flutePart >> }
    }

    \new Staff \with {
      \pianoStaffSettings
    } {
      \context Voice = "piano" { << \global \pianoPart >> }
    }
  >>
  \layout { }
  \midi { }
}
