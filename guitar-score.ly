\version "2.24.3"
\include "global.ly"
\include "guitar-melody.ly"

% --- PDF Visual Output ---
\score {
  <<
    \new ChordNames {
      \transpose c c, \chordmode {
        d1 fis:m g a2 d d1 d2 a g e:m g:m d
      }
    }
    \new Staff {
      \clef "treble_8"
      \guitarOutroChords
      \bar "|."
    }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
}

% --- MIDI Audio Output ---
\score {
  \new Staff \with {
    midiInstrument = #"acoustic guitar (nylon)"
    midiMinimumVolume = #0.3
    midiMaximumVolume = #1.0
  } {
    \guitarMidiPattern
  }
  \midi {
    \tempo 4 = 90
  }
}