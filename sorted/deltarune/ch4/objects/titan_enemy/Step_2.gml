if (gerson.sprite_index == spr_gerson_rudebuster_ready)
{
    with (obj_herosusie)
    {
        if (thissprite == spr_susieb_spellready)
            thissprite = spr_susieb_spellready;
    }
}
if (acting == 1 && actcon == 0 && dualbusterenabled && !susiesideaenabled && !gersoncastanim && global.myfight != 3)
{
    gersoncastanim = true;
    scr_battle_sprite_set("susie", spr_susieb_spellready_unhappy, 1/3, 1);
    gerson.sprite_index = spr_gerson_rudebuster_ready;
    gerson.image_speed = 1/3;
    gerson.image_index = 0;
    gerson.x += 16;
    gerson.y += 22;
}
