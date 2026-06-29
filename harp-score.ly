\version "2.24.3"
\include "global.ly"
\include "harp-melody.ly"

harpPart = {
  \harpLeadIn
  \harpSecondHalfRepeatMelody
  \harpOutroMelody
  \bar "|."
}

\score {
  \new Staff \with {
    % Harp with tin foil sounds like a sitar.
    midiInstrument = #"sitar"
  } {
    \context Voice = "harp" { \clef treble << \global \harpPart >> }
  }
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
