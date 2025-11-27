if (global.turntimer < 1)
    instance_destroy();
event_inherited();
if (sprite_index == spr_magic_book_bubble_split && image_index == 3.6666666666666665)
{
    with (instance_create(x, y, obj_book_bullet))
    {
        sprite_index = spr_magic_book_pop;
        image_speed = 0.5;
        hspeed = other.hspeed;
        vspeed = other.vspeed;
        scr_script_delayed(instance_destroy, 4, id);
    }
}
