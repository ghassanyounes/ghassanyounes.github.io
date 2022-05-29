difference () {
    cube([240,17.5,5]);
    translate([8.25,2.5,2.5]) 
    union() {
        translate([0,6.25,0]) cylinder(h=5,d=12.5,$fn=60);
        cube([240,12.5,5]);
    }
    for(i=[25:12.5:235])
        translate([i,8.5,0]) cylinder(h=5,d=2.5,$fn=60);
}