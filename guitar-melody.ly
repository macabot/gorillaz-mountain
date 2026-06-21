guitarPickup = \relative c' {
  \partial 4 r4
}

guitarLeadIn = \relative c' {
  r1
}

guitarSharedChords = \transpose c c, \chordmode {
  % Bar 1: E Major
  e8 e8 e8 e8 e8 e8 e8 e8 |

  % Bar 2: G# Minor
  gis8:m gis8:m gis8:m gis8:m gis8:m gis8:m gis8:m gis8:m |

  % Bar 3: A Major
  a8 a8 a8 a8 a8 a8 a8 a8 |

  % Bar 4: B Major to E Major (This transition fits the phrasing)
  b8 b8 b8 b8 e8 e8 e8 e8 |

  % Bar 5: PURE E MAJOR (Fixed! Eliminates the clashing B Major completely)
  e8 e8 e8 e8 e8 e8 e8 e8 |

  % Bar 6: E Major to B Major (This transition works great)
  e8 e8 e8 e8 b8 b8 b8 b8 |

  % Bar 7: A Major to F# Minor
  a8 a8 a8 a8 fis8:m fis8:m fis8:m fis8:m |
}

guitarRepeatChords = {
  \guitarSharedChords
  \transpose c c, \chordmode {
    % Bar 8: A Minor to E Major (Resolves the loop)
    a8:m a8:m a8:m a8:m e8 e8 e8 e8 |
  }
}

guitarOutroChords = {
  \guitarSharedChords
  \transpose c c, \chordmode {
    % Bar 8: A Minor to E Major
    a8:m a8:m a8:m a8:m e8 e8 r4 |
  }
}
