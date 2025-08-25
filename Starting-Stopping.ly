\version "2.24.1"

#(set-default-paper-size "letter")

date = #(strftime "%Y–%m–%d" (localtime (current-time)))
\header {
  tagline = ##f
  copyright = \markup \concat {
    \italic "CC0, no rights reserved · last updated "
    \italic \date
    " · github.com/claysmalley/starting-stopping"
  }
  title = "Starting Stopping"
  composer = \markup \italic "Clay Smalley"
}
\paper {
  indent = 0
  scoreTitleMarkup = \markup {
    \override #`(direction . ,UP)
    \dir-column {
      \small \override #'(baseline-skip . 2.5)
      \fromproperty #'header:subpiece
      \bold \fontsize #1
      \fromproperty #'header:piece
    }
  }
}

centermarkup = {
  \once \override TextScript.staff-padding = #1.5
  \once \override TextScript.self-alignment-X = #CENTER
  \once \override TextScript.X-offset = #(lambda (g)
  (+ (ly:self-alignment-interface::centered-on-x-parent g)
     (ly:self-alignment-interface::x-aligned-on-self g)))
}
centermarkupStopped = {
  \once \override TextScript.staff-padding = #2
  \once \override TextScript.self-alignment-X = #CENTER
  \once \override TextScript.X-offset = #(lambda (g)
  (+ (ly:self-alignment-interface::centered-on-x-parent g)
     (ly:self-alignment-interface::x-aligned-on-self g)))
}

fingerT = \markup \abs-fontsize #8 \musicglyph "arrowheads.open.11"
fingerL = \markup \abs-fontsize #8 \musicglyph "arrowheads.open.1M1"
fingerO = \markup \abs-fontsize #6 \slashed-digit #0
fingerB = \markup \abs-fontsize #6 \finger 2
fingerA = \markup \abs-fontsize #6 \finger 1
fingerAB = \markup \abs-fontsize #6 \finger 12
fingerBC = \markup \abs-fontsize #6 \finger 23
fingerAC = \markup \abs-fontsize #6 \finger 13
fingerABC = \markup \abs-fontsize #6 \finger 123
fingerTO = \markup
\override #`(direction . ,UP)
\override #'(baseline-skip . 2.0)
\dir-column {
  \general-align #X #CENTER \fingerO
  \general-align #X #CENTER \fingerT
}
fingerTB = \markup
\override #`(direction . ,UP)
\override #'(baseline-skip . 2.0)
\dir-column {
  \general-align #X #CENTER \fingerB
  \general-align #X #CENTER \fingerT
}
fingerTA = \markup
\override #`(direction . ,UP)
\override #'(baseline-skip . 2.0)
\dir-column {
  \general-align #X #CENTER \fingerA
  \general-align #X #CENTER \fingerT
}
fingerTAB = \markup
\override #`(direction . ,UP)
\override #'(baseline-skip . 2.0)
\dir-column {
  \general-align #X #CENTER \fingerAB
  \general-align #X #CENTER \fingerT
}
fingerTBC = \markup
\override #`(direction . ,UP)
\override #'(baseline-skip . 2.0)
\dir-column {
  \general-align #X #CENTER \fingerBC
  \general-align #X #CENTER \fingerT
}
fingerTAC = \markup
\override #`(direction . ,UP)
\override #'(baseline-skip . 2.0)
\dir-column {
  \general-align #X #CENTER \fingerAC
  \general-align #X #CENTER \fingerT
}
fingerTABC = \markup
\override #`(direction . ,UP)
\override #'(baseline-skip . 2.0)
\dir-column {
  \general-align #X #CENTER \fingerABC
  \general-align #X #CENTER \fingerT
}
fingerLO = \markup
\override #'(baseline-skip . 0.9)
\column {
  \general-align #X #CENTER \fingerO
  \general-align #X #CENTER \fingerL
}
fingerLB = \markup
\override #'(baseline-skip . 0.9)
\column {
  \general-align #X #CENTER \fingerB
  \general-align #X #CENTER \fingerL
}
fingerLA = \markup
\override #'(baseline-skip . 0.9)
\column {
  \general-align #X #CENTER \fingerA
  \general-align #X #CENTER \fingerL
}
fingerLAB = \markup
\override #'(baseline-skip . 0.9)
\column {
  \general-align #X #CENTER \fingerAB
  \general-align #X #CENTER \fingerL
}
fingerLBC = \markup
\override #'(baseline-skip . 0.9)
\column {
  \general-align #X #CENTER \fingerBC
  \general-align #X #CENTER \fingerL
}
fingerLAC = \markup
\override #'(baseline-skip . 0.9)
\column {
  \general-align #X #CENTER \fingerAC
  \general-align #X #CENTER \fingerL
}
fingerLABC = \markup
\override #'(baseline-skip . 0.9)
\column {
  \general-align #X #CENTER \fingerABC
  \general-align #X #CENTER \fingerL
}

