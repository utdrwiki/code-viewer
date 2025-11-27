is_active = global.plot >= 280;
face_y_scale = 0;

turn_on = function()
{
    is_active = true;
    snd_play_x(snd_dtrans_square, 0.5, 3);
    scr_lerpvar("face_y_scale", 0, 1, 24, -2, "out");
};
