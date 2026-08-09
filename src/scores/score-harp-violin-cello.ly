\version "2.24.3"
\include "../global.ly"
\include "../parts/harp.ly"
\include "../parts/violin.ly"
\include "../parts/cello.ly"

harpPart = \relative c' {
  \harpPickup
  \harpOutroMelody
  \bar "|."
}

violinPart = \relative c' {
  \partial 4 r4
  \violinMelody
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
      \harpStaffSettings
    } {
      \context Voice = "harp" { << \global \harpPart >> }
    }
    \new Staff \with {
      \violinStaffSettings
    } {
      \context Voice = "violin" { << \global \violinPart >> }
    }
    \new Staff \with {
      \celloStaffSettings
    } {
      \context Voice = "cello" << \global \celloPart >>
    }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
