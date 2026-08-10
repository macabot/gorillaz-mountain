\version "2.24.3"
\include "../global.ly"
\include "../parts/harp.ly"

harpPart = {
  \harpInstructionSecondHalfLeadIn
  \harpSecondHalfRepeatMelody
  \harpVoltaMelody
  \bar "|."
}

\score {
  <<
    \new Staff \with {
      \harpStaffSettings
    } {
      \context Voice = "harp" { \clef treble << \global \harpPart >> }
    }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
