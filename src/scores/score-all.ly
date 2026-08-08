\version "2.24.3"
\include "../global.ly"
\include "../parts/flute.ly"
\include "../parts/recorder.ly"
\include "../parts/drum.ly"
\include "../parts/shaker.ly"
\include "../parts/harp.ly"
\include "../parts/piano.ly"
\include "../parts/guitar.ly"
\include "../parts/voice.ly"
\include "../parts/violin.ly"
\include "../parts/cello.ly"

\paper {
  #(set-paper-size "a4")
}

\header {
  title = "The Mountain"
  composer = "Gorillaz ft. Dennis Hopper, Ajay Prasanna, Anoushka Shankar, Amaan & Ayaan Ali Bangash"
  arranger = "Arrangement: Michael Cabot"
  tagline = "Arrangement voor de MidwoudMuziekMiddag"
}

% --- PARTS ---

flutePart = \relative c' {
  \flutePickup
  \fluteRepeatMelody
  \fluteOutroMelody
  R1*15
  \fluteLeadIn
  \repeat unfold 2 { \fluteRepeatMelody }
  \fluteOutroMelody
  \bar "|."
}

recorderPart = \relative c' {
  \partial 4 r4
  R1*8
  \repeat unfold 3 { \recorderMelody }
  R1*8
  \recorderFirstHalfMelody R1*4
  \recorderMelody
  \bar "|."
}

drumPart = {
  \partial 4 r4
  \repeat unfold 4 { \drumRhythm }
  R1 * 16
  \drumRhythm
  \bar "|."
}

shakerPart = {
  \partial 4 r4
  R1 * 16
  \repeat unfold 3 { \shakerRhythm }
  \shakerHalfRhythm R1*4
  \shakerRhythm
  \bar "|."
}

harpPart = \relative c' {
  \harpInstructionPickup
  R1*11
  \harpSecondHalfLeadIn
  \harpSecondHalfRepeatMelody
  \harpRepeatMelody
  \harpOutroMelody
  R1*15
  \harpLeadIn
  \harpOutroMelody
  \bar "|."
}

pianoPart = \relative c' {
  \partial 4 r4
  R1 * 24
  \ottava #1
  \repeat unfold 2 { \pianoMelody }
  \ottava #0
  R1 * 8
  \ottava #1
  \pianoMelody
  \ottava #0
}

guitarLayoutChords = {
  \partial 4 r4
  R1 * 8
  \repeat unfold 3 { \guitarChords }
  R1 * 16
  \guitarChords
}
guitarLayoutPart = {
  \clef "treble_8"
  \partial 4 r4
  R1 * 8
  \repeat unfold 3 { \guitarMelody }
  R1 * 16
  \guitarMelody
  \bar "|."
}
guitarMidiPart = {
  \partial 4 r4
  R1 * 8
  \repeat unfold 3 { \guitarMidiPattern }
  R1 * 16
  \guitarMidiPattern
}

voicePart = {
  \clef "treble_8"
  \partial 4 r4
  R1 * 32
  \repeat unfold 3 { \voiceMelody }
}
lyricsPart = {
  \repeat unfold 3 { \voiceLyrics }
}

violinPart = \relative c' {
  \partial 4 r4
  R1 * 16
  \repeat unfold 2 { \violinMelody }
  R1*8
  \violinFirstHalfMelody R1*4
  \violinMelody
  \bar "|."
}

celloPart = \relative c' {
  \clef bass
  \partial 4 r4
  \repeat unfold 4 { \celloMelody }
  R1*8
  \celloFirstHalfMelody R1*4
  \celloMelody
  \bar "|."
}

% --- STAFFS ---
fluteStaff = \new Staff \with {
  \fluteStaffSettings
} {
  \context Voice = "flute" { << \global \flutePart >> }
}

recorderStaff = \new Staff \with {
  \recorderStaffSettings
} {
  \context Voice = "recorder" { << \global \recorderPart >> }
}

drumStaff = \new DrumStaff \with {
  \drumStaffSettings
} {
  \context DrumVoice = "percussion" { << \global \drumPart >> }
}

shakerStaff = \new DrumStaff \with {
  \shakerStaffSettings
} {
  \context DrumVoice = "shaker" { << \global \shakerPart >> }
}

harpStaff = \new Staff \with {
  \harpStaffSettings
} {
  \context Voice = "harp" { \clef treble << \global \harpPart >> }
}

pianoStaff = \new Staff \with {
  \pianoStaffSettings
} {
  \context Voice = "piano" { \clef treble << \global \pianoPart >> }
}

guitarLayoutStaff = \new Staff \with {
  \guitarLayoutStaffSettings
} {
  \context Voice = "guitar" { << \global \guitarLayoutPart >> }
}
guitarMidiStaff = \new Staff \with {
  \guitarMidiStaffSettings
} {
  \context Voice = "guitar" { << \global \guitarMidiPart >> }
}

voiceStaff = \new Staff \with {
  \voiceStaffSettings
} {
  \new Voice = "vocalTrack" { \global \voicePart }
}

violinStaff = \new Staff \with {
  \violinStaffSettings
} {
  \context Voice = "violin" { << \global \violinPart >> }
}

celloStaff = \new Staff \with {
  \celloStaffSettings
} {
  \context Voice = "cello" << \global \celloPart >>
}

% --- SCORE OUTPUT ---
% LAYOUT SCORE
\score {
  <<
    \fluteStaff
    \recorderStaff

    \drumStaff
    \shakerStaff

    \harpStaff
    \pianoStaff

    \new ChordNames \with {
      noChordSymbol = ##f
    } {
      \guitarLayoutChords
    }
    \guitarLayoutStaff

    \voiceStaff
    \new Lyrics \lyricsto "vocalTrack" { \lyricsPart }

    \violinStaff
    \celloStaff
  >>
  \layout {
    indent = 1.5 \cm
    short-indent = 0.5 \cm
  }
}

% MIDI SCORE
\score {
  <<
    \fluteStaff
    \recorderStaff

    \drumStaff
    \shakerStaff

    \harpStaff
    \pianoStaff

    \guitarMidiStaff

    \voiceStaff

    \violinStaff
    \celloStaff
  >>
  \midi { }
}
