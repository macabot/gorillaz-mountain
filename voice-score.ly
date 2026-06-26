\version "2.24.3"
\include "global.ly"
\include "voice-melody.ly"

voicePart = {
  \clef treble
  \voiceMelody
}

\score {
  <<
    \new Staff \with {
      instrumentName = #"Voice"
      shortInstrumentName = #"Vo."
      midiInstrument = #"voice oohs"
      %midiInstrument = #"choir aahs"
    } {
      \new Voice = "vocalTrack" { \global \voicePart }
    }
    \new Lyrics \lyricsto "vocalTrack" { \voiceLyrics }
  >>
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
  }
  \midi { }
}
