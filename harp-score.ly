\version "2.24.3"
\include "global.ly"
\include "recorder-melody.ly"
\include "harp-melody.ly"

recorderPart = \relative c' {
  R1*5
  \recorderMelody
  \bar "|."
}

harpPart = {
  \harpSecondHalfLeadIn
  \harpSecondHalfRepeatMelody
  \harpOutroMelody
  \bar "|."
}

\score {
  <<
    \new Staff \with {
      midiInstrument = #"recorder"
      midiMinimumVolume = #0.5
      midiMaximumVolume = #0.8
      midiBalance = #0.1
      instrumentName = #"Recorder"
      shortInstrumentName = #"Rec."
    } {
      \context Voice = "recorder" { << \global \recorderPart >> }
    }
    \new Staff \with {
      % Harp with tin foil sounds like a sitar.
      midiInstrument = #"sitar"
      midiMinimumVolume = #0.3
      midiMaximumVolume = #0.6
      midiBalance = #0.5
      instrumentName = #"Harp"
      shortInstrumentName = #"Hp."
    } {
      \context Voice = "harp" { \clef treble << \global \harpPart >> }
    }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
