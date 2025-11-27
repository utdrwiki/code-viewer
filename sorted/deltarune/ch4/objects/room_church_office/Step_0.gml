if (!lightning_active)
    exit;
lightning_timer++;
if (lightning_timer == 1)
{
    snd_play(snd_thunder_instant);
    var lightning_marker = scr_marker(0, 0, spr_lw_church_office_lightning);
    with (lightning_marker)
    {
        depth = 990;
        scr_script_delayed(scr_lerpvar, 11, "image_alpha", 1, 0, 80, 3, "out");
        scr_doom(id, 90);
    }
}
