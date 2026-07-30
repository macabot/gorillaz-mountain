\version "2.24.3"
\include "global.ly"
\include "flute-melody.ly"
\include "drum-rhythm.ly"
\include "shaker-rhythm.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteOutroMelody
  \bar "|."
}

drumPart = {
  \partial 4 r4
  \drumRhythm
  \bar "|."
}

shakerPart = {
  \partial 4 r4
  \shakerRhythm
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

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      % Do not set the midiInstrument when using \drummode.
      %midiMinimumVolume = #0.3
      %midiMaximumVolume = #0.6
      midiBalance = #-0.3
      instrumentName = #"Drum"
      shortInstrumentName = #"Dr."
    } {
      \context DrumVoice = "percussion" { << \global \drumPart >> }
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      % Do not set the midiInstrument when using \drummode.
      %midiMinimumVolume = #0.2
      %midiMaximumVolume = #0.4
      midiBalance = #0.4
      instrumentName = #"Shaker"
      shortInstrumentName = #"Shk."
    } {
      \context DrumVoice = "shaker" { << \global \shakerPart >> }
    }
  >>
  \layout { }
  \midi { }
}
