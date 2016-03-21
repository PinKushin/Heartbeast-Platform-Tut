///move_state()

///player control
var right = keyboard_check (ord ("D"));
var left = keyboard_check (ord ("A"));
var up = keyboard_check_pressed (vk_space);
var up_release = keyboard_check_released (vk_space)

if !place_meeting (x, y+1, oSolid) {
    vspd += grav;
    
    //player is in the air
    sprite_index = sPlayerJump;
    image_speed = 0;
    image_index = (vspd > 0);
    
    //control jump height
    if up_release && vspd < -6 {
        vspd = -6;
    }
}else{
    vspd = 0;
    
    //Jump
    if up {
        vspd = -16;
    }
    
    //player on the ground
    if hspd == 0 {
        sprite_index = sPlayerIdle;
    }else{
        sprite_index = sPlayerWalk;
        image_speed = .6
    }
}
if right || left {
    hspd += right - left * acc;
    hspd_dir = right - left;
    
    if hspd > spd { hspd = spd};
    if hspd < -spd {hspd = -spd};
} else {
    applyfriction (2)
}

if hspd !=0 {
    image_xscale = sign(hspd);
}
move(oSolid);

///Check for ledge grab state
var falling = y - yprevious > 0;
var wasnt_wall = !position_meeting (x + 17 * image_xscale, yprevious, oSolid);
var is_wall = position_meeting (x + 17 * image_xscale, y, oSolid);

if falling && wasnt_wall && is_wall {
    hspd = 0;
    vspd = 0;
    
    //move against the ledge
    while !place_meeting (x + image_xscale, y, oSolid) {
        x+= image_xscale;
    }
    //move to right height
    while position_meeting(x + 17 * image_xscale, y - 1, oSolid) {
        y -= 1
    }
    
    sprite_index = sPlayerGrab;
    state = ledge_grab_state;
}
