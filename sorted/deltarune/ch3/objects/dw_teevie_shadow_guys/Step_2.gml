var xmove = 160;
if (camcontrol == true)
{
    obj_mainchara.cutscene = true;
    var desiredx = clamp(camx, 0, room_width - 640);
    camerax_set(scr_even(desiredx));
}
