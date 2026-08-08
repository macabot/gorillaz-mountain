\version "2.24.3"
\include "../global.ly"
\include "../parts/flute.ly"
\include "../parts/voice.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteRepeatMelody
  \fluteOutroMelody
  \bar "|."
}

voicePart = {
  \clef "treble_8"
  \partial 4 r4
  \repeat unfold 2 { \voiceMelody }
}

\score {
  <<
    \new Staff \with {
      \fluteStaffSettings
    } {
      \context Voice = "flute" { << \global \flutePart >> }
    }

    \new Staff \with {
      \voiceStaffSettings
    } {
      \new Voice = "vocalTrack" { \global \voicePart }
    }
    \new Lyrics \lyricsto "vocalTrack" { \repeat unfold 2 { \voiceLyrics } }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
