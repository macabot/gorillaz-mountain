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

\paper {
  #(set-paper-size "a4")
}

\header {
  title = "The Mountain"
  composer = "Gorillaz ft. Dennis Hopper, Ajay Prasanna, Anoushka Shankar, Amaan & Ayaan Ali Bangash"
  arranger = "Arranged by Michael Cabot"
  tagline = "Cover for the MidwoudMuziekMiddag"
}

global = {
  \key e \major
  \time 4/4
  \tempo 4 = 90
}

% THE CORE 7-BAR THEME (Shared by both the loop and the ending)
sharedTheme = \relative c' {
  e'2. gis,8 b8 |
  dis2 dis8 cis8 b8 a8 |
  cis2 cis8 b8 a8 gis8 |
  b4 gis8 fis8 e4 e8 gis8 |
  b4 e,8 gis8 b4 e,8 gis8 |
  b4 a8 gis8 fis4 e8 fis8 |
  a4 e8 fis8 a4 e8 fis8 |
}

% THE CHOSEN ENDINGS FOR THE 8TH BAR
coreMelody  = { \sharedTheme \relative c' { b'4 gis8 fis8 e4 gis8 b8 } }
outroMelody = { \sharedTheme \relative c' { b'4 gis8 fis8 e4 r4 } }

%{
flutePart = \relative c' {
  \partial 4 r4
  R1*48
  \bar "|."
}
%}
flutePart = \relative c' {
  \partial 4 gis'8 b8
  \repeat unfold 1 { \coreMelody }
  \outroMelody
  R1*32
  \bar "|."
}

recorderPart = \relative c' {
  \partial 4 r4
  R1*7
  r4 r4 r4 gis'8 b8
  \repeat unfold 1 { \coreMelody }
  \outroMelody
  R1*24
  \bar "|."
}


% --- 1. THE CORE GROOVES ---
tablaLoopPdf    = \drummode { cgh4 cgl8 cgh8~ 8 cgl8 cgh4 | cgl8 cgh8 cgh8 cgl8 cgh4 cgl4 }
tablaLoopMidi   = \relative c' { g4 c8 g~ 8 c g4 | c8 g g c g4 c4 }

accessoryMidiLoop = \drummode {
  <cab tri>4 cab4 <cab tri>4 cab4 |
  <cab tri>4 cab4 cab4 cab4 |
}

% --- 2. THE TIMELINES ---
% This handles your printed sheet music layout (Tabla only, high/low lines)
percussionPdf = {
  \set DrumStaff.drumStyleTable = #congas-style
  \partial 4 r4
  %R1 * 16
  \repeat unfold 3 { \tablaLoopPdf }
  \drummode { cgh4 r4 cgl4 r4 | R1 }
}

% This handles the audio for your hand drums
tablaMidiPart = {
  \partial 4 r4
  %R1 * 16
  \repeat unfold 3 { \tablaLoopMidi }
  \relative c' { g4 r4 c4 r4 | R1 }
}

% This handles the audio for your background textures
accessoryMidiPart = {
  \partial 4 r4
  %R1 * 16
  \repeat unfold 3 { \accessoryMidiLoop }
  \drummode { r4 r4 r4 r4 | R1 } % Silent during the outro
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
  \partial 4 r4
  R1*48
  \bar "|."
}
harpLower = \relative c' {
  \partial 4 r4
  R1*48
  \bar "|."
}
guitarPart = \relative c' {
  \clef treble

  \partial 4 r4
  R1 * 15
  r4 r4 r4 gis'8 b8
  \repeat unfold 3 { \coreMelody }
  \outroMelody
  \bar "|."
}
violinPart = \relative c' {
  \partial 4 r4
  R1*48
  \bar "|."
}
celloCore  = \transpose c c,, { \coreMelody }
celloOutro = \transpose c c,, { \outroMelody }
celloPart = \relative c' {
  \clef bass

  \partial 4 r4
  R1*48
  %\partial 4 gis,8 b8
  %\repeat unfold 4 { \celloCore }
  %\celloOutro
  %R1 * 8
  \bar "|."
}


% --- SCORE OUTPUT ---
fullOrchestra = <<
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

  %{ --- PERCUSSION ---
  \new DrumStaff \with {
    midiInstrument = #"melodic tom" % or "synth drum"
    instrumentName = #"Percussion"
    shortInstrumentName = #"Perc."
  } {
    \context DrumVoice = "percussion" { << \global \percussionPart >> }
  }
  %}
  % --- THE ULTIMATE PERCUSSION SWITCH ---
  % For the PDF: Render only the clean, high/low conga-style drum staff
  \tag #'pdf {
    \new DrumStaff \with { instrumentName = #"Percussion" shortInstrumentName = #"Perc." } {
      \context DrumVoice = "percussion" { \percussionPdf }
    }
  }

  % For the MIDI: Split the audio into two perfectly tailored background channels
  \tag #'midi {
    <<
      % Track A: The Pitched Toms for the Tabla
      \new Staff \with { midiInstrument = #"melodic tom" } {
        \context Voice = "tablaMidi" { << \global \tablaMidiPart >> }
      }
      % Track B: The native Channel 10 engine for crisp shakers and bells
      \new DrumStaff {
        \context DrumVoice = "accMidi" { << \global \accessoryMidiPart >> }
      }
    >>
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
    midiInstrument = #"orchestral harp"
    instrumentName = #"Harp"
    shortInstrumentName = #"Hp."
  } <<
    \new Staff { \clef treble << \global \harpUpper >> }
    \new Staff { \clef bass << \global \harpLower >> }
  >>

  \new Staff \with {
    midiInstrument = #"acoustic guitar (nylon)"
    instrumentName = #"Guitar"
    shortInstrumentName = #"Gt."
  } {
    \context Voice = "guitar" << \global \guitarPart >>
  }

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

% --- 1. VISUAL SHEET MUSIC GENERATOR (PDF ONLY) ---
\score {
  \keepWithTag #'pdf \fullOrchestra

  \layout {
    indent = 1.5 \cm
    short-indent = 0.5 \cm
  }
}

% --- 2. AUDIO PLAYBACK GENERATOR (MIDI ONLY) ---
\score {
  \keepWithTag #'midi \fullOrchestra

  \midi { }
}
