if (image_alpha == 0 && krisdancing)
{
    scr_battle_sprite_reset("kris");
    krisdancing = false;
}
scr_spareanim();
scr_recruit();
scr_monsterdefeat();
instance_destroy();
