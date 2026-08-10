\version "2.24.3"
\include "../global.ly"
\include "../parts/voice.ly"

voicePart = {
  \clef "treble_8"
  \voiceMelody
}

\score {
  <<
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
