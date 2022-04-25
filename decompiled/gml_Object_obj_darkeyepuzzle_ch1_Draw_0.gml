total = 0
for (i = 0; i < 3; i += 1)
    draw_sprite_ext(spr_eyepuzzle_marking_ch1, i, ((x + 16) + (i * 110)), (y + 60), 2, 2, 0, c_white, 1)
for (i = 0; i < 3; i += 1)
{
    draw_sprite(spr_darkeye_ch1, eye[i], (x + (i * 110)), y)
    total += eye[i]
}
