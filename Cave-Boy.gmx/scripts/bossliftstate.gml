///bossliftstate()
image_index = 1;
if vspd >= -16 { vspd -= 0.5; } 

if place_meeting (x, y - 64, oSolid) {
    vspd = 0
    state = bosschasestate;
}
move(oSolid);
