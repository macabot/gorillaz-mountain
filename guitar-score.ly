\version "2.24.3"
\include "global.ly"
\include "flute-melody.ly"
\include "guitar-melody.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteRepeatMelody
  \fluteOutroMelody
  \bar "|."
}

fluteStaff = \new Staff \with {
  midiInstrument = #"flute"
  midiMinimumVolume = #0.7
  midiMaximumVolume = #0.9
  midiBalance = #0.0
  instrumentName = #"Flute"
  shortInstrumentName = #"Fl."
} {
  \context Voice = "flute" { << \global \flutePart >> }
}

guitarLayoutChords = {
  \partial 4 r4
  \repeat unfold 2 { \guitarChords }
}

guitarLayoutPart = {
  \clef "treble_8"
  \partial 4 r4
  \repeat unfold 2 { \guitarMelody }
  \bar "|."
}

guitarMidiPart = {
  \partial 4 r4
  \repeat unfold 2 { \guitarMidiPattern }
}

% LAYOUT SCORE
\score {
  <<
    \fluteStaff

    \new ChordNames \with {
      noChordSymbol = ##f
    } {
      \guitarLayoutChords
    }

    \new Staff \with { } {
      \global
      \guitarLayoutPart
    }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
}

% MIDI SCORE
\score {
  <<
    \fluteStaff
    \new Staff \with {
      midiInstrument = #"acoustic guitar (nylon)"
      midiMinimumVolume = #0.2
      midiMaximumVolume = #0.5
    } {
      \global
      \guitarMidiPart
    }
  >>
  \midi { }
}
