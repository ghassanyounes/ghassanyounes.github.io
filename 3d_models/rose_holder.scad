resolution=500;
module torus(r1=1, r2=2, angle=360, endstops=0, $fn=50){
    if(angle < 360){
        intersection(){
            rotate_extrude(convexity=10, $fn=$fn)
            translate([r2, 0, 0])
            circle(r=r1, $fn=$fn);
            
            color("blue")
            wedge(h=r1*3, r=r2*2, a=angle);
        }
    }else{
        rotate_extrude(convexity=10, $fn=$fn)
        translate([r2, 0, 0])
        circle(r=r1, $fn=$fn);
    }
    
    if(endstops && angle < 360){
        rotate([0,0,angle/2])
        translate([0,r2,0])
        sphere(r=r1);
        
        rotate([0,0,-angle/2])
        translate([0,r2,0])
        sphere(r=r1);
    }
}
module torustall(t1=1,t2,r1=1, r2=2, angle=360, endstops=0, $fn=50){
    if(angle < 360){
        intersection(){
            rotate_extrude(convexity=10, $fn=$fn)
            translate([r2, 0, 0])
        union (){
            translate([0,r1,0]) circle(r=r1, $fn=$fn);
            translate([-r1,-r1,0]) square(r1*2);
            translate([0,-r1,0]) circle(r=r1, $fn=$fn);
        }
            
            color("blue")
            wedge(h=r1*3, r=r2*2, a=angle);
        }
    }else{
        rotate_extrude(convexity=10, $fn=$fn)
        translate([r2, 0, 0])
        union (){
            translate([0,r1,0]) circle(r=r1, $fn=$fn);
            translate([-r1,-r1,0]) square(r1*2);
            translate([0,-r1,0]) circle(r=r1, $fn=$fn);
        }
    }
    
    if(endstops && angle < 360){
        rotate([0,0,angle/2])
        translate([0,r2,0])
        union (){
            translate([0,r1,0]) sphere(r=r1, $fn=$fn);
            translate([-r1,-r1,0]) cube(r1*2);
            translate([0,-r1,0]) sphere(r=r1, $fn=$fn);
        }
        
        rotate([0,0,-angle/2])
        translate([0,r2,0])
        union (){
            translate([0,r1,0]) sphere(r=r1, $fn=$fn);
            translate([-r1,-r1,0]) cube(r1*2);
            translate([0,-r1,0]) sphere(r=r1, $fn=$fn);
        }
    }
}

difference() {
    union() {
        cylinder(h=35,d=35,$fn=resolution);
        translate([0,0,35]) torus(r1=5,r2=12.5,$fn=resolution-2);
    }
    difference() {
        union() {
            translate([0,0,-2.5]) cylinder(h=32.5,d=25,$fn=resolution);
            translate([0,0,0]) cylinder(h=30,r1=12,r2=15,$fn=resolution);
        }
    }
    translate([0,0,-2.6]) cylinder(h=32.5,d=20.01,$fn=resolution);
    translate([0,0,-2.6]) cylinder(h=40,d=15,$fn=resolution);
    translate([0,0,32.5]) torustall(t1=1.25, t2=2, r1=2.5,r2=12.5,$fn=resolution);
    for (i=[0,120,240]) {
        rotate([0,0,i]) translate([10,0,30]) cube([20,10,45], center=true);
    }
}