fullopen = \markup {
  \abs-fontsize #12 \musicglyph "scripts.open"
}
mostlystopped = \markup {
  \combine
  \abs-fontsize #12 \musicglyph "scripts.halfopenvertical"
  \abs-fontsize #12 \musicglyph "scripts.tenuto"
}
fullstopped = \markup {
  \abs-fontsize #12 \musicglyph "scripts.stopped"
}

staccatoExercise = \relative c'' {
  f2^\open
  2^\stopped |
  \repeat unfold 2 {
    4^\open
    4^\stopped
  } |
  \repeat unfold 2 {
    8^\open[
    8^\open]
    8^\stopped[
    8^\stopped]
  } |
  2^\open
  r |
}

\markup \wordwrap {
  One of the most noticeable differences between the horn and other brass instruments is the movement of the right hand in the bell.
  Historically, this was done on valveless, or \italic natural, horns,
  to reach pitches in between those along the harmonic series.
  Nowadays, on valve horns, the right hand is mostly used to make fine adjustments to intonation, 
  as well as playing stopped (
  \center-column {
    \musicglyph "noteheads.s1"
    \vspace #-1.5
    \musicglyph "scripts.stopped"
  }
  ) and echo (
  \center-column {
    \musicglyph "noteheads.s1"
    \vspace #-1.5
    \mostlystopped
  }
  ) tones.
}
\markup \null
\markup \wordwrap {
  An everlasting source of confusion for new hornists
  is whether stopping the bell raises or lowers the pitch produced.
  By playing a long tone and gradually closing the bell,
  one may notice that the pitch bends down,
  and one can find a “mostly stopped” position that reliably flattens the horn by a half step.
  But by sealing off as much of the bell as possible and playing with more pressure,
  one may notice that the harmonic series has shifted a half step \italic upward:
}
\markup \null
\score {
  \layout {
    \context {
      \Staff
      alterationGlyphs =
        #'((1/2 . "accidentals.sharp")
           (1/4 . "accidentals.sharp.arrowdown")
           (0 . "accidentals.natural")
           (-1/4 . "accidentals.natural.arrowdown")
           (-1/2 . "accidentals.flat")
           (-3/4 . "accidentals.flat.arrowdown"))
    }
  }
  \new Staff
  \relative c'' {
    \accidentalStyle Score.forget
    \set Score.timing = ##f
    \omit Staff.TimeSignature
    \textMark \markup \small \italic "open"
    \centermarkupStopped e4(^\fullopen d c beseh g e c2)
    \bar "|"
    \textMark \markup \small \italic "echo (mostly stopped)"
    \centermarkupStopped dis'4(^\mostlystopped cis b aeh fis dis b2)
    \bar "|"
    \textMark \markup \small \italic "fully stopped"
    \centermarkupStopped f''4(^\fullstopped ees des ceseh aes f des2)
    \bar "|"
  }
}
\markup \wordwrap {
  So what is happening here?
  Each open tone on the F horn indeed has a corresponding stopped tone a half step up,
  but the stopped tone actually comes from bending down the next highest partial—a hidden barber pole effect.
  Closing the bell lowers the pitch, all the way down to
  \italic { one half step above the next lowest partial }
  (or, on the \concat { B \super \flat } horn, a noticeably out-of-tune ¾ step above it).
  For example,
  the \concat { 5 \super th } and \concat { 6 \super th } partials produce an open E and G,
  respectively.
  One half step above the \concat { 5 \super th } partial’s E is F,
  which is the stopped tone that the \concat { 6 \super th } partial’s G can be bent down to:
}
\markup \null
\score {
  \layout {
    \context {
      \Staff
      \consists Horizontal_bracket_engraver
      \override HorizontalBracketText.text = \markup \italic "half step"
      alterationGlyphs =
        #'((1/2 . "accidentals.sharp")
           (1/4 . "accidentals.sharp.arrowdown")
           (0 . "accidentals.natural")
           (-1/4 . "accidentals.natural.arrowdown")
           (-1/2 . "accidentals.flat")
           (-3/4 . "accidentals.flat.arrowdown"))
    }
  }
  \new Staff
  \relative c'' {
    \set Score.timing = ##f
    \omit Staff.TimeSignature
    \override Stem.length = 0
    \set fingeringOrientations = #'(left)
    \override Fingering.whiteout = ##t
    \override Glissando.thickness = #2

    \textMark \markup \small \italic \concat { 11 \super th " partial" }
    \once \override Glissando.bound-details.left.Y = #2.25
    \once \override Glissando.bound-details.right.Y = #1.75
    fih2*2^\open\glissando
    f4*4^\stopped\startGroup
    \bar "|"
    \textMark \markup \small \italic \concat { 10 \super th " partial" }
    \once \override Glissando.bound-details.left.Y = #1.75
    \once \override Glissando.bound-details.right.Y = #1.25
    e2*2^\open\glissando\stopGroup
    ees4*4^\stopped\startGroup
    \bar "|"
    \textMark \markup \small \italic \concat { 9 \super th " partial" }
    \once \override Glissando.bound-details.left.Y = #1.5
    \once \override Glissando.bound-details.right.Y = #0.5
    d2*2^\open\glissando\stopGroup
    des4*4^\stopped\startGroup
    \bar "|"
    \textMark \markup \small \italic \concat { 8 \super th " partial" }
    \once \override Glissando.bound-details.left.Y = #0.75
    \once \override Glissando.bound-details.right.Y = #0.25
    c2*2^\open\glissando\stopGroup
    ceseh4*4^\stopped\startGroup
    \bar "|"
    \textMark \markup \small \italic \concat { 7 \super th " partial" }
    beseh2*2^\open\glissando\stopGroup
    aes4*4^\stopped\startGroup
    \bar "|"
    \textMark \markup \small \italic \concat { 6 \super th " partial" }
    g2*2^\open\glissando\stopGroup
    f4*4^\stopped\startGroup
    \bar "|"
    \textMark \markup \small \italic \concat { 5 \super th " partial" }
    e2*2^\open\glissando\stopGroup
    des4*4^\stopped\startGroup
    \bar "|"
    \textMark \markup \small \italic \concat { 4 \super th " partial" }
    c2*2^\open\glissando\stopGroup
    aes4*4^\stopped\startGroup
    \bar "|"
    \textMark \markup \small \italic \concat { 3 \super rd " partial" }
    g2*2^\open\stopGroup
    s4_\markup \bold \lower #1 "…"
  }
}
\markup \wordwrap {
  So, on the F horn, fingering a half step down while stopped is a useful mnemonic:
}
\markup \null
\score {
  \layout {
    \context {
      \Score
      \omit BarNumber
    }
  }
  \new Staff
  \relative c'' {
    \set Score.timing = ##f
    \omit Staff.TimeSignature
    \override Stem.length = 0

    \clef treble
    \centermarkup f4*2^\fingerLO
    \centermarkup e^\fingerLB
    \centermarkup ees^\fingerLO
    \centermarkup d^\fingerLB
    \centermarkup des^\fingerLO
    \centermarkup c^\fingerLB
    \centermarkup b^\fingerLA
    \centermarkup bes^\fingerLAB
    \centermarkup a^\fingerLBC
    \centermarkup aes^\fingerLO
    \centermarkup g^\fingerLB
    \centermarkup fis^\fingerLA
    \centermarkup f^\fingerLO
    \centermarkup e^\fingerLB
    \centermarkup ees^\fingerLA
    \centermarkup d^\fingerLAB
    \centermarkup des^\fingerLO
    \centermarkup c^\fingerLB
    s4_\markup \bold \lower #1 "…"
  }
}
\markup \wordwrap {
  Though a limited set of fingerings can counteract the out-of-tune
  \concat { 7 \super th } and \concat { 11 \super th } partials
  and bring the stopped \concat { B \super \flat } horn back into tune.
  Since these partials are rarely used otherwise,
  mnemonics based on more recognizable fingerings for the
  \concat { 8 \super th } and \concat { 12 \super th } partials,
  respectively, are more common:
}
\markup \null
\score {
  \layout {
    \context {
      \Score
      \omit BarNumber
    }
  }
  \new Staff
  \relative c''' {
    \set Score.timing = ##f
    \omit Staff.TimeSignature
    \override Stem.length = 0

    \clef treble
    \tweak direction #DOWN
    \textMark \markup \small \italic \override #'(baseline-skip . 2.5) \column {
      \line { \concat { "B" \super \flat " horn, 11" \super th " partial:" } }
      \line { \concat { "use 12" \super th " partial fingerings" } }
      \line { "for the same pitch" }
    }
    \centermarkup c4*2^\fingerTO
    \centermarkup b^\fingerTB
    \centermarkup bes^\fingerTA
    \centermarkup a^\fingerTAB
    \centermarkup aes^\fingerTBC
    \centermarkup g^\fingerTAC
    \centermarkup fis^\fingerTABC
    \bar "|"
    \tweak direction #DOWN
    \textMark \markup \small \italic \override #'(baseline-skip . 2.5) \column {
      \line { \concat { "B" \super \flat " horn, 7" \super th " partial:" } }
      \line { \concat { "use 8" \super th " partial fingerings" } }
      \line { "one half step up" }
    }
    \centermarkup e^\fingerTO
    \centermarkup ees^\fingerTB
    \centermarkup d^\fingerTA
    \centermarkup des^\fingerTAB
    \centermarkup c^\fingerTBC
    \bar "|"
  }
}
\markup \null
\pageBreak
\score {
  \layout {
    \context {
      \Staff
      alterationGlyphs =
        #'((1/2 . "accidentals.sharp")
           (1/4 . "accidentals.sharp.arrowdown")
           (0 . "accidentals.natural")
           (-1/4 . "accidentals.natural.arrowdown")
           (-1/2 . "accidentals.flat")
           (-3/4 . "accidentals.flat.arrowdown"))
    }
  }
  \header {
    piece = \markup \concat { \box { A } " Short Pitch Bends" }
    subpiece = \markup \wordwrap {
      Begin by playing the pattern on valve horn,
      using the suggested fingerings
      with the bell open (
      \fontsize #1 \center-column {
        \musicglyph "noteheads.s1"
        \vspace #-1.4
        \musicglyph "scripts.open"
      }
      ).
      Upon returning to the upper pitch,
      gradually transition from open to stopped (
      \fontsize #1 \center-column {
        \musicglyph "noteheads.s1"
        \vspace #-1.4
        \musicglyph "scripts.stopped"
      }
      ) and back,
      applying more pressure when stopped.
      Match intonation between open and stopped tones.
    }
  }
  \new Staff
  \relative c'' {
    \accidentalStyle Score.modern
    \override TextScript.avoid-slur = #'inside
    \override TextScript.outside-staff-priority = ##f
    \override Glissando.thickness = #2

    \time 4/4
    \tempo 4 = 120 - 176
    \centermarkup f2\p^\fingerTO(
    \centermarkup e^\fingerTB |
    \centermarkup f\glissando\<^\fingerTO
    \centermarkupStopped e^\fullstopped\glissando\ff\> |
    \centermarkupStopped f^\fullopen)\! r |
    \bar "||"
    \centermarkup e^\fingerTB(
    \centermarkup dis^\fingerTA |
    \centermarkup e\glissando\<^\fingerTB
    \centermarkupStopped dis^\fullstopped\glissando\> |
    \centermarkupStopped e^\fullopen)\! r |
    \bar "||"
    \break
    \centermarkup ees^\fingerTA(
    \centermarkup d^\fingerTAB |
    \centermarkup ees\glissando\<^\fingerTA
    \centermarkupStopped d^\fullstopped\glissando\> |
    \centermarkupStopped ees^\fullopen)\! r |
    \bar "||"
    \centermarkup d^\fingerTAB(
    \centermarkup cis^\fingerTBC |
    \centermarkup d\glissando\<^\fingerTAB
    \centermarkupStopped cis^\fullstopped\glissando\> |
    \centermarkupStopped d^\fullopen)\! r |
    \bar "||"
    \centermarkup des^\fingerTBC(
    \centermarkup c^\fingerTO |
    \centermarkup des\glissando\<^\fingerTBC
    \centermarkupStopped c^\fullstopped\glissando\> |
    \centermarkupStopped des^\fullopen)\! r |
    \bar "||"
    \break
    \textMark \markup \small "The following fingerings may be uncommon on open horn, but correspond to conventional stopped fingerings."
    \centermarkup c^\fingerLA(
    \centermarkup b^\fingerLB |
    \centermarkup c\glissando\<^\fingerLA
    \centermarkupStopped b^\fullstopped\glissando\> |
    \centermarkupStopped c^\fullopen)\! r |
    \bar "||"
    \centermarkup b^\fingerLAB(
    \centermarkup ais^\fingerLA |
    \centermarkup b\glissando\<^\fingerLAB
    \centermarkupStopped ais^\fullstopped\glissando\> |
    \centermarkupStopped b^\fullopen)\! r |
    \bar "||"
    \centermarkup bes^\fingerLBC(
    \centermarkup a^\fingerLAB |
    \centermarkup bes\glissando\<^\fingerLBC
    \centermarkupStopped a^\fullstopped\glissando\> |
    \centermarkupStopped bes^\fullopen)\! r |
    \bar "||"
    \break
    \textMark \markup \small \concat {
      "The out-of-tune 7"
      \super "th"
      " partial is used here to reach certain stopped tones."
    }
    \centermarkup beseh^\fingerLO(
    \centermarkup aes^\fingerLBC |
    \centermarkup beseh\glissando\<^\fingerLO
    \centermarkupStopped aes^\fullstopped\glissando\> |
    \centermarkupStopped beseh^\fullopen)\! r |
    \bar "||"
    \centermarkup aeh^\fingerLB^(
    \centermarkup g^\fingerLO |
    \centermarkup aeh\glissando\<^\fingerLB
    \centermarkupStopped g^\fullstopped\glissando\> |
    \centermarkupStopped aeh^\fullopen)\! r |
    \bar "||"
    \centermarkup aeseh^\fingerLA^(
    \centermarkup ges^\fingerLB |
    \centermarkup aeseh\glissando\<^\fingerLA
    \centermarkupStopped ges^\fullstopped\glissando\> |
    \centermarkupStopped aeseh^\fullopen)\! r |
    \bar "|."
  }
}
\score {
  \header {
    piece = \markup \concat { \box { B } " Long Pitch Bends" }
    subpiece = \markup \wordwrap {
      As above, transitioning from open to echo (
      \fontsize #1 \center-column {
        \musicglyph "noteheads.s1"
        \vspace #-1.4
        \mostlystopped
      }
      ) to stopped and back.
      Match intonation between all tones.
    }
  }
  \new Staff
  \relative c'' {
    \accidentalStyle Score.modern
    \override Glissando.thickness = #2

    \time 4/4
    \tempo 4 = 120 - 176
    \centermarkup g2\p^\fingerLO(
    \centermarkup fis^\fingerLB |
    \centermarkup f^\fingerLA
    \centermarkup fis^\fingerLB |
    \centermarkup g\glissando^\fingerLO
    \once \override Glissando.bound-details.left.Y = #-1.25
    \once \override Glissando.bound-details.right.Y = #-1.75
    \centermarkupStopped fis^\mostlystopped\glissando\< |
    \once \override Glissando.bound-details.left.Y = #-1.75
    \once \override Glissando.bound-details.right.Y = #-1.25
    \centermarkupStopped f^\fullstopped\glissando\ff\>
    \centermarkupStopped fis^\mostlystopped\glissando\! |
    \centermarkupStopped g^\fullopen) r |
    \bar "||"
    \centermarkup ges^\fingerLB(
    \centermarkup f^\fingerLA |
    \centermarkup e^\fingerLO
    \centermarkup f^\fingerLA |
    \centermarkup ges\glissando^\fingerLB
    \centermarkupStopped f^\mostlystopped\glissando\< |
    \centermarkupStopped e^\fullstopped\glissando\>
    \centermarkupStopped f^\mostlystopped\glissando\! |
    \centermarkupStopped ges^\fullopen) r |
    \bar "||"
    \centermarkup f^\fingerLA(
    \centermarkup e^\fingerLO |
    \centermarkup dis^\fingerLB
    \centermarkup e^\fingerLO |
    \centermarkup f\glissando^\fingerLA
    \centermarkupStopped e^\mostlystopped\glissando\< |
    \centermarkupStopped dis^\fullstopped\glissando\>
    \centermarkupStopped e^\mostlystopped\glissando\! |
    \centermarkupStopped f^\fullopen) r |
    \bar "||"
    \centermarkup e^\fingerLAB(
    \centermarkup dis^\fingerLB |
    \centermarkup d^\fingerLA
    \centermarkup dis^\fingerLB |
    \centermarkup e\glissando^\fingerLAB
    \once \override Glissando.bound-details.left.Y = #-2.25
    \once \override Glissando.bound-details.right.Y = #-2.75
    \centermarkupStopped dis^\mostlystopped\glissando\< |
    \once \override Glissando.bound-details.left.Y = #-2.75
    \once \override Glissando.bound-details.right.Y = #-2.25
    \centermarkupStopped d^\fullstopped\glissando\>
    \centermarkupStopped dis^\mostlystopped\glissando\! |
    \centermarkupStopped e^\fullopen) r |
    \bar "||"
    \centermarkup e^\fingerLO(
    \centermarkup dis^\fingerLB |
    \centermarkup cis^\fingerLAB
    \centermarkup dis^\fingerLB |
    \centermarkup e\glissando^\fingerLO
    \centermarkupStopped dis^\mostlystopped\glissando\< |
    \centermarkupStopped cis^\fullstopped\glissando\>
    \centermarkupStopped dis^\mostlystopped\glissando\! |
    \centermarkupStopped e^\fullopen) r |
    \bar "||"
    \centermarkup ees^\fingerLB(
    \centermarkup d^\fingerLA |
    \centermarkup c^\fingerLO
    \centermarkup d^\fingerLA |
    \centermarkup ees\glissando^\fingerLB
    \centermarkupStopped d^\mostlystopped\glissando\< |
    \centermarkupStopped c^\fullstopped\glissando\>
    \centermarkupStopped d^\mostlystopped\glissando\! |
    \centermarkupStopped ees^\fullopen) r |
    \bar "|."
  }
}
\pageBreak
\score {
  \header {
    piece = \markup \concat { \box { C } " Open and Stopped Staccato" }
    subpiece = \markup \wordwrap {
      Match intonation between open (
      \fontsize #1 \center-column {
        \musicglyph "noteheads.s1"
        \vspace #-1.4
        \musicglyph "scripts.open"
      }
      ) and stopped (
      \fontsize #1 \center-column {
        \musicglyph "noteheads.s1"
        \vspace #-1.4
        \musicglyph "scripts.stopped"
      }
      ) tones.
    }
  }
  \new Staff
  \relative c'' {
    \accidentalStyle Score.modern

    \time 4/4
    \tempo 4 = 76 - 120
    <<
      s1\f
      \staccatoExercise
    >>
    \bar "||"
    \transpose f e \staccatoExercise
    \bar "||"
    \transpose f ees \staccatoExercise
    \bar "||"
    \transpose f d \staccatoExercise
    \bar "||"
    \transpose f des \staccatoExercise
    \bar "||"
    \transpose f c \staccatoExercise
    \bar "||"
    \transpose f b, \staccatoExercise
    \bar "||"
    \transpose f bes, \staccatoExercise
    \bar "||"
    \transpose f a, \staccatoExercise
    \bar "||"
    \transpose f aes, \staccatoExercise
    \bar "||"
    \transpose f g, \staccatoExercise
    \bar "||"
    \transpose f fis, \staccatoExercise
    \bar "||"
    \transpose f f, \staccatoExercise
    \bar "||"
    \transpose f e, \staccatoExercise
    \bar "||"
    \transpose f ees, \staccatoExercise
    \bar "||"
    \transpose f d, \staccatoExercise
    \bar "||"
    \transpose f des, \staccatoExercise
    \bar "||"
    \transpose f c, \staccatoExercise
    \bar "|."
  }
}
