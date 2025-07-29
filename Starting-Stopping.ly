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
  f2^\stopped |
  \repeat unfold 2 {
    f4^\open
    f4^\stopped
  } |
  \repeat unfold 2 {
    f8^\open[
    f8^\open]
    f8^\stopped[
    f8^\stopped]
  } |
  f2^\open
  r2 |
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
    s1024_\markup \small \italic "open"
    \centermarkup e4(^\fullopen d c beseh g e c2)
    \bar "|"
    s1024_\markup \small \italic "echo (mostly stopped)"
    \centermarkup dis'4(^\mostlystopped cis b aeh fis dis b2)
    \bar "|"
    s1024_\markup \small \italic "fully stopped"
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

    \once \override Glissando.bound-details.left.Y = #1.75
    \once \override Glissando.bound-details.right.Y = #1.25
    e2*2^\open\glissando_\markup
    \italic \small \concat { 10 \super th " partial" }
    ees4*4^\stopped\startGroup
    \bar "|"
    \once \override Glissando.bound-details.left.Y = #1.5
    \once \override Glissando.bound-details.right.Y = #0.5
    d2*2^\open\glissando\stopGroup_\markup
    \italic \small \concat { 9 \super th " partial" }
    des4*4^\stopped\startGroup
    \bar "|"
    \once \override Glissando.bound-details.left.Y = #0.75
    \once \override Glissando.bound-details.right.Y = #0.25
    c2*2^\open\glissando\stopGroup_\markup
    \italic \small \concat { 8 \super th " partial" }
    ceseh4*4^\stopped\startGroup
    \bar "|"
    beseh2*2^\open\glissando\stopGroup_\markup
    \italic \small \concat { 7 \super th " partial" }
    aes4*4^\stopped\startGroup
    \bar "|"
    g2*2^\open\glissando\stopGroup_\markup
    \italic \small \concat { 6 \super th " partial" }
    f4*4^\stopped\startGroup
    \bar "|"
    e2*2^\open\glissando\stopGroup_\markup
    \italic \small \concat { 5 \super th " partial" }
    des4*4^\stopped\startGroup
    \bar "|"
    c2*2^\open\glissando\stopGroup_\markup
    \italic \small \concat { 4 \super th " partial" }
    aes4*4^\stopped\startGroup
    \bar "|"
    g2*2^\open\stopGroup_\markup
    \italic \small \concat { 3 \super rd " partial" }
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
    s1024_\markup \small \italic "F horn: use any fingering one half step down"
    \centermarkup f4*2^\fingerO
    \centermarkup e4*2^\fingerB
    \centermarkup ees4*2^\fingerO
    \centermarkup d4*2^\fingerB
    \centermarkup des4*2^\fingerO
    \centermarkup c4*2^\fingerB
    \centermarkup b4*2^\fingerA
    \centermarkup bes4*2^\fingerAB
    \centermarkup a4*2^\fingerBC
    \centermarkup aes4*2^\fingerO
    \centermarkup g4*2^\fingerB
    \centermarkup fis4*2^\fingerA
    \centermarkup f4*2^\fingerO
    \centermarkup e4*2^\fingerB
    \centermarkup ees4*2^\fingerA
    \centermarkup d4*2^\fingerAB
    \centermarkup des4*2^\fingerO
    \centermarkup c4*2^\fingerB
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
    s1024_\markup \small \italic \override #'(baseline-skip . 2.5) \column {
      \line { \concat { "B" \super \flat " horn, 11" \super th " partial:" } }
      \line { \concat { "use 12" \super th " partial fingerings" } }
      \line { "for the same pitch" }
    }
    \centermarkup c4*2^\fingerTO
    \centermarkup b4*2^\fingerTB
    \centermarkup bes4*2^\fingerTA
    \centermarkup a4*2^\fingerTAB
    \centermarkup aes4*2^\fingerTBC
    \centermarkup g4*2^\fingerTAC
    \centermarkup fis4*2^\fingerTABC
    \bar "|"
    s1024_\markup \small \italic \override #'(baseline-skip . 2.5) \column {
      \line { \concat { "B" \super \flat " horn, 7" \super th " partial:" } }
      \line { \concat { "use 8" \super th " partial fingerings" } }
      \line { "one half step up" }
    }
    \centermarkup e4*2^\fingerTO
    \centermarkup ees4*2^\fingerTB
    \centermarkup d4*2^\fingerTA
    \centermarkup des4*2^\fingerTAB
    \centermarkup c4*2^\fingerTBC
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
      ),
      no matter how unconventional they may be.
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
    \centermarkup e2^\fingerTB |
    \centermarkup f2\glissando\<^\fingerTO
    \centermarkup e2^\fullstopped\glissando\ff\> |
    \centermarkup f2^\fullopen)\! r |
    \bar "||"
    \centermarkup e2^\fingerTB(
    \centermarkup dis2^\fingerTA |
    \centermarkup e2\glissando\<^\fingerTB
    \centermarkup dis2^\fullstopped\glissando\> |
    \centermarkup e2^\fullopen)\! r |
    \bar "||"
    \break
    \centermarkup ees2^\fingerTA(
    \centermarkup d2^\fingerTAB |
    \centermarkup ees2\glissando\<^\fingerTA
    \centermarkup d2^\fullstopped\glissando\> |
    \centermarkup ees2^\fullopen)\! r |
    \bar "||"
    \centermarkup d2^\fingerTAB(
    \centermarkup cis2^\fingerTBC |
    \centermarkup d2\glissando\<^\fingerTAB
    \centermarkup cis2^\fullstopped\glissando\> |
    \centermarkup d2^\fullopen)\! r |
    \bar "||"
    \centermarkup des2^\fingerTBC(
    \centermarkup c2^\fingerTO |
    \centermarkup des2\glissando\<^\fingerTBC
    \centermarkup c2^\fullstopped\glissando\> |
    \centermarkup des2^\fullopen)\! r |
    \bar "||"
    \centermarkup c2^\fingerA(
    \centermarkup b2^\fingerB |
    \centermarkup c2\glissando\<^\fingerA
    \centermarkup b2^\fullstopped\glissando\> |
    \centermarkup c2^\fullopen)\! r |
    \bar "||"
    \centermarkup b2^\fingerAB(
    \centermarkup ais2^\fingerA |
    \centermarkup b2\glissando\<^\fingerAB
    \centermarkup ais2^\fullstopped\glissando\> |
    \centermarkup b2^\fullopen)\! r |
    \bar "||"
    \centermarkup bes2^\fingerBC(
    \centermarkup a2^\fingerAB |
    \centermarkup bes2\glissando\<^\fingerBC
    \centermarkup a2^\fullstopped\glissando\> |
    \centermarkup bes2^\fullopen)\! r |
    \bar "||"
    \centermarkup beseh2^\fingerO(
    \centermarkup aes2^\fingerBC |
    \centermarkup beseh2\glissando\<^\fingerO
    \centermarkup aes2^\fullstopped\glissando\> |
    \centermarkup beseh2^\fullopen)\! r |
    \bar "||"
    \centermarkup aeh2^\fingerB^(
    \centermarkup g2^\fingerO |
    \centermarkup aeh2\glissando\<^\fingerB
    \centermarkup g2^\fullstopped\glissando\> |
    \centermarkup aeh2^\fullopen)\! r |
    \bar "||"
    \centermarkup aeseh2^\fingerA^(
    \centermarkup ges2^\fingerB |
    \centermarkup aeseh2\glissando\<^\fingerA
    \centermarkup ges2^\fullstopped\glissando\> |
    \centermarkup aeseh2^\fullopen)\! r |
    \bar "|."
  }
}
\score {
  \header {
    piece = \markup \concat { \box { B } " Long Pitch Bends" }
    subpiece = \markup \wordwrap {
      Begin by playing the pattern on valve horn,
      using the suggested fingerings with the bell open.
      Upon returning to the upper pitch,
      gradually transition from open
      to echo (
      \fontsize #1 \center-column {
        \musicglyph "noteheads.s1"
        \vspace #-1.4
        \mostlystopped
      }
      ) to stopped and back,
      applying more pressure when stopped.
      Match intonation between all tones.
    }
  }
  \new Staff
  \relative c'' {
    \accidentalStyle Score.modern
    \time 4/4
    \tempo 4 = 120 - 176
    \centermarkup g2\p^\fingerO(
    \centermarkup fis2^\fingerB |
    \centermarkup f2^\fingerA
    \centermarkup fis2^\fingerB |
    \centermarkup g2\glissando^\fingerO
    \once \override Glissando.bound-details.left.Y = #-1.25
    \once \override Glissando.bound-details.right.Y = #-1.75
    \centermarkup fis2^\mostlystopped\glissando\< |
    \once \override Glissando.bound-details.left.Y = #-1.75
    \once \override Glissando.bound-details.right.Y = #-1.25
    \centermarkup f2^\fullstopped\glissando\ff\>
    \centermarkup fis2^\mostlystopped\glissando\! |
    \centermarkup g2^\fullopen) r |
    \bar "||"
    \centermarkup ges2^\fingerB(
    \centermarkup f2^\fingerA |
    \centermarkup e2^\fingerO
    \centermarkup f2^\fingerA |
    \centermarkup ges2\glissando^\fingerB
    \centermarkup f2^\mostlystopped\glissando\< |
    \centermarkup e2^\fullstopped\glissando\>
    \centermarkup f2^\mostlystopped\glissando\! |
    \centermarkup ges2^\fullopen) r |
    \bar "||"
    \centermarkup f2^\fingerA(
    \centermarkup e2^\fingerO |
    \centermarkup dis2^\fingerB
    \centermarkup e2^\fingerO |
    \centermarkup f2\glissando^\fingerA
    \centermarkup e2^\mostlystopped\glissando\< |
    \centermarkup dis2^\fullstopped\glissando\>
    \centermarkup e2^\mostlystopped\glissando\! |
    \centermarkup f2^\fullopen) r |
    \bar "||"
    \centermarkup e2^\fingerAB(
    \centermarkup dis2^\fingerB |
    \centermarkup d2^\fingerA
    \centermarkup dis2^\fingerB |
    \centermarkup e2\glissando^\fingerAB
    \once \override Glissando.bound-details.left.Y = #-2.25
    \once \override Glissando.bound-details.right.Y = #-2.75
    \centermarkup dis2^\mostlystopped\glissando\< |
    \once \override Glissando.bound-details.left.Y = #-2.75
    \once \override Glissando.bound-details.right.Y = #-2.25
    \centermarkup d2^\fullstopped\glissando\>
    \centermarkup dis2^\mostlystopped\glissando\! |
    \centermarkup e2^\fullopen) r |
    \bar "||"
    \centermarkup e2^\fingerO(
    \centermarkup dis2^\fingerB |
    \centermarkup cis2^\fingerAB
    \centermarkup dis2^\fingerB |
    \centermarkup e2\glissando^\fingerO
    \centermarkup dis2^\mostlystopped\glissando\< |
    \centermarkup cis2^\fullstopped\glissando\>
    \centermarkup dis2^\mostlystopped\glissando\! |
    \centermarkup e2^\fullopen) r |
    \bar "||"
    \centermarkup ees2^\fingerB(
    \centermarkup d2^\fingerA |
    \centermarkup c2^\fingerO
    \centermarkup d2^\fingerA |
    \centermarkup ees2\glissando^\fingerB
    \centermarkup d2^\mostlystopped\glissando\< |
    \centermarkup c2^\fullstopped\glissando\>
    \centermarkup d2^\mostlystopped\glissando\! |
    \centermarkup ees2^\fullopen) r |
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
