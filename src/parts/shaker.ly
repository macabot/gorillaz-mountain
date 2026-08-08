\version "2.24.3"

shakerRhythm = \drummode {
  \repeat unfold 8 {
    mar4 r4 mar4 r4
  }
}

shakerHalfRhythm = \drummode {
  \repeat unfold 4 {
    mar4 r4 mar4 r4
  }
}

shakerStaffSettings = \with {
  \override StaffSymbol.line-count = #1
  % Do not set the midiInstrument when using \drummode.
  midiBalance = #0.4
  instrumentName = #"Shaker"
  shortInstrumentName = #"Shk."
}
