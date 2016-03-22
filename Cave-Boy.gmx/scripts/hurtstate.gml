//hurtstate()
//set the sprite
sprite_index = sPlayerHurt;

if hspd != 0 {image_xscale = sign(hspd);}

//apply gravity
if !place_meeting (x, y + 1, oSolid) {
    vspd += grav;
}else{
    vspd = 0;
    //use friction
    applyfriction (acc);
}
damagebounce (oSolid);

//change back to move_state
if hspd == 0 && vspd == 0 {
    image_blend = c_white;
    state = move_state;
    if oPlayerStats.hp <= 0 {
        game_restart()
    }
}
