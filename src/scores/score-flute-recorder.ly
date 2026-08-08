\version "2.24.3"
\include "../global.ly"
\include "../parts/flute.ly"
\include "../parts/recorder.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteOutroMelody
  \bar "|."
}

recorderPart = \relative c' {
  \partial 4 r4
  \recorderMelody
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
