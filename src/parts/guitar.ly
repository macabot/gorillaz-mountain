\version "2.24.3"

% FOR LAYOUT
guitarMelody = {
  \improvisationOn

  % Pitch doesn't matter here. LilyPond renders 'b8' as slash heads.
  \repeat unfold 7 { b8 b8 b8 b8 b8 b8 b8 b8 | }
  b8 b8 b8 b8 b2 |

  \improvisationOff
}

guitarChords = \chordmode {
  d1 fis:m g a2 d d1 d2 a g e:m g:m d
}

% FOR MIDI
% --- D Major ---
dDownAcc  = { \grace { d,32 a, d fis } <d, a, d fis a d'>8-> }
dDownAccH = { \grace { d,32 a, d fis } <d, a, d fis a d'>2-> }
dDown     = { \grace { d,32 a, d fis } <d, a, d fis a d'>8 }
dDownQ    = { \grace { d,32 a, d fis } <d, a, d fis a d'>4 }
dUp       = { \grace { d'32 a fis } <d, a,>8 }

% --- F# minor ---
fsmDownAcc = { \grace { fis,32 cis fis a } <fis, cis fis a cis' fis'>8-> }
fsmDown    = { \grace { fis,32 cis fis a } <fis, cis fis a cis' fis'>8 }
fsmDownQ   = { \grace { fis,32 cis fis a } <fis, cis fis a cis' fis'>4 }
fsmUp      = { \grace { fis'32 cis' a } <fis, cis fis>8 }

% --- G Major ---
gDownAcc = { \grace { g,32 b, d g } <g, b, d g b g'>8-> }
gDown    = { \grace { g,32 b, d g } <g, b, d g b g'>8 }
gDownQ   = { \grace { g,32 b, d g } <g, b, d g b g'>4 }
gUp      = { \grace { g'32 b g } <g, b, d>8 }

% --- A Major ---
aDownAcc = { \grace { a,32 e a cis' } <a, e a cis' e'>8-> }
aDown    = { \grace { a,32 e a cis' } <a, e a cis' e'>8 }
aDownQ    = { \grace { a,32 e a cis' } <a, e a cis' e'>4 }
aUp      = { \grace { e'32 cis' a } <a, e a>8 }

% --- E minor ---
emDownAcc = { \grace { e,32 b, e g } <e, b, e g b e'>8-> }
emDown    = { \grace { e,32 b, e g } <e, b, e g b e'>8 }
emDownQ   = { \grace { e,32 b, e g } <e, b, e g b e'>4 }
emUp      = { \grace { e'32 b g } <e, b, e>8 }

% --- G minor ---
gmDownAcc = { \grace { g,32 d g bes } <g, d g bes d' g'>8-> }
gmDown    = { \grace { g,32 d g bes } <g, d g bes d' g'>8 }
gmDownQ   = { \grace { g,32 d g bes } <g, d g bes d' g'>4 }
gmUp      = { \grace { g'32 d' bes } <g, d g>8 }


% --- Full MIDI Track ---
guitarMidiPattern = {
  \dDownAcc\sustainOn \dDown \dDown \dDown \dDown \dDown \dDown \dDown |

  \fsmDownAcc\sustainOff\sustainOn \fsmDown \fsmDown \fsmDown \fsmDown \fsmDown \fsmDown \fsmDown |

  \gDownAcc\sustainOff\sustainOn \gDown \gDown \gDown \gDown \gDown \gDown \gDown |

  \aDownAcc\sustainOff\sustainOn \aDown \aDown \aDown
  \dDownAcc\sustainOff\sustainOn \dDown \dDown \dDown |

  \dDownAcc\sustainOff\sustainOn \dDown \dDown \dDown \dDown \dDown \dDown \dDown |

  \dDownAcc\sustainOff\sustainOn \dDown \dDown \dDown
  \aDownAcc\sustainOff\sustainOn \aDown \aDown \aDown |

  \gDownAcc\sustainOff\sustainOn \gDown \gDown \gDown
  \emDownAcc\sustainOff\sustainOn \emDown \emDown \emDown |

  \gmDownAcc\sustainOff\sustainOn \gmDown \gmDown \gmDown
  \dDownAccH\sustainOff |
}

guitarLayoutStaffSettings = \with {
  instrumentName = #"Gitaar"
  shortInstrumentName = #"Git."
}

guitarMidiStaffSettings = \with {
  midiInstrument = #"acoustic guitar (nylon)"
  midiMinimumVolume = #0.2
  midiMaximumVolume = #0.5
}
