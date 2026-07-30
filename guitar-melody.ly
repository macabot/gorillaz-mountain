\version "2.24.3"

% ==========================================
% 1. PRINT VOICINGS (Clean Sheet Music)
% ==========================================
guitarSharedChords = {
  \repeat unfold 8 { <d, a, d fis a d'>8 } |
  \repeat unfold 8 { <fis, cis fis a cis' fis'>8 } |
  \repeat unfold 8 { <g, b, d g b g'>8 } |
  \repeat unfold 4 { <a, e a cis' e'>8 } \repeat unfold 4 { <d, a, d fis a d'>8 } |
  \repeat unfold 8 { <d, a, d fis a d'>8 } |
  \repeat unfold 4 { <d, a, d fis a d'>8 } \repeat unfold 4 { <a, e a cis' e'>8 } |
  \repeat unfold 4 { <g, b, d g b g'>8 } \repeat unfold 4 { <e, b, e g b e'>8 } |
}

guitarOutroChords = {
  \guitarSharedChords
  \repeat unfold 4 { <g, d g bes d' g'>8 } \repeat unfold 2 { <d, a, d fis a d'>8 } r4 |
}


% ==========================================
% 2. ACCENTED DOWN / UP STRUMMING FOR MIDI
% ==========================================

% --- Accent (->) on chord entry vs regular strums ---
dDownReset   = { \grace { d,32 a, d fis } <a d'>8->\sustainOn } % Accent ->
dDown        = { \grace { d,32 a, d fis } <a d'>8 }
dUp          = { \grace { d'32 a fis } <d, a,>8 }

fsmDownReset = { \grace { fis,32 cis fis a } <cis' fis'>8->\sustainOff\sustainOn }
fsmDown      = { \grace { fis,32 cis fis a } <cis' fis'>8 }
fsmUp        = { \grace { fis'32 cis' a } <fis, cis fis>8 }

gDownReset   = { \grace { g,32 b, d g } <b g'>8->\sustainOff\sustainOn }
gDown        = { \grace { g,32 b, d g } <b g'>8 }
gUp          = { \grace { g'32 b g } <g, b, d>8 }

aDownReset   = { \grace { a,32 e a cis' } <e'>8->\sustainOff\sustainOn }
aDown        = { \grace { a,32 e a cis' } <e'>8 }
aUp          = { \grace { e'32 cis' a } <a, e a>8 }

emDownReset  = { \grace { e,32 b, e g } <b e'>8->\sustainOff\sustainOn }
emDown       = { \grace { e,32 b, e g } <b e'>8 }
emUp         = { \grace { e'32 b g } <e, b, e>8 }

gmDownReset  = { \grace { g,32 d g bes } <d' g'>8->\sustainOff\sustainOn }
gmDown       = { \grace { g,32 d g bes } <d' g'>8 }
gmUp         = { \grace { g'32 d' bes } <g, d g>8 }


% --- Modular 2-Beat Patterns ---
halfD   = { \dDown   \dUp \dDown \dUp }
halfFsm = { \fsmDown \fsmUp \fsmDown \fsmUp }
halfG   = { \gDown   \gUp \gDown \gUp }
halfA   = { \aDown   \aUp \aDown \aUp }
halfEm  = { \emDown  \emUp \emDown \emUp }
halfGm  = { \gmDown  \gmUp \gmDown \gmUp }

halfDReset   = { \dDownReset   \dUp \dDown \dUp }
halfFsmReset = { \fsmDownReset \fsmUp \fsmDown \fsmUp }
halfGReset   = { \gDownReset   \gUp \gDown \gUp }
halfAReset   = { \aDownReset   \aUp \aDown \aUp }
halfEmReset  = { \emDownReset  \emUp \emDown \emUp }
halfGmReset  = { \gmDownReset  \gmUp \gmDown \gmUp }


% --- Full MIDI Track ---
guitarMidiPattern = {
  \halfDReset \halfD |
  \halfFsmReset \halfFsm |
  \halfGReset \halfG |
  \halfAReset \halfDReset |
  \halfDReset \halfD |
  \halfD \halfAReset |
  \halfGReset \halfEmReset |
  \halfGmReset \dDown \dUp r4\sustainOff |
}