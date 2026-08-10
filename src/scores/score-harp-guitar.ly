\version "2.24.3"
\include "../global.ly"
\include "../parts/harp.ly"
\include "../parts/guitar.ly"

harpPart = \relative c' {
  \harpPickup
  \harpOutroMelody
  \bar "|."
}

harpStaff = \new Staff \with {
  \harpStaffSettings
} {
  \context Voice = "harp" { << \global \harpPart >> }
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
    \harpStaff

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
    \harpStaff
    \new Staff \with {
      \guitarMidiStaffSettings
    } {
      \global
      \guitarMidiPart
    }
  >>
  \midi { }
}
