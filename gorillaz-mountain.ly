%{
intro
drums until stops

flute
flute shaker halfway guitar
flute shaker guitar base (sounds full)
flute'' base shingle guitar
flute aahs no-drums, shingle, shaker
flute


intro
drums until stops
flute
flute guitar sitar halfway
flute base shaker shingle guitar sitar
flute' base shaker shingle guitar sitar
flute aahs no-drums, shaker
flute-high, base (first half), aahs,
flute drums, sitar, aahs
outro
%}

\version "2.24.3"
\include "global.ly"
\include "flute-melody.ly"
\include "recorder-melody.ly"
\include "guitar-melody.ly"
\include "cello-melody.ly"
\include "harp-melody.ly"

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
  \repeat unfold 1 { \fluteRepeatMelody }
  \fluteOutroMelody
  R1*32
  \bar "|."
}
recorderPart = \relative c' {
  \partial 4 r4
  R1*7
  \recorderLeadIn
  \repeat unfold 1 { \recorderRepeatMelody }
  \recorderOutroMelody
  R1*24
  \bar "|."
}
percussionPart = \drummode {
  \partial 4 r4
  R1*48
  \bar "|."
}
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
harpUpper = \relative c' {
  \harpUpperEmptyPickup
  R1*7
  \harpUpperLeadIn
  \harpUpperOutroMelody
  \bar "|."
}
harpLower = \relative c' {
  \partial 4 r4
  R1*48
  \bar "|."
}
guitarShared = {
  \partial 4 r4
  R1 * 8
  \guitarOutroChords
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
  R1*48
  \bar "|."
}
celloPart = \relative c' {
  \clef bass
  \partial 4 r4
  R1 * 8
  \celloOutroMelody
  \bar "|."
}


% --- SCORE OUTPUT ---
\score {
  <<
    % --- WOODWINDS ---
    \new Staff \with {
      midiInstrument = #"flute"
      instrumentName = #"Flute"
      shortInstrumentName = #"Fl."
    } {
      \context Voice = "flute" { << \global \flutePart >> }
    }
    \new Staff \with {
      midiInstrument = #"recorder"
      instrumentName = #"Recorder"
      shortInstrumentName = #"Rec."
    } {
      \context Voice = "recorder" { << \global \recorderPart >> }
    }

    % --- PERCUSSION ---
    \new DrumStaff \with {
      midiInstrument = #"melodic tom" % or "synth drum"
      instrumentName = #"Percussion"
      shortInstrumentName = #"Perc."
    } {
      \context DrumVoice = "percussion" { << \global \percussionPart >> }
    }

    % --- KEYBOARD / PLUCKED ---
    \new PianoStaff \with {
      midiInstrument = #"acoustic grand"
      instrumentName = #"Piano"
      shortInstrumentName = #"Pno."
    } <<
      \new Staff { \clef treble << \global \pianoUpper >> }
      \new Staff { \clef bass << \global \pianoLower >> }
    >>

    \new PianoStaff \with {
      % TODO: Add to sheet music that tin foil must be added.
      % Harp with tin foil sounds like a sitar.
      midiInstrument = #"sitar"
      instrumentName = #"Harp"
      shortInstrumentName = #"Hp."
    } <<
      \new Staff { \clef treble << \global \harpUpper >> }
      \new Staff { \clef bass << \global \harpLower >> }
    >>

    <<
      \new ChordNames {
        \guitarChordNames
      }
      \new Staff \with {
        midiInstrument = #"acoustic guitar (nylon)"
        instrumentName = #"Guitar"
        shortInstrumentName = #"Gt."
      } {
        \context Voice = "guitar" << \global \guitarPart >>
      }
    >>

    % --- STRINGS ---
    \new Staff \with {
      midiInstrument = #"violin"
      instrumentName = #"Violin"
      shortInstrumentName = #"Vln."
    } {
      \context Voice = "violin" { << \global \violinPart >> }
    }

    \new Staff \with {
      midiInstrument = #"cello"
      instrumentName = #"Cello"
      shortInstrumentName = #"Vc."
    } {
      \context Voice = "cello" << \global \celloPart >>
    }

  >>
  \layout {
    indent = 1.5 \cm
    short-indent = 0.5 \cm
  }
  \midi { }
}
