\version "2.24.3"
\include "../global.ly"
\include "../parts/shaker.ly"

shakerPart = {
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
