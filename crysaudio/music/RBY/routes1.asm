; Jingle Bells - Santa's Little Helper (original Game Boy variation)
; Based on the public-domain James Lord Pierpont melody.
; 32 measures, 512 duration units per pitched channel.
Music_Routes1::
	channel_count 4
	channel 1, Music_Routes1_Ch1
	channel 2, Music_Routes1_Ch2
	channel 3, Music_Routes1_Ch3
	channel 4, Music_Routes1_Ch4

Music_Routes1_Ch1:
	tempo 132
	volume 7, 7
	duty_cycle 2
	note_type 12, 11, 3
.loop:
	; Chorus
	; Measure 1 (C)
	octave 4
	note E_, 4
	note E_, 4
	note E_, 8
	; Measure 2 (C)
	octave 4
	note E_, 4
	note E_, 4
	note E_, 8
	; Measure 3 (C)
	octave 4
	note E_, 4
	note G_, 4
	note C_, 6
	note D_, 2
	; Measure 4 (C)
	octave 4
	note E_, 12
	note G_, 2
	note E_, 2
	; Measure 5 (F)
	octave 4
	note F_, 4
	note F_, 4
	note F_, 6
	note F_, 2
	; Measure 6 (C)
	octave 4
	note F_, 4
	note E_, 4
	note E_, 4
	note E_, 2
	note E_, 2
	; Measure 7 (G7)
	octave 4
	note E_, 4
	note D_, 4
	note D_, 4
	note E_, 4
	; Measure 8 (G7)
	octave 4
	note D_, 8
	note G_, 8
	; Measure 9 (C)
	octave 4
	note E_, 4
	note E_, 4
	note E_, 8
	; Measure 10 (C)
	octave 4
	note E_, 4
	note E_, 4
	note E_, 8
	; Measure 11 (C)
	octave 4
	note E_, 4
	note G_, 4
	note C_, 6
	note D_, 2
	; Measure 12 (C)
	octave 4
	note E_, 12
	note G_, 2
	note E_, 2
	; Measure 13 (F)
	octave 4
	note F_, 4
	note F_, 4
	note F_, 6
	note F_, 2
	; Measure 14 (C)
	octave 4
	note F_, 4
	note E_, 4
	note E_, 4
	note E_, 2
	note E_, 2
	; Measure 15 (G7)
	octave 4
	note G_, 4
	note G_, 4
	note F_, 4
	note D_, 4
	; Measure 16 (C)
	octave 4
	note C_, 12
	rest 4
	; Verse
	; Measure 17 (C)
	octave 4
	note G_, 4
	note E_, 4
	note D_, 4
	note C_, 4
	; Measure 18 (C)
	octave 4
	note G_, 12
	note G_, 4
	; Measure 19 (C)
	octave 4
	note G_, 4
	note E_, 4
	note D_, 4
	note C_, 4
	; Measure 20 (F)
	octave 4
	note A_, 12
	note A_, 4
	; Measure 21 (F)
	octave 4
	note A_, 4
	note F_, 4
	note E_, 4
	note D_, 4
	; Measure 22 (G7)
	octave 4
	note B_, 12
	note G_, 4
	; Measure 23 (G7)
	octave 4
	note G_, 4
	note F_, 4
	note D_, 4
	note E_, 4
	; Measure 24 (C)
	octave 4
	note C_, 12
	note G_, 4
	; Measure 25 (C)
	octave 4
	note G_, 4
	note E_, 4
	note D_, 4
	note C_, 4
	; Measure 26 (C)
	octave 4
	note G_, 12
	note G_, 4
	; Measure 27 (C)
	octave 4
	note G_, 4
	note E_, 4
	note D_, 4
	note C_, 4
	; Measure 28 (F)
	octave 4
	note A_, 12
	note A_, 4
	; Measure 29 (F)
	octave 4
	note A_, 4
	note F_, 4
	note E_, 4
	note D_, 4
	; Measure 30 (C)
	octave 4
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	; Measure 31 (G7)
	octave 4
	note A_, 4
	note G_, 4
	note F_, 4
	note D_, 4
	; Measure 32 (C)
	octave 4
	note C_, 12
	rest 4
	sound_loop 0, .loop

Music_Routes1_Ch2:
	duty_cycle 0
	note_type 12, 7, 2
.loop:
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .F
	sound_call .C
	sound_call .G7
	sound_call .G7
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .F
	sound_call .C
	sound_call .G7
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .F
	sound_call .F
	sound_call .G7
	sound_call .G7
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .F
	sound_call .F
	sound_call .C
	sound_call .G7
	sound_call .C
	sound_loop 0, .loop
.C
	rest 2
	octave 3
	note G_, 2
	octave 4
	note C_, 1
	octave 4
	note E_, 1
	rest 2
	octave 4
	note G_, 2
	octave 4
	note E_, 2
	rest 2
	octave 4
	note C_, 2
	sound_ret
.F
	rest 2
	octave 3
	note A_, 2
	octave 4
	note C_, 1
	octave 4
	note F_, 1
	rest 2
	octave 4
	note A_, 2
	octave 4
	note F_, 2
	rest 2
	octave 4
	note C_, 2
	sound_ret
.G7
	rest 2
	octave 3
	note G_, 2
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	rest 2
	octave 4
	note F_, 2
	octave 4
	note D_, 2
	rest 2
	octave 3
	note B_, 2
	sound_ret

Music_Routes1_Ch3:
	note_type 12, 3, 0
.loop:
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .F
	sound_call .C
	sound_call .G7
	sound_call .G7
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .F
	sound_call .C
	sound_call .G7
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .F
	sound_call .F
	sound_call .G7
	sound_call .G7
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .C
	sound_call .F
	sound_call .F
	sound_call .C
	sound_call .G7
	sound_call .C
	sound_loop 0, .loop
.C
	octave 3
	note C_, 3
	rest 5
	octave 3
	note G_, 3
	rest 5
	sound_ret
.F
	octave 3
	note F_, 3
	rest 5
	octave 4
	note C_, 3
	rest 5
	sound_ret
.G7
	octave 3
	note G_, 3
	rest 5
	octave 4
	note D_, 3
	rest 5
	sound_ret

Music_Routes1_Ch4:
	toggle_noise 0 ; stock drum kit: triangle and hi-hat
	drum_speed 12
.loop:
	drum_note 7, 2 ; brighter triangle accent
	rest 2
	drum_note 6, 2 ; softer triangle
	drum_note 6, 2
	drum_note 7, 2
	rest 2
	drum_note 6, 2
	drum_note 8, 2 ; short hi-hat shake
	sound_loop 0, .loop
