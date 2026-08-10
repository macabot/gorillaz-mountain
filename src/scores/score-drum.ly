\version "2.24.3"
\include "../global.ly"
\include "../parts/drum.ly"

drumPart = {
  \drumRhythm
  \bar "|."
}

\score {
  <<
    \new DrumStaff \with {
      \drumStaffSettings
    } {
      \context DrumVoice = "percussion" { << \global \drumPart >> }
    }
  >>
  \layout { }
  \midi { }
}
