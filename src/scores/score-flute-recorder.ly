\version "2.24.3"
\include "../global.ly"
\include "../parts/flute.ly"
\include "../parts/recorder.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteRepeatMelody
  \fluteOutroMelody
  \bar "|."
}

recorderPart = \relative c' {
  \partial 4 r4
  \repeat unfold 2 { \recorderMelody }
  \bar "|."
}

\score {
  <<
    \new Staff \with {
      midiInstrument = #"flute"
      midiMinimumVolume = #0.7
      midiMaximumVolume = #0.9
      midiBalance = #0.0
      instrumentName = #"Flute"
      shortInstrumentName = #"Fl."
    } {
      \context Voice = "flute" { << \global \flutePart >> }
    }

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
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
