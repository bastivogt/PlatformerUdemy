/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben


var up = keyboard_check(vk_space);
var left = -keyboard_check(vk_left);
var right = keyboard_check(vk_right);



var move = left + right;

hsp = move * spd;

/*if(place_meeting(x + hsp, y, oWall)) {
	
	while(!place_meeting(x + sign(hsp), y, oWall)) {
		x += sign(hsp);
	}
	hsp = 0;
}*/

if(!place_free(x + hsp, y)) {
	if(hsp > 0) {
		move_contact_solid(0, -1);
	}else {
		move_contact_solid(180, -1);
	}
	hsp = 0;
}

if(move != 0) {
	image_xscale = move;
}


x += hsp;

show_debug_message("left " + string(left));
show_debug_message("right " + string(right));
show_debug_message("move " + string(move));

if(vsp < 10) {
	vsp += grav;
}

// Jump

/*if(place_meeting(x, y + 1, oWall) && up) {
	vsp = -10;
}*/

if(!place_free(x, y + 1) && up) {
	vsp = -10;
}


/*if(place_meeting(x, y + vsp, oWall)) {
	
	while(!place_meeting(x, y + sign(vsp), oWall)) {
		y += sign(vsp);
	}
	vsp = 0;
}*/

if(!place_free(x, y + vsp)) {
	if(vsp > 0) {
		move_contact_solid(270, -1);
	}else {
		move_contact_solid(90, -1);
	}
	vsp = 0;
}

if(!place_free(x + hsp, y + vsp)) {
	vsp = 0;
}



y += vsp;