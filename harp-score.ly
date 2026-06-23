\version "2.24.3"
\include "global.ly"
\include "harp-melody.ly"

harpUpper = {
  \harpUpperPickup
  \harpUpperOutroMelody
  \bar "|."
}

harpLower = {
  \harpLowerPickup
  \harpLowerOutroMelody
  \bar "|."
}

\score {
  \new PianoStaff \with {
    % Harp with tin foil sounds like a sitar.
    midiInstrument = #"sitar"
  } <<
    \new Staff { \clef treble << \global \harpUpper >> }
    \new Staff { \clef bass << \global \harpLower >> }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
