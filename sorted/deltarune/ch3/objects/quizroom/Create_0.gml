con = 0;
timer = 0;
transition_time = 20;
su_podium = 0;
kr_podium = 0;
ra_podium = 0;
su_press = 0;
ra_press = 0;
kr_press = 0;
su_sprite = spr_susie_quiz_down;
kr_sprite = spr_kris_quiz_down;
ra_sprite = spr_ralsei_quiz_down;
su_ready = 407;
kr_ready = 248;
ra_ready = 334;
start_sprite[0] = 0;
start_sprite[0] = 0;
start_sprite[0] = 0;
start_speed[0] = 0;
start_speed[0] = 0;
start_speed[0] = 0;
su_pose = false;
ra_pose = false;
kr_pose = false;
su_index = 0;
kr_index = 0;
ra_index = 0;
kris_xy = new Vector2(0, 0);
susie_xy = new Vector2(0, 0);
ralsei_xy = new Vector2(0, 0);
tenna_xy = new Vector2(0, 0);
su_pomark = 0;
ra_pomark = 0;
kr_pomark = 0;
te_pomark = 0;
te_pomark_2 = 0;
kr_name = scr_gameshowname();
gameshow = 30;
standalone = true;
gacha_balls[0] = -4;
gacha_balls[1] = -4;
gacha_balls[2] = -4;
board4 = obj_quizsequence.board4;
tenna_podium = board4 ? 3839 : 4187;
susie_punch = false;
susie_punch_timer = 0;
if (standalone)
{
    kris = scr_dark_marker(x, y, spr_kris_quiz_down);
    kris.visible = false;
    ralsei = scr_dark_marker(x, y, spr_ralsei_quiz_down);
    ralsei.visible = false;
    susie = scr_dark_marker(x, y, spr_susie_quiz_down);
    susie.visible = false;
    tenna = instance_create(x, y, obj_actor_tenna);
    tenna.visible = false;
    if (!i_ex(gameshow))
    {
        with (obj_actor)
        {
            if (name == "kris")
            {
                other.kris.sprite_index = sprite_index;
                other.kris.image_index = image_index;
                other.kris.image_speed = image_speed;
            }
            else if (name == "susie")
            {
                other.susie.sprite_index = sprite_index;
                if (sprite_index == spr_susie_trapped_punch)
                {
                    other.susie_punch = true;
                    other.susie.image_index = 0;
                    other.susie.image_speed = 0;
                }
                else
                {
                    other.susie.image_index = image_index;
                    other.susie.image_speed = image_speed;
                }
            }
            else if (name == "ralsei")
            {
                other.ralsei.sprite_index = sprite_index;
                other.ralsei.image_index = image_index;
                other.ralsei.image_speed = image_speed;
            }
        }
        gacha_balls[0] = instance_create(0, 0, obj_ch3_GSC07_gacha);
        gacha_balls[0].actor_target = kris;
        gacha_balls[0].mode = 1;
        gacha_balls[0].depth = 30000;
        gacha_balls[1] = instance_create(0, 0, obj_ch3_GSC07_gacha);
        gacha_balls[1].actor_target = susie;
        gacha_balls[1].mode = 4;
        gacha_balls[1].depth = 30000;
        gacha_balls[2] = instance_create(0, 0, obj_ch3_GSC07_gacha);
        gacha_balls[2].actor_target = ralsei;
        gacha_balls[2].mode = 2;
        gacha_balls[2].depth = 30000;
    }
    if (i_ex(gameshow))
        depth = min(gameshow.playerpodiums.depth, gameshow.scoreboard.depth, obj_quizsequence.depth) - 1000;
    else
        depth = obj_quizsequence.depth - 1000;
}
else if (i_ex(gameshow))
{
    kris = gameshow.kris;
    susie = gameshow.susie;
    ralsei = gameshow.ralsei;
    tenna = gameshow.tenna;
    depth = min(gameshow.playerpodiums.depth, gameshow.scoreboard.depth, obj_quizsequence.depth) - 1000;
}
else
{
    with (obj_actor)
    {
        if (name == "kris")
            other.kris = id;
        else if (name == "susie")
            other.susie = id;
        else if (name == "ralsei")
            other.ralsei = id;
    }
    tenna = obj_actor_tenna;
    depth = obj_quizsequence.depth - 1000;
}
camx = camerax();
camy = cameray();
board4 = false;
bg = -4;
