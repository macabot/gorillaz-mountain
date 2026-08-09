\version "2.24.3"
\include "../global.ly"
\include "../parts/recorder.ly"

recorderPart = \relative c' {
  \recorderMelody
  \bar "|."
}

\score {
  <<
    \new Staff \with {
      \recorderStaffSettings
    } {
      \context Voice = "recorder" { << \global \recorderPart >> }
    }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
