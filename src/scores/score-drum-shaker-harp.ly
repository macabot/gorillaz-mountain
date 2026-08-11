\version "2.24.3"
\include "../global.ly"
\include "../parts/drum.ly"
\include "../parts/shaker.ly"
\include "../parts/harp.ly"

drumPart = {
  \partial 4 r4
  \drumRhythm
  \bar "|."
}

shakerPart = {
  \partial 4 r4
  \shakerRhythm
  \bar "|."
}

harpPart = \relative c' {
  \harpPickup
  \harpOutroMelody
  \bar "|."
}

\score {
  <<
    \new DrumStaff \with {
      \drumStaffSettings
    } {
      \context DrumVoice = "percussion" { << \global \drumPart >> }
    }

    \new DrumStaff \with {
      \shakerStaffSettings
    } {
      \context DrumVoice = "shaker" { << \global \shakerPart >> }
    }

    \new Staff \with {
      \harpStaffSettings
    } {
      \context Voice = "harp" { << \global \harpPart >> }
    }
  >>
  \layout { }
  \midi { }
}
