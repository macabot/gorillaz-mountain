\version "2.24.3"
\include "../global.ly"
\include "../parts/flute.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteVoltaMelody
  \bar "|."
}

% LAYOUT
\score {
  \new Staff \with {
    \fluteStaffSettings
  } {
    \context Voice = "flute" { << \global \flutePart >> }
  }
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
}

% MIDI
\score {
  \unfoldRepeats {
    \new Staff \with {
      \fluteStaffSettings
    } {
      \context Voice = "flute" { << \global \flutePart >> }
    }
  }
  \midi { }
}
