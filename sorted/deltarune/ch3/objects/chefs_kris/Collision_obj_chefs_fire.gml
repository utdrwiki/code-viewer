if (obj_chefs_game.gameover)
    exit;
if (invincible > 0)
    exit;
if (other.flamewhip == true && jumping > 0)
    exit;
if (i_ex(obj_tenna_enemy) && obj_tenna_enemy.con > 1)
    exit;
burn_stack();
