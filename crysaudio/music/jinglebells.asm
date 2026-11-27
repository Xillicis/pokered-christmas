; Jingle Bells (James Lord Pierpont, 1857; public domain)
; Original three-channel arrangement for pokered-crysaudio.
; 4 duration units = quarter note, 16 = one measure.
; All three channels loop after 512 duration units.
Music_JingleBells::
	channel_count 3
	channel 1, Music_JingleBells_Ch1
	channel 2, Music_JingleBells_Ch2
	channel 3, Music_JingleBells_Ch3

Music_JingleBells_Ch1:
	tempo 116
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
	note E_, 16
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
	note E_, 16
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

Music_JingleBells_Ch2:
	duty_cycle 0
	note_type 12, 7, 2
.loop:
	; Chorus
	; Measure 1 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 2 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 3 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 4 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 5 (F)
	octave 3
	note F_, 2
	rest 2
	note A_, 2
	rest 2
	octave 4
	note C_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	; Measure 6 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 7 (G7)
	octave 3
	note G_, 2
	rest 2
	note B_, 2
	rest 2
	octave 4
	note F_, 2
	rest 2
	octave 3
	note B_, 2
	rest 2
	; Measure 8 (G7)
	octave 3
	note G_, 2
	rest 2
	note B_, 2
	rest 2
	octave 4
	note F_, 2
	rest 2
	octave 3
	note B_, 2
	rest 2
	; Measure 9 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 10 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 11 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 12 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 13 (F)
	octave 3
	note F_, 2
	rest 2
	note A_, 2
	rest 2
	octave 4
	note C_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	; Measure 14 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 15 (G7)
	octave 3
	note G_, 2
	rest 2
	note B_, 2
	rest 2
	octave 4
	note F_, 2
	rest 2
	octave 3
	note B_, 2
	rest 2
	; Measure 16 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Verse
	; Measure 17 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 18 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 19 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 20 (F)
	octave 3
	note F_, 2
	rest 2
	note A_, 2
	rest 2
	octave 4
	note C_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	; Measure 21 (F)
	octave 3
	note F_, 2
	rest 2
	note A_, 2
	rest 2
	octave 4
	note C_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	; Measure 22 (G7)
	octave 3
	note G_, 2
	rest 2
	note B_, 2
	rest 2
	octave 4
	note F_, 2
	rest 2
	octave 3
	note B_, 2
	rest 2
	; Measure 23 (G7)
	octave 3
	note G_, 2
	rest 2
	note B_, 2
	rest 2
	octave 4
	note F_, 2
	rest 2
	octave 3
	note B_, 2
	rest 2
	; Measure 24 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 25 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 26 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 27 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 28 (F)
	octave 3
	note F_, 2
	rest 2
	note A_, 2
	rest 2
	octave 4
	note C_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	; Measure 29 (F)
	octave 3
	note F_, 2
	rest 2
	note A_, 2
	rest 2
	octave 4
	note C_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	; Measure 30 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	; Measure 31 (G7)
	octave 3
	note G_, 2
	rest 2
	note B_, 2
	rest 2
	octave 4
	note F_, 2
	rest 2
	octave 3
	note B_, 2
	rest 2
	; Measure 32 (C)
	octave 3
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note G_, 2
	rest 2
	note E_, 2
	rest 2
	sound_loop 0, .loop

Music_JingleBells_Ch3:
	note_type 12, 2, 0
.loop:
	; Chorus
	; Measure 1 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 2 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 3 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 4 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 5 (F)
	octave 2
	note F_, 6
	rest 2
	octave 3
	note C_, 6
	rest 2
	; Measure 6 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 7 (G7)
	octave 2
	note G_, 6
	rest 2
	octave 3
	note D_, 6
	rest 2
	; Measure 8 (G7)
	octave 2
	note G_, 6
	rest 2
	octave 3
	note D_, 6
	rest 2
	; Measure 9 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 10 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 11 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 12 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 13 (F)
	octave 2
	note F_, 6
	rest 2
	octave 3
	note C_, 6
	rest 2
	; Measure 14 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 15 (G7)
	octave 2
	note G_, 6
	rest 2
	octave 3
	note D_, 6
	rest 2
	; Measure 16 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Verse
	; Measure 17 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 18 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 19 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 20 (F)
	octave 2
	note F_, 6
	rest 2
	octave 3
	note C_, 6
	rest 2
	; Measure 21 (F)
	octave 2
	note F_, 6
	rest 2
	octave 3
	note C_, 6
	rest 2
	; Measure 22 (G7)
	octave 2
	note G_, 6
	rest 2
	octave 3
	note D_, 6
	rest 2
	; Measure 23 (G7)
	octave 2
	note G_, 6
	rest 2
	octave 3
	note D_, 6
	rest 2
	; Measure 24 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 25 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 26 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 27 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 28 (F)
	octave 2
	note F_, 6
	rest 2
	octave 3
	note C_, 6
	rest 2
	; Measure 29 (F)
	octave 2
	note F_, 6
	rest 2
	octave 3
	note C_, 6
	rest 2
	; Measure 30 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	; Measure 31 (G7)
	octave 2
	note G_, 6
	rest 2
	octave 3
	note D_, 6
	rest 2
	; Measure 32 (C)
	octave 2
	note C_, 6
	rest 2
	note G_, 6
	rest 2
	sound_loop 0, .loop
