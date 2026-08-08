\version "2.24.3"
\include "../global.ly"
\include "../parts/flute.ly"
\include "../parts/drum.ly"
\include "../parts/shaker.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteOutroMelody
  \bar "|."
}

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

\score {
  <<
    \new Staff \with {
      \fluteStaffSettings
    } {
      \context Voice = "flute" { << \global \flutePart >> }
    }

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
  >>
  \layout { }
  \midi { }
}
