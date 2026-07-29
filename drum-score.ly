\version "2.24.3"
\include "global.ly"
\include "flute-melody.ly"
\include "drum-rhythm.ly"

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
      midiInstrument = #"melodic tom"
      midiMinimumVolume = #0.2
      midiMaximumVolume = #0.5
      instrumentName = #"Percussion"
      shortInstrumentName = #"Perc."
    } {
      \context DrumVoice = "percussion" {
        <<
          \global
          \drumPart
        >>
      }
    }
  >>
  \layout { }
  \midi { }
}