\version "2.24.3"
\include "global.ly"
\include "harp-melody.ly"

harpUpper = \relative c' {
  \harpUpperPickup
  \harpUpperOutroMelody
  \bar "|."
}

\score {
  \new Staff \with {
    % Harp with tin foil sounds like a sitar.
    midiInstrument = #"sitar"
  } {
    \context Voice = "harp" { << \global \harpUpper >> }
  }
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
