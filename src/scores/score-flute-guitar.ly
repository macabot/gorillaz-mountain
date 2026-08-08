\version "2.24.3"
\include "../global.ly"
\include "../parts/flute.ly"
\include "../parts/guitar.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteOutroMelody
  \bar "|."
}

fluteStaff = \new Staff \with {
  \fluteStaffSettings
} {
  \context Voice = "flute" { << \global \flutePart >> }
}

guitarLayoutChords = {
  \partial 4 r4
  \guitarChords
}

guitarLayoutPart = {
  \clef "treble_8"
  \partial 4 r4
  \guitarMelody
  \bar "|."
}

guitarMidiPart = {
  \partial 4 r4
  \guitarMidiPattern
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

    \new Staff \with {
      \guitarLayoutStaffSettings
     } {
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
      \guitarMidiStaffSettings
    } {
      \global
      \guitarMidiPart
    }
  >>
  \midi { }
}
