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

% 1. THE CORE 7-BAR THEME (Shared by both the loop and the ending)
sharedTheme = \relative c' {
  e'2. gis,8 b8 |
  dis2 dis8 cis8 b8 a8 |
  cis2 cis8 b8 a8 gis8 |
  b4 gis8 fis8 e4 e8 gis8 |
  b4 e,8 gis8 b4 e,8 gis8 |
  b4 a8 gis8 fis4 e8 fis8 |
  a4 e8 fis8 a4 e8 fis8 |
}

% 2. THE CHOSEN ENDINGS FOR THE 8TH BAR
coreMelody  = { \sharedTheme \relative c' { b4 gis8 fis8 e4 gis8 b8 } } % Loops perfectly
outroMelody = { \sharedTheme \relative c' { b4 gis8 fis8 e4 r4 \bar "|." } } % Ends neatly

% 3. TRANSPOSITIONS (Defined safely BEFORE the instrument parts use them)
%celloCore  = \transpose c c, { \coreMelody }
%celloOutro = \transpose c c, { \outroMelody }
celloCore = { \coreMelody }
celloOutro = { \outroMelody }


% 4. STITCH THE INSTRUMENTS TOGETHER
celloPart = {
  %\clef bass
  \clef treble
  \key e \major
  \time 4/4
  \tempo 4 = 90
  
  % Intro pickup notes just for the very first entrance
  \partial 4 gis8 b8 
  
  % Cello plays the core loop 4 times, then the outro loop 1 time (5 total)
  \repeat unfold 4 { \celloCore } 
  \celloOutro
}

guitarPart = {
  \clef treble
  \key e \major
  \time 4/4
  
  % Guitar waits while Cello plays 2 loops (16 full bars + the initial 1-beat pickup)
  \partial 4 r4
  R1 * 16 
  
  % Guitar enters and plays the core loop 3 times, then the outro loop 1 time (4 total)
  \repeat unfold 3 { \coreMelody }
  \outroMelody
}


% --- SCORE OUTPUT ---
\score {
  <<
    \new Staff \with { midiInstrument = #"cello" } {
      \context Voice = "cello" { \celloPart }
    }
    \new Staff \with { midiInstrument = #"acoustic guitar (nylon)" } {
      \context Voice = "guitar" { \guitarPart }
    }
  >>
  \layout { }
  \midi { } 
}
