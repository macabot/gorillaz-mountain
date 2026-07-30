%{
intro
drums until stops
flute
flute guitar sitar halfway
flute base shaker shingle guitar sitar
[flute' base shaker shingle guitar sitar]
flute aahs no-drums, shaker
flute-high, base (first half), aahs,
flute drums, sitar, aahs
outro
%}

\version "2.24.3"
\include "global.ly"
\include "flute-melody.ly"
\include "recorder-melody.ly"
\include "drum-rhythm.ly"
\include "shaker-rhythm.ly"
\include "guitar-melody.ly"
\include "violin-melody.ly"
\include "cello-melody.ly"
\include "harp-melody.ly"
\include "voice-melody.ly"

\paper {
  #(set-paper-size "a4")
}

\header {
  title = "The Mountain"
  composer = "Gorillaz ft. Dennis Hopper, Ajay Prasanna, Anoushka Shankar, Amaan & Ayaan Ali Bangash"
  arranger = "Arranged by Michael Cabot"
  tagline = "Cover for the MidwoudMuziekMiddag"
}

flutePart = \relative c' {
  \flutePickup
  \repeat unfold 5 { \fluteRepeatMelody }
  \fluteOutroMelody
  \bar "|."
}
recorderPart = \relative c' {
  \partial 4 r4
  R1*7
  \recorderLeadIn
  \repeat unfold 4 { \recorderRepeatMelody }
  \recorderOutroMelody
  \bar "|."
}
drumPart = {
  \partial 4 r4
  \repeat unfold 3 { \drumRhythm }
  R1 * 24
  \bar "|."
}
shakerPart = {
  \partial 4 r4
  R1 * 16
  \repeat unfold 4 { \shakerRhythm }
  \bar "|."
}
percussionPart = \drummode {
  \partial 4 r4
  R1*48
  \bar "|."
}
%{
pianoUpper = \relative c' {
  \partial 4 r4
  R1*48
  \bar "|."
}
pianoLower = \relative c' {
  \partial 4 r4
  R1*48
  \bar "|."
}
%}
harpPart = \relative c' {
  \harpEmptyPickup
  R1*11
  \harpLeadIn
  \harpSecondHalfRepeatMelody
  \harpOutroMelody
  R1*15
  \harpLeadIn
  \harpOutroMelody
  \bar "|."
}
guitarShared = {
  \partial 4 r4
  R1 * 8
  \repeat unfold 1 { \guitarRepeatChords }
  \guitarOutroChords
  R1*24
}
guitarChordNames = {
  \set chordChanges = ##t
  \guitarShared
}
guitarPart = {
  \clef "treble_8"
  \guitarShared
  \bar "|."
}
violinPart = \relative c' {
  \partial 4 r4
  R1 * 16
  \violinMelody
  R1*8
  \violinFirstHalfMelody R1*4
  R1*8
  \bar "|."
}
celloPart = \relative c' {
  \clef bass
  \partial 4 r4
  R1 * 16
  \celloMelody
  R1*8
  \celloFirstHalfMelody R1*4
  R1*8
  \bar "|."
}

voicePart = {
  \clef "treble_8"
  \partial 4 r4
  R1 * 24
  \repeat unfold 3 { \voiceMelody }
}

lyricsPart = {
  \repeat unfold 3 { \voiceLyrics }
}

% --- SCORE OUTPUT ---
\score {
  <<
    % --- WOODWINDS ---
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
      midiInstrument = #"recorder"
      midiMinimumVolume = #0.5
      midiMaximumVolume = #0.8
      midiBalance = #0.1
      instrumentName = #"Recorder"
      shortInstrumentName = #"Rec."
    } {
      \context Voice = "recorder" { << \global \recorderPart >> }
    }

    % --- PERCUSSION ---
    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      % Do not set the midiInstrument when using \drummode.
      %midiMinimumVolume = #0.3
      %midiMaximumVolume = #0.6
      midiBalance = #-0.3
      instrumentName = #"Drum"
      shortInstrumentName = #"Dr."
    } {
      \context DrumVoice = "percussion" { << \global \drumPart >> }
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      % Do not set the midiInstrument when using \drummode.
      %midiMinimumVolume = #0.2
      %midiMaximumVolume = #0.4
      midiBalance = #0.4
      instrumentName = #"Shaker"
      shortInstrumentName = #"Shk."
    } {
      \context DrumVoice = "shaker" { << \global \shakerPart >> }
    }

    % --- KEYBOARD / PLUCKED ---
    %{
    \new PianoStaff \with {
      midiInstrument = #"acoustic grand"
      midiMinimumVolume = #0.4
      midiMaximumVolume = #0.7
      midiBalance = #-0.3
      instrumentName = #"Piano"
      shortInstrumentName = #"Pno."
    } <<
      \new Staff { \clef treble << \global \pianoUpper >> }
      \new Staff { \clef bass << \global \pianoLower >> }
    >>
    %}

    \new Staff \with {
      % Harp with tin foil sounds like a sitar.
      midiInstrument = #"sitar"
      midiMinimumVolume = #0.3
      midiMaximumVolume = #0.6
      midiBalance = #0.5
      instrumentName = #"Harp"
      shortInstrumentName = #"Hp."
    } {
      \context Voice = "harp" { \clef treble << \global \harpPart >> }
    }

    <<
      \new ChordNames {
        \guitarChordNames
      }
      \new Staff \with {
        midiInstrument = #"acoustic guitar (nylon)"
        midiMinimumVolume = #0.3
        midiMaximumVolume = #0.6
        midiBalance = #0.3
        instrumentName = #"Guitar"
        shortInstrumentName = #"Gt."
      } {
        \context Voice = "guitar" << \global \guitarPart >>
      }
    >>

    % --- STRINGS ---
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
      midiMinimumVolume = #0.3
      midiMaximumVolume = #0.5
      midiBalance = #0.4
      instrumentName = #"Cello"
      shortInstrumentName = #"Vc."
    } {
      \context Voice = "cello" << \global \celloPart >>
    }

    \new Staff \with {
      instrumentName = #"Voice"
      midiMinimumVolume = #0.3
      midiMaximumVolume = #0.5
      midiBalance = #0.0
      shortInstrumentName = #"Vo."
      midiInstrument = #"voice oohs"
      %midiInstrument = #"choir aahs"
    } {
      \new Voice = "vocalTrack" { \global \voicePart }
    }
    \new Lyrics \lyricsto "vocalTrack" { \lyricsPart }

  >>
  \layout {
    indent = 1.5 \cm
    short-indent = 0.5 \cm
  }
  \midi { }
}
