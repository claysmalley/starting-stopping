\version "2.22.1"

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
  % \repeat unfold 4 {
  %   f8^\open[
  %   f8^\stopped]
  % } |
  f2^\open
  r2 |
}

\markup \wordwrap {
  One of the most noticeable differences between the horn and other brass instruments is the movement of the right hand in the bell.
  Historically, this was done on valveless, or \italic natural, horns,
  to reach pitches in between those along the harmonic series.
  Nowadays, on valve horns, the right hand is mostly used to make fine adjustments to intonation, 
  as well as playing stopped tones (
  \center-column {
    \musicglyph "noteheads.s1"
    \vspace #-1.5
    \musicglyph "scripts.stopped"
  }
  ) with a buzzy, muffled timbre.
  But good hand horn technique is still essential to modern valve horn playing.
}
\markup \line {
  \column {
    \null
    \score {
      <<
        \new Staff
        \relative c'' {
          \set Score.timing = ##f
          \omit Staff.TimeSignature
          <<
            {
              \override Stem.length = 0
              \set fingeringOrientations = #'(left)
              \override Fingering.whiteout = ##t
              <bes-7>2\glissando aes_\stopped
            }
            \\
            {
              \override Stem.length = 0
              \set fingeringOrientations = #'(left)
              \override Fingering.whiteout = ##t
              <g-6>4_\open
            }
          >>
        }
        \new Staff
        \relative c'' {
          \set Score.timing = ##f
          \omit Staff.TimeSignature
          <<
            {
              \override Stem.length = 0
              \set fingeringOrientations = #'(left)
              \override Fingering.whiteout = ##t
              <g-6>2\glissando f_\stopped
            }
            \\
            {
              \override Stem.length = 0
              \set fingeringOrientations = #'(left)
              \override Fingering.whiteout = ##t
              <e-5>4_\open
            }
          >>
        }
        \new Staff
        \relative c' {
          \set Score.timing = ##f
          \omit Staff.TimeSignature
          <<
            {
              \override Stem.length = 0
              \set fingeringOrientations = #'(left)
              \override Fingering.whiteout = ##t
              <e-5>2\glissando des_\stopped
            }
            \\
            {
              \override Stem.length = 0
              \set fingeringOrientations = #'(left)
              \override Fingering.whiteout = ##t
              <c-4>4_\open
            }
          >>
        }
        \new Staff
        \relative c' {
          \set Score.timing = ##f
          \omit Staff.TimeSignature
          <<
            {
              \override Stem.length = 0
              \set fingeringOrientations = #'(left)
              \override Fingering.whiteout = ##t
              <c-4>2\glissando aes_\stopped
            }
            \\
            {
              \override Stem.length = 0
              \set fingeringOrientations = #'(left)
              \override Fingering.whiteout = ##t
              <g-3>4_\open
            }
          >>
        }
      >>
    }
    \null
    \italic \small \override #'(line-width . 17) \override #'(baseline-skip . 2.5) \wordwrap {
      relationship between open and stopped tones,
      with partial numbers on the left
    }
  }
  "    "
  \column {
    \null
    \override #'(line-width . 90) \wordwrap {
      An everlasting source of confusion for new hornists
      is whether stopping the bell raises or lowers the pitch produced.
      By playing a long tone and gradually closing the bell,
      one may notice that the pitch bends down by a half step or more.
      But by playing a lip slur exercise on the F horn with an open bell,
      then repeating it stopped,
      one may notice that the harmonic series has shifted a half step \italic upward.
    }
    \null
    \override #'(line-width . 90) \wordwrap {
      So what is happening here?
      Each open tone on the F horn indeed has a corresponding stopped tone a half step up,
      but the stopped tone actually comes from bending down the next highest partial—a hidden barber pole effect.
      Closing the bell lowers the pitch, all the way down to
      \italic { one half step above the next lowest partial }
      (or, on the \concat { B \super \flat } horn, a noticeably out-of-tune ¾ step above it).
      In the first example on the left,
      an open \concat { B \super \flat } in the \concat { 7 \super th } partial
      can be bent down with the hand to a stopped \concat { A \super \flat , }
      one half step above the \concat { 6 \super th } partial’s open G.
    }
    \null
    \override #'(line-width . 90) \wordwrap {
      So, on the F horn, \bold { fingering one half step down while stopped } is a useful mnemonic,
      though certain fingerings can counteract the out-of-tune
      \concat { 7 \super th } and \concat { 11 \super th } partials
      and bring the stopped \concat { B \super \flat } horn back into tune.
      Since these partials are rarely used otherwise,
      mnemonics based on more recognizable fingerings for the
      \concat { 8 \super th } and \concat { 12 \super th } partials,
      respectively, are more common.
    }
  }
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
    \accidentalStyle Score.forget
    \set Score.timing = ##f
    \omit Staff.TimeSignature
    \override Stem.length = 0

    \clef treble
    s1024_\markup \small \italic \override #'(baseline-skip . 2.5) \column {
      \line { \concat { "B" \super \flat " horn, 11" \super th " partial:" } }
      \line { \concat { "use 12" \super th " partial fingerings" } }
      \line { "for the same pitch" }
    }
    \centermarkup c4^\fingerTO
    \centermarkup b4^\fingerTB
    \centermarkup bes4^\fingerTA
    \centermarkup a4^\fingerTAB
    \centermarkup aes4^\fingerTBC
    \centermarkup g4^\fingerTAC
    \centermarkup fis4^\fingerTABC
    s4
    \bar "|"
    s1024_\markup \small \italic \override #'(baseline-skip . 2.5) \column {
      \line { \concat { "B" \super \flat " horn, 7" \super th " partial:" } }
      \line { \concat { "use 8" \super th " partial fingerings" } }
      \line { "one half step up" }
    }
    \centermarkup e4^\fingerTO
    \centermarkup ees4^\fingerTB
    \centermarkup d4^\fingerTA
    \centermarkup des4^\fingerTAB
    \centermarkup c4^\fingerTBC
    s4
    \bar "||"
    \centermarkup f4^\fingerO
    \centermarkup e4^\fingerB
    s1024_\markup \small \italic \override #'(baseline-skip . 2.5) \column {
      \line { "F horn: use any fingering" }
      \line { "one half step down" }
    }
    \centermarkup ees4^\fingerO
    \centermarkup d4^\fingerB
    \centermarkup des4^\fingerO
    \centermarkup c4^\fingerB
    \centermarkup b4^\fingerA
    \centermarkup bes4^\fingerAB
    \centermarkup a4^\fingerBC
    \centermarkup aes4^\fingerO
    \centermarkup g4^\fingerB
    \centermarkup fis4^\fingerA
    \centermarkup f4^\fingerO
    \centermarkup e4^\fingerB
    \centermarkup ees4^\fingerA
    \centermarkup d4^\fingerAB
    \centermarkup des4^\fingerO
    \centermarkup c4^\fingerB
    s4_\markup \bold \lower #1 "…"
  }
}
\markup \null
\score {
  \header {
    piece = \markup \concat { \box { A } " Stopped Pitch Bends" }
    subpiece = "Gradually transition from open to stopped and back, bending the pitch as far as possible."
  }
  \layout {
    \context {
      \Score
      \omit BarNumber
    }
  }
  \new Staff
  \relative c'' {
    \time 4/4
    \tempo 4 = 120 - 176
    f2^\open\glissando\p\<(^\markup \italic \concat { "B" \super \flat " horn, half steps" }
    e2^\stopped\glissando\ff\> |
    f2^\open\p\!) r |
    \bar "||"
    e2^\open\glissando\<(
    dis2^\stopped\glissando\> |
    e2^\open\!) r |
    \bar "||"
    s4
    \stopStaff
    s2_\markup \bold "…"
    \startStaff
    s4
    \bar "||"
    c2^\open\glissando\<(^\markup \italic "F horn, half steps"
    b2^\stopped\glissando\> |
    c2^\open\!) r |
    \bar "||"
    s4
    \stopStaff
    s2_\markup \bold "…"
    \startStaff
    s4
    \bar "||"
    \break
    g2^\open\glissando\<(^\markup \italic "whole steps"
    f2^\stopped\glissando\> |
    g2^\open\!) r |
    \bar "||"
    s4
    \stopStaff
    s2_\markup \bold "…"
    \startStaff
    s4
    \bar "||"
    e2^\open\glissando\<(^\markup \italic "minor thirds"
    cis2^\stopped\glissando\> |
    e2^\open\!) r |
    \bar "||"
    s4
    \stopStaff
    s2_\markup \bold "…"
    \startStaff
    s4
    \bar "||"
    \bar "||"
    c!2^\open\glissando\<(^\markup \italic "major thirds"
    aes2^\stopped\glissando\> |
    c2^\open\!) r |
    \bar "|."
  }
}
\pageBreak
\score {
  \header {
    piece = \markup \concat { \box { B } " Stopped Staccato" }
    subpiece = "Match intonation and dynamics between open and stopped tones."
  }
  \layout {
    \context {
      \Score
      \omit BarNumber
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
