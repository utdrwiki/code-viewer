event_inherited();
if (facing_right && image_xscale != -2)
    scr_flip("x");
if (!facing_right && image_xscale != 2)
    scr_flip("x");
if (state != current_state)
{
    state = current_state;
    state_init = false;
    state_loaded = false;
    if (state != 2 && state != 3)
        thinking_loop = false;
    if (state < 14)
        writing_loop = false;
    if (paper_marker != -4)
        instance_destroy(paper_marker);
}
if (state == 0)
{
    if (!state_init)
    {
        state_init = true;
        anim_speed = 0;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 1)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = facing_up ? spr_gerson_outfit_walk_up : spr_gerson_outfit_walk_cane;
        anim_speed = 0.2;
        anim_index = 0;
        state_loaded = true;
    }
    if (facing_up)
    {
        if (current_sprite_index != spr_gerson_outfit_walk_up)
            current_sprite_index = spr_gerson_outfit_walk_up;
    }
    else if (current_sprite_index != spr_gerson_outfit_walk_cane)
    {
        current_sprite_index = spr_gerson_outfit_walk_cane;
    }
}
if (state == 2)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_gerson_beard_thinking;
        anim_speed = 0.1;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 3)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_gerson_shifty;
        anim_speed = 0.1;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 4)
{
    if (!state_init)
    {
        state_init = true;
        state_loaded = true;
        thinking_loop = true;
        thinking_timer = 0;
    }
}
if (state == 5)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_gerson_outfit_laugh_left;
        anim_speed = 0.2;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 6)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_gerson_bow;
        anim_speed = 0;
        anim_index = 0;
        scr_lerpvar("anim_index", 0, 2, 12);
        scr_delay_var("state_loaded", true, 13);
    }
}
if (state == 7)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_gerson_outfit_genki;
        anim_speed = 0.2;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 8)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_gerson_point_left;
        anim_speed = 0.1;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 9)
{
    if (!state_init)
    {
        state_init = true;
        anim_speed = 0;
        anim_index = 0;
        state_loaded = true;
        current_sprite_index = spr_gerson_outfit_walk_cane;
    }
    if (facing_up)
    {
        if (current_sprite_index != spr_gerson_outfit_walk_up)
            current_sprite_index = spr_gerson_outfit_walk_up;
    }
    else if (current_sprite_index != spr_gerson_outfit_walk_cane)
    {
        current_sprite_index = spr_gerson_outfit_walk_cane;
    }
}
if (state == 10)
{
    if (!state_init)
    {
        state_init = true;
        anim_speed = 0;
        anim_index = 0;
        state_loaded = true;
        current_sprite_index = spr_gerson_battle_overworld;
    }
}
if (state == 11)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_gerson_laugh_scene;
        anim_speed = 0.2;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 12)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_gerson_bow_shake;
        anim_speed = 0.1;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 13)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_gerson_hand_up;
        anim_speed = 0;
        anim_index = 0;
        paper_timer = 0;
    }
    if (paper_con == 0)
    {
        paper_timer++;
        if (paper_timer == 1)
        {
            if (paper_marker != -4)
                instance_destroy(paper_marker);
            snd_play_pitch(snd_wing, 1.2);
            paper_marker = scr_dark_marker(x + 14, y + 46, spr_gerson_paper_fall);
            with (paper_marker)
            {
                vspeed = 6;
                scr_var_delay("sprite_index", spr_gerson_paper_floor, 6);
                scr_var_delay("vspeed", 0, 4);
                scr_var_delay("hspeed", -6, 3);
                scr_var_delay("friction", 1, 8);
            }
        }
    }
    if (paper_con == 1)
    {
        paper_timer++;
        if (paper_timer == 1)
        {
            current_sprite_index = spr_gerson_hand_up_look_down;
            anim_index = 0;
        }
        if (paper_timer == 10)
        {
            current_sprite_index = spr_gerson_reach_down;
            anim_index = 0;
        }
        if (paper_timer == 14)
            anim_index = 1;
    }
}
if (state == 14)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_gerson_writing_loop;
        anim_speed = 0.1;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 15)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_gerson_writing_scratch_loop;
        anim_speed = 0.1;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 16)
{
    if (!state_init)
    {
        state_init = true;
        current_sprite_index = spr_gerson_writing_scratch_aha;
        anim_speed = 0;
        anim_index = 0;
        scr_lerpvar("anim_index", 0, 1, 6);
        scr_delay_var("state_loaded", true, 7);
    }
}
if (state == 17)
{
    if (!state_init)
    {
        state_init = true;
        state_loaded = true;
        writing_loop = true;
        writing_timer = 0;
    }
}
if (state == 18)
{
    if (!state_init)
    {
        state_init = true;
        spintimer = 0;
        current_sprite_index = spr_gerson_spin_smear;
        anim_speed = 0;
        anim_index = 0;
    }
    spintimer++;
    if (spintimer < 10)
        anim_index += (2/3);
    if (spintimer == 10)
    {
        anim_index = 0;
        current_sprite_index = spr_gerson_spin;
        snd_play(snd_mercyadd);
    }
    if (spintimer >= 10)
    {
        if (anim_index < 11)
            anim_index += 0.5;
        if (anim_index >= 11)
            anim_index += 0.25;
        if (anim_index > 13)
            anim_index = 13;
    }
    if (spintimer == 50)
        state_loaded = true;
}
if (state == 19)
{
    if (!state_init)
    {
        state_init = true;
        anim_timer = 0;
        current_sprite_index = spr_gerson_smear_battle_ready;
        anim_speed = 0;
        anim_index = 1;
    }
    anim_timer++;
    if (anim_timer == 4)
        anim_index = 0;
    if (anim_timer == 30)
        state_loaded = true;
}
if (state == 20)
{
    if (!state_init)
    {
        state_init = true;
        anim_timer = 0;
        current_sprite_index = spr_gerson_outfit_genki;
        anim_speed = 0;
        anim_index = 0;
    }
    anim_timer++;
    if (anim_timer == 1)
        scr_jump_to_point_sprite(x, y, 8, 8, 2203, 2203);
    if (anim_timer == 14)
    {
        current_sprite_index = spr_gerson_outfit_walk_cane;
        anim_speed = 0;
        anim_index = 0;
        state_loaded = true;
    }
}
if (state == 21)
{
    if (!state_init)
    {
        state_init = true;
        writing_loop = false;
        current_sprite_index = spr_gerson_writing_look;
        anim_speed = 0;
        anim_index = 0;
        state_loaded = true;
    }
}
if (thinking_loop)
{
    thinking_timer++;
    if (thinking_timer == 1)
        current_state = 2;
    if (thinking_timer == 70)
        current_state = 3;
    if (thinking_timer == 110)
        thinking_timer = 0;
}
if (writing_loop)
{
    writing_timer++;
    if (writing_timer == 1)
        current_state = 14;
    if (writing_timer == 120)
        current_state = 15;
    if (writing_timer == 190)
        current_state = 16;
    if (writing_timer == 210)
        writing_timer = 0;
}
