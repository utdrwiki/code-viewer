scr_populatechars();
if (!init)
    init = 1;
if (con == 0)
{
    with (obj_mainchara)
    {
        var trigger = instance_place(x, y, obj_overworld_bulletarea);
        if (trigger != -4)
        {
            other.con = 1;
            scr_lerpvar_instance(other.darkness, "image_alpha", other.darkness.image_alpha, other.onalpha, other.fadespeed);
        }
    }
}
if (con > 0)
{
    timer += 1;
    if (con == 1)
    {
        if (timer > (5 + fadespeed))
        {
            con = 2;
            timer = 0;
            scr_lerpvar_instance(other.darkness, "image_alpha", other.darkness.image_alpha, other.offalpha, other.fadespeed);
            var chance = [[1, 1], [1, 1], [1], [1], [1, 1], [1, 1, 1, 1, 1, 1, 1, 1]];
            with (obj_mainchara)
            {
                var trigger = instance_place(x, y, obj_overworld_bulletarea);
                if (trigger == -4)
                {
                    other.con = 0;
                    exit;
                }
                else
                {
                    var bullet_trigger = instance_place(x, y, obj_dw_churchc_dodge_trigger);
                    if (bullet_trigger != -4)
                        chance = bullet_trigger.chances;
                }
            }
            snd_play(snd_spawn_weaker, 0.8, 0.45);
            if (con == 2)
            {
                var angleAdd = 0;
                var valid = [];
                var invalid = [false, false, false, false, false, false];
                for (var i = 0; i < array_length(blacklist); i++)
                    invalid[blacklist[i]] = true;
                for (var i = 0; i < array_length(chance); i++)
                {
                    if (chance[i] != 0 && invalid[i] == 0)
                        array_push(valid, i);
                }
                var selected_index = irandom_range(0, array_length(valid) - 1);
                var pattern = patterns[valid[selected_index]];
                var total = 0;
                var selected_group = chance[valid[selected_index]];
                for (var i = 0; i < array_length(selected_group); i++)
                    total += selected_group[i];
                var select = random_range(0, total);
                var accumulate = 0;
                var selected_variation = 0;
                for (var i = 0; i < array_length(selected_group); i++)
                {
                    accumulate += selected_group[i];
                    if (select <= accumulate)
                    {
                        selected_variation = i;
                        break;
                    }
                }
                angleAdd = pattern[0][selected_variation];
                blacklist = pattern[1];
                for (var i = 2; i < array_length(pattern); i++)
                {
                    var offset = new Vector2(pattern[i][0], pattern[i][0]);
                    var angle = ((pattern[i][2] - 90) + angleAdd) % 360;
                    var xx = obj_mainchara.x + 20 + (250 * pattern[i][0]);
                    var yy = obj_mainchara.y + 20 + 25 + (250 * pattern[i][1]);
                    var enemy = instance_create(xx, yy, obj_ow_pathingenemy);
                    enemy.image_angle = angle;
                    enemy.direction = enemy.image_angle;
                    enemy.speed = pattern[i][3];
                    enemy.x -= pattern[i][4] * enemy.hspeed * 0.8;
                    enemy.y -= pattern[i][4] * enemy.vspeed * 0.8;
                    enemy.neutralcon = -1;
                    enemy.movetime = 9;
                    enemy.movetype = 3;
                    enemy.movevistype = 0;
                    enemy.waittime = 0;
                }
            }
        }
    }
    else if (timer > (35 + other.fadespeed))
    {
        con = 1;
        timer = 0;
        var fade = other.fadespeed;
        scr_lerpvar_instance(other.darkness, "image_alpha", other.darkness.image_alpha, other.onalpha, fade / 2);
        with (obj_ow_pathingenemy)
            scr_doom(self, fade / 2);
    }
}
with (obj_ow_pathingenemy)
{
    image_alpha = 1 - ((other.darkness.image_alpha - other.offalpha) / (other.onalpha - other.offalpha));
    active = image_alpha >= 0.9;
}
