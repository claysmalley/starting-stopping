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
  \once \override TextScript.self-alignment-X = #CENTER
  \once \override TextScript.X-offset = #(lambda (g)
  (+ (ly:self-alignment-interface::centered-on-x-parent g)
     (ly:self-alignment-interface::x-aligned-on-self g)))
}

fingerT = \markup \abs-fontsize #6 \bold T
fingerO = \markup \abs-fontsize #6 \slashed-digit #0
fingerB = \markup \abs-fontsize #6 \finger 2
fingerA = \markup \abs-fontsize #6 \finger 1
fingerAB = \markup \abs-fontsize #6 \finger 12
fingerBC = \markup \abs-fontsize #6 \finger 23
fingerAC = \markup \abs-fontsize #6 \finger 13
fingerABC = \markup \abs-fontsize #6 \finger 123
fingerTO = \markup
\override #`(direction . ,UP)
\override #'(baseline-skip . 1.4)
\dir-column {
  \general-align #X #CENTER \fingerO
  \general-align #X #CENTER \fingerT
}
fingerTB = \markup
\override #`(direction . ,UP)
\override #'(baseline-skip . 1.4)
\dir-column {
  \general-align #X #CENTER \fingerB
  \general-align #X #CENTER \fingerT
}
fingerTA = \markup
\override #`(direction . ,UP)
\override #'(baseline-skip . 1.4)
\dir-column {
  \general-align #X #CENTER \fingerA
  \general-align #X #CENTER \fingerT
}
fingerTAB = \markup
\override #`(direction . ,UP)
\override #'(baseline-skip . 1.4)
\dir-column {
  \general-align #X #CENTER \fingerAB
  \general-align #X #CENTER \fingerT
}
fingerTBC = \markup
\override #`(direction . ,UP)
\override #'(baseline-skip . 1.4)
\dir-column {
  \general-align #X #CENTER \fingerBC
  \general-align #X #CENTER \fingerT
}
fingerTAC = \markup
\override #`(direction . ,UP)
\override #'(baseline-skip . 1.4)
\dir-column {
  \general-align #X #CENTER \fingerAC
  \general-align #X #CENTER \fingerT
}
fingerTABC = \markup
\override #`(direction . ,UP)
\override #'(baseline-skip . 1.4)
\dir-column {
  \general-align #X #CENTER \fingerABC
  \general-align #X #CENTER \fingerT
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
    \centermarkup e4(^\fullopen d c beseh g e c2)
    \bar "|"
    \textMark \markup \small \italic "echo (mostly stopped)"
    \centermarkup dis'4(^\mostlystopped cis b aeh fis dis b2)
    \bar "|"
    \textMark \markup \small \italic "fully stopped"
    \centermarkup f''4(^\fullstopped ees des ceseh aes f des2)
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
      \override HorizontalBracket.direction = #UP
      \override HorizontalBracket.Y-offset = #5
      \override HorizontalBracketText.text = \markup \italic "half step"
      alterationGlyphs =
        #'((1/2 . "accidentals.sharp")
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

    \tweak direction #DOWN
    \textMark \markup \small \italic \concat { 10 \super th " partial" }
    \once \override Glissando.bound-details.left.Y = #1.75
    \once \override Glissando.bound-details.right.Y = #1.25
    e2*2^\open\glissando
    ees4*4^\stopped\startGroup
    \bar "|"
    \tweak direction #DOWN
    \textMark \markup \small \italic \concat { 9 \super th " partial" }
    \once \override Glissando.bound-details.left.Y = #1.5
    \once \override Glissando.bound-details.right.Y = #0.5
    d2*2^\open\glissando\stopGroup
    des4*4^\stopped\startGroup
    \bar "|"
    \tweak direction #DOWN
    \textMark \markup \small \italic \concat { 8 \super th " partial" }
    \once \override Glissando.bound-details.left.Y = #0.75
    \once \override Glissando.bound-details.right.Y = #0.25
    c2*2^\open\glissando\stopGroup
    ceseh4*4^\stopped\startGroup
    \bar "|"
    \tweak direction #DOWN
    \textMark \markup \small \italic \concat { 7 \super th " partial" }
    beseh2*2^\open\glissando\stopGroup
    aes4*4^\stopped\startGroup
    \bar "|"
    \tweak direction #DOWN
    \textMark \markup \small \italic \concat { 6 \super th " partial" }
    g2*2^\open\glissando\stopGroup
    f4*4^\stopped\startGroup
    \bar "|"
    \tweak direction #DOWN
    \textMark \markup \small \italic \concat { 5 \super th " partial" }
    e2*2^\open\glissando\stopGroup
    des4*4^\stopped\startGroup
    \bar "|"
    \tweak direction #DOWN
    \textMark \markup \small \italic \concat { 4 \super th " partial" }
    c2*2^\open\glissando\stopGroup
    aes4*4^\stopped\startGroup
    \bar "|"
    \tweak direction #DOWN
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
    \tweak direction #DOWN
    \textMark \markup \small \italic "F horn: use any fingering one half step down"
    \centermarkup f4*2^\fingerO
    \centermarkup e^\fingerB
    \centermarkup ees^\fingerO
    \centermarkup d^\fingerB
    \centermarkup des^\fingerO
    \centermarkup c^\fingerB
    \centermarkup b^\fingerA
    \centermarkup bes^\fingerAB
    \centermarkup a^\fingerBC
    \centermarkup aes^\fingerO
    \centermarkup g^\fingerB
    \centermarkup fis^\fingerA
    \centermarkup f^\fingerO
    \centermarkup e^\fingerB
    \centermarkup ees^\fingerA
    \centermarkup d^\fingerAB
    \centermarkup des^\fingerO
    \centermarkup c^\fingerB
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
    \time 4/4
    \tempo 4 = 120 - 176
    \centermarkup f2\p^\fingerTO(
    \centermarkup e^\fingerTB |
    \centermarkup f\glissando\<^\fingerTO
    \centermarkup e^\fullstopped\glissando\ff\> |
    \centermarkup f^\fullopen)\! r |
    \bar "||"
    \centermarkup e^\fingerTB(
    \centermarkup dis^\fingerTA |
    \centermarkup e\glissando\<^\fingerTB
    \centermarkup dis^\fullstopped\glissando\> |
    \centermarkup e^\fullopen)\! r |
    \bar "||"
    \break
    \centermarkup ees^\fingerTA(
    \centermarkup d^\fingerTAB |
    \centermarkup ees\glissando\<^\fingerTA
    \centermarkup d^\fullstopped\glissando\> |
    \centermarkup ees^\fullopen)\! r |
    \bar "||"
    \centermarkup d^\fingerTAB(
    \centermarkup cis^\fingerTBC |
    \centermarkup d\glissando\<^\fingerTAB
    \centermarkup cis^\fullstopped\glissando\> |
    \centermarkup d^\fullopen)\! r |
    \bar "||"
    \centermarkup des^\fingerTBC(
    \centermarkup c^\fingerTO |
    \centermarkup des\glissando\<^\fingerTBC
    \centermarkup c^\fullstopped\glissando\> |
    \centermarkup des^\fullopen)\! r |
    \bar "||"
    \break
    \textMark \markup \small "The following fingerings may be uncommon on open horn, but correspond to conventional stopped fingerings."
    \centermarkup c^\fingerA(
    \centermarkup b^\fingerB |
    \centermarkup c\glissando\<^\fingerA
    \centermarkup b^\fullstopped\glissando\> |
    \centermarkup c^\fullopen)\! r |
    \bar "||"
    \centermarkup b^\fingerAB(
    \centermarkup ais^\fingerA |
    \centermarkup b\glissando\<^\fingerAB
    \centermarkup ais^\fullstopped\glissando\> |
    \centermarkup b^\fullopen)\! r |
    \bar "||"
    \centermarkup bes^\fingerBC(
    \centermarkup a^\fingerAB |
    \centermarkup bes\glissando\<^\fingerBC
    \centermarkup a^\fullstopped\glissando\> |
    \centermarkup bes^\fullopen)\! r |
    \bar "||"
    \break
    \textMark \markup \small \concat {
      "The out-of-tune 7"
      \super "th"
      " partial is used here to reach certain stopped tones."
    }
    \centermarkup beseh^\fingerO(
    \centermarkup aes^\fingerBC |
    \centermarkup beseh\glissando\<^\fingerO
    \centermarkup aes^\fullstopped\glissando\> |
    \centermarkup beseh^\fullopen)\! r |
    \bar "||"
    \centermarkup aeh^\fingerB^(
    \centermarkup g^\fingerO |
    \centermarkup aeh\glissando\<^\fingerB
    \centermarkup g^\fullstopped\glissando\> |
    \centermarkup aeh^\fullopen)\! r |
    \bar "||"
    \centermarkup aeseh^\fingerA^(
    \centermarkup ges^\fingerB |
    \centermarkup aeseh\glissando\<^\fingerA
    \centermarkup ges^\fullstopped\glissando\> |
    \centermarkup aeseh^\fullopen)\! r |
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
    \time 4/4
    \tempo 4 = 120 - 176
    \centermarkup g2\p^\fingerO(
    \centermarkup fis^\fingerB |
    \centermarkup f^\fingerA
    \centermarkup fis^\fingerB |
    \centermarkup g\glissando^\fingerO
    \once \override Glissando.bound-details.left.Y = #-1.25
    \once \override Glissando.bound-details.right.Y = #-1.75
    \centermarkup fis^\mostlystopped\glissando\< |
    \once \override Glissando.bound-details.left.Y = #-1.75
    \once \override Glissando.bound-details.right.Y = #-1.25
    \centermarkup f^\fullstopped\glissando\ff\>
    \centermarkup fis^\mostlystopped\glissando\! |
    \centermarkup g^\fullopen) r |
    \bar "||"
    \centermarkup ges^\fingerB(
    \centermarkup f^\fingerA |
    \centermarkup e^\fingerO
    \centermarkup f^\fingerA |
    \centermarkup ges\glissando^\fingerB
    \centermarkup f^\mostlystopped\glissando\< |
    \centermarkup e^\fullstopped\glissando\>
    \centermarkup f^\mostlystopped\glissando\! |
    \centermarkup ges^\fullopen) r |
    \bar "||"
    \centermarkup f^\fingerA(
    \centermarkup e^\fingerO |
    \centermarkup dis^\fingerB
    \centermarkup e^\fingerO |
    \centermarkup f\glissando^\fingerA
    \centermarkup e^\mostlystopped\glissando\< |
    \centermarkup dis^\fullstopped\glissando\>
    \centermarkup e^\mostlystopped\glissando\! |
    \centermarkup f^\fullopen) r |
    \bar "||"
    \centermarkup e^\fingerAB(
    \centermarkup dis^\fingerB |
    \centermarkup d^\fingerA
    \centermarkup dis^\fingerB |
    \centermarkup e\glissando^\fingerAB
    \once \override Glissando.bound-details.left.Y = #-2.25
    \once \override Glissando.bound-details.right.Y = #-2.75
    \centermarkup dis^\mostlystopped\glissando\< |
    \once \override Glissando.bound-details.left.Y = #-2.75
    \once \override Glissando.bound-details.right.Y = #-2.25
    \centermarkup d^\fullstopped\glissando\>
    \centermarkup dis^\mostlystopped\glissando\! |
    \centermarkup e^\fullopen) r |
    \bar "||"
    \centermarkup e^\fingerO(
    \centermarkup dis^\fingerB |
    \centermarkup cis^\fingerAB
    \centermarkup dis^\fingerB |
    \centermarkup e\glissando^\fingerO
    \centermarkup dis^\mostlystopped\glissando\< |
    \centermarkup cis^\fullstopped\glissando\>
    \centermarkup dis^\mostlystopped\glissando\! |
    \centermarkup e^\fullopen) r |
    \bar "||"
    \centermarkup ees^\fingerB(
    \centermarkup d^\fingerA |
    \centermarkup c^\fingerO
    \centermarkup d^\fingerA |
    \centermarkup ees\glissando^\fingerB
    \centermarkup d^\mostlystopped\glissando\< |
    \centermarkup c^\fullstopped\glissando\>
    \centermarkup d^\mostlystopped\glissando\! |
    \centermarkup ees^\fullopen) r |
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
