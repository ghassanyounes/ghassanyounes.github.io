difference(){
cube([245,50,3.5], center=true);
for(i=[5,-5,117.5,-117.5],j=[7.5,-7.5, 20,-20])
    translate([i,j,0])
    cylinder(h=50,d=2.5,center=true,$fn=200);
}