\version "2.24.3"
\include "global.ly"
\include "flute-melody.ly"
\include "voice-melody.ly"

flutePart = \relative c' {
  \flutePickup
  \fluteOutroMelody
  \bar "|."
}

voicePart = {
  \clef "treble_8"
  \partial 4 r4
  \voiceMelody
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
