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

melody = \relative c' {
  \clef treble
  \key e \major
  \time 4/4
  \tempo 4 = 90

  r4 r4 r4 gis'8 b8
  e2. gis,8 b8
  dis2 dis8 cis8 b8 a8
  cis2 cis8 b8 a8 gis8
  b4 gis8 fis8 e4 e8 gis8
  b4 e,8 gis8 b4 e,8 gis8
  b4 a8 gis8 fis4 e8 fis8
  a4 e8 fis8 a4 e8 fis8
  b4 gis8 fis8 e4 r4
}

\score {
  <<
    \new Staff {
      \new Voice = "myNotes" {
        \set Staff.midiInstrument = #"cello"
        \melody
      }
    }
  >>
  \layout { }
  \midi { }
}
