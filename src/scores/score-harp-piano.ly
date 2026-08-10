\version "2.24.3"
\include "../global.ly"
\include "../parts/harp.ly"
\include "../parts/piano.ly"

harpPart = \relative c' {
  \harpPickup
  \harpOutroMelody
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
      \harpStaffSettings
    } {
      \context Voice = "harp" { << \global \harpPart >> }
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
