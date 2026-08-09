\version "2.24.3"
\include "../global.ly"
\include "../parts/recorder.ly"
\include "../parts/harp.ly"

recorderPart = \relative c' {
  \partial 4 r4
  \recorderMelody
  \bar "|."
}

harpPart = {
  \harpPickup
  \harpOutroMelody
  \bar "|."
}

\score {
  <<
    \new Staff \with {
      \recorderStaffSettings
    } {
      \context Voice = "recorder" { << \global \recorderPart >> }
    }
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
