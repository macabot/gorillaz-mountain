\version "2.24.3"

% FOR LAYOUT
guitarMelody = {
  \improvisationOn

  % Pitch doesn't matter here. LilyPond renders 'b8' as slash heads.
  \repeat unfold 3 { b8 b8 b8 b8 b8 b8 b4 | }
  b8 b8 b4 b8 b8 b4 |
  b8 b8 b8 b8 b8 b8 b4 |
  \repeat unfold 2 { b8 b8 b4 b8 b8 b4 | }
  b8 b8 b4 b2 |

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
  \dDownAcc\sustainOn \dUp \dDown \dUp \dDown \dUp \dDownQ |

  \fsmDownAcc\sustainOff\sustainOn \fsmUp \fsmDown \fsmUp \fsmDown \fsmUp \fsmDownQ |

  \gDownAcc\sustainOff\sustainOn \gUp \gDown \gUp \gDown \gUp \gDownQ |

  \aDownAcc\sustainOff\sustainOn \aUp \aDownQ
  \dDownAcc\sustainOff\sustainOn \dUp \dDownQ |

  \dDownAcc\sustainOff\sustainOn \dUp \dDown \dUp \dDown \dUp \dDownQ |

  \dDownAcc\sustainOff\sustainOn \dUp \dDownQ
  \aDownAcc\sustainOff\sustainOn \aUp \aDownQ |

  \gDownAcc\sustainOff\sustainOn \gUp \gDownQ
  \emDownAcc\sustainOff\sustainOn \emUp \emDownQ |

  \gmDownAcc\sustainOff\sustainOn \gmUp \gmDownQ
  \dDownAccH\sustainOff |
}
