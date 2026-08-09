\version "2.24.3"
\include "../global.ly"
\include "../parts/shaker.ly"

shakerPart = {
  \partial 4 r4
  \shakerRhythm
  \bar "|."
}

\score {
  <<
    \new DrumStaff \with {
      \shakerStaffSettings
    } {
      \context DrumVoice = "shaker" { << \global \shakerPart >> }
    }
  >>
  \layout { }
  \midi { }
}
