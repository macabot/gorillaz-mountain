\version "2.24.3"

drumRhythm = \drummode {
  \repeat unfold 8 {
    cgl8-> cgh cgh cgh cgl8-> cgh cgh cgh
  }
}

drumStaffSettings = \with {
  \override StaffSymbol.line-count = #1
  % Do not set the midiInstrument when using \drummode.
  midiBalance = #-0.3
  instrumentName = #"Trommel"
  shortInstrumentName = #"Tr."
}
