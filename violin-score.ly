\version "2.24.3"
\include "global.ly"
\include "flute-melody.ly"
\include "violin-melody.ly"
\include "cello-melody.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteOutroMelody
  \bar "|."
}

violinPart = \relative c' {
  \partial 4 r4
  \violinMelody
  \bar "|."
}

celloPart = \relative c' {
  \clef bass
  \partial 4 r4
  \celloMelody
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
      midiInstrument = #"violin"
      midiMinimumVolume = #0.4
      midiMaximumVolume = #0.6
      midiBalance = #-0.4
      instrumentName = #"Violin"
      shortInstrumentName = #"Vln."
    } {
      \context Voice = "violin" { << \global \violinPart >> }
    }
    \new Staff \with {
      midiInstrument = #"cello"
      midiMinimumVolume = #0.7
      midiMaximumVolume = #0.9
      midiBalance = #0.4
      instrumentName = #"Cello"
      shortInstrumentName = #"Vc."
    } {
      \context Voice = "cello" << \global \celloPart >>
    }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
