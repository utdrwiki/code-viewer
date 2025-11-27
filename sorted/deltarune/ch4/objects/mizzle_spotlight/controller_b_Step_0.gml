if (instance_number(obj_bulletparent) < 1)
    global.turntimer = 0;
if (global.turntimer < 1)
{
    instance_destroy();
    exit;
}
timer++;
if (eye_power == 0)
    counter += (counter_speed * sin(spotlight_radius));
else
    counter += counter_speed;
update_spotlights();
if (!alert)
{
    with (obj_mizzle_spotlight)
    {
        if (point_distance(x, y, obj_heart.x + 10, obj_heart.y + 10) < 30)
        {
            other.alert = true;
            snd_play(snd_rocket);
            global.turntimer = 180;
            with (obj_mizzle_enemy)
            {
                if (global.monsterstatus[myself] != 0)
                    wakeuptext();
                global.monsterstatus[myself] = 0;
                global.monstercomment[myself] = "";
                awake = true;
            }
            with (obj_mizzle_spotlight_eye)
                con = 1;
            with (obj_holywater_spiral)
                instance_destroy();
            with (obj_regularbullet)
            {
                if (object_index != obj_mizzle_spotlight_eye)
                    instance_destroy();
            }
            break;
        }
    }
}
