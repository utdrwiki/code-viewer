radius = 40;
if (i_ex(obj_mainchara))
{
    var mx = obj_mainchara.x + (obj_mainchara.sprite_width / 2);
    var ox = x + (sprite_width / 2);
    if (abs(mx - ox) <= radius && obj_mainchara.y >= y && con == 0)
    {
        scr_depth();
        snd_play_x(snd_wing, 1, 0.8);
        with (object_index)
            con = 1;
        visible = 1;
        rabbick = instance_create(x, y, obj_chaseenemy);
        with (rabbick)
        {
            sprite_index = spr_ribbick_Idle;
            touchsprite = spr_ribbick_Idle;
            scr_delay_var("autodepth", 1, 4);
            alertcon = -1;
            pacetype = 10;
            autodepth = 0;
            var maxy = 40;
            var found = 0;
            for (var i = 40; i < 180; i++)
            {
                if (!found)
                {
                    if (place_meeting(x, y + i + 20, obj_solidblock))
                    {
                        found = 1;
                        maxy = i;
                    }
                }
            }
            depth = other.depth - 1;
            scr_lerpvar("y", y, y + maxy, round(maxy / 18));
        }
        rabbick.myencounter = encounterno;
        rabbick.encounterflag = encounterflag;
    }
}
