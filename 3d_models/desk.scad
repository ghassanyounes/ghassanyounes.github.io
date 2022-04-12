doubles = true;

module tabletop(width, depth, height, power = true) { 
  union() {
    translate([0,0.5,0.5])rotate([0,90,0]) cylinder(h=width,d=1,$fn=60);
    translate([0,0.5,0]) cube([width,depth,height]);
  }
  translate([0.5,depth-1.5,-2]) cube([width-1,1,2]);
  translate([0.5,(depth-1.5)/2,-2]) cube([width-1,1,2]);
  if(power) {
    for(i = [5,7, 12, 14, width-6.5, width-8.5, width-13.5, width-15.5])
    translate([i,depth-1.65,-0.35]) rotate([90,90,0]) socket();
  }
}

module leg(depth, height) {
  translate([0,0,0.5]) cube([2,depth,3.5]);
  translate([0,depth/2,height-2]) cube([2,depth/2,2]);
  translate([0,depth-2,0.5]) cube([2,2,height-0.5]);
  translate([1,depth-1,0]) cylinder(h=0.5, d=2, $fn=60);
  translate([0,(depth-2)/2,0.5]) cube([2,2,height-0.5]);
  translate([1,+1,0]) cylinder(h=0.5, d=2, $fn=60);
}
  
module table (w, d, h) { 
  translate([0,0,h-1]) tabletop(w,d,1);
  translate([0.5,0,0]) leg(d-0.5,h-1);
  translate([w-2.5,0,0]) leg(d-0.5,h-1);
}

module socket() {
  difference() {
    cube([1.5,1.5,0.25]);
    translate([0.25,0.75,0.15]) cube([0.2,0.5,0.15]);
    translate([1,0.75,0.15]) cube([0.2,0.5,0.15]);
    translate([0.75,0.4,0.15]) cylinder(d=0.25,h=0.15,$fn=60);
  }
}

module upright_doubles (h = 36, elevation = 30, power = false) {
  difference() {
    translate([1,0,elevation-1]) cube([2,2,h+1]);
    union () {
      for (i = [1.75, 2.25], j = [1:h]) {
        translate([i, -0.5, elevation+j]) cube([0.1,3,0.5]);
      }
    }
  }
  translate([0,-3,elevation]) cube([4,8,0.25]);
  translate([0,-0.5,elevation-1.25]) cube([4,3,0.25]);
  for (i = [1, 3], j = [-2,4], k=[0, 2]) {
    translate([i,j,elevation+0.25]) cylinder(h=0.25,d=0.5,$fn=60);
    translate([i,k,elevation-1.5]) cylinder(h=0.25,d=0.5,$fn=60);
  }
  if(power) {
    translate([1.25,0.25,elevation+h]) socket();
  }
}

module binbar(w=60) {
  for (i = [1.75, 2.25, w-1.75, w-2.25], j=[0,1]) {
    translate([i, -0.25, j]) cube([0.1,1.25,0.5]);
  }
  translate([1.75, -0.25, 0]) cube([w-3.25,0.25,5]);
  translate([1.75, -2.25, 0.5]) cube([w-3.25,0.25,1]);
  translate([1.75, -0.25, 0]) rotate([75,0,0]) cube([w-3.25,0.25,2]);
  difference() {
    for(i=[1.75, w-1.75]) {
      translate([i,-2.25,0]) cube([0.25,2,1.5]);
    }
    translate([0, -0.25, -2]) rotate([75,0,0]) cube([60,2,4]);
  }
}

module shelf(w=60,d=15) {
  for (i = [1.75, 2.25, w-1.75, w-2.25], j=[0,2,3,4]) {
    translate([i, -0.25, j]) cube([0.1,1.25,0.5]);
  }
  union() {
    translate([0, -(d+0.25), 4.5]) rotate([0,90,0]) cylinder(h=w,d=1,$fn=60);
    translate([0, -(d+0.25), 4]) cube([w,15,1]);
  }
  difference() {
    for(i=[1.75, w-2.25]) {
      translate([i,-15.25,0]) cube([0.6,15,4]);
    }
    translate([0, -0.25, -10.5]) rotate([73,0,0]) cube([60,10,20]);
  }
}

module powerbar(w=52,num=8, inset=30,elev=30) {
  translate([4,inset-1.25,elev]) cube([w,2,2]);
  translate([8,inset+0.5,elev-1]) cube([4,0.25,1]);
  translate([w-4,inset+0.5,elev-1]) cube([4,0.25,1]);
  
  for(i = [9,12,15,18, w-2.5, w-5.5, w-8.5, w-11.5])
    translate([i,inset-1.35,elev+1.75]) rotate([90,90,0]) socket();
}

module double_lightmount(w=60) {
  for (i=[-0.25/2,w-4]) {
    translate([i,-0.25/2,-0.5])
    difference () {
      translate([0,-0.5,0]) cube([2.25,3.25,2.25]);
      translate([-i,0.25/2,0.75]) cube([2,2,2]);
    }
    union() {
      translate([i,-0.6,-0.25]) rotate([45,0,0]) cube([2,1,17]);
      translate([i,-22.25,11.5]) cube([2,10.5,1]);
    }
    translate([w-2,2,0]) rotate([0,0,180])
    union() {
      translate([i,-0.6,-0.25]) rotate([45,0,0]) cube([2,1,17]);
      translate([i,-22.25,11.5]) cube([2,10.5,1]);
    }
  }
  translate([-0.25/2,-24.25,10.5]) cube([w-(1.75+0.25/2),5,1]);
  translate([-0.25/2,21.25,10.5]) cube([w-(1.75+0.25/2),5,1]);
}

module drawer() {
  translate([0,1,0]) cube([14.5,14.5,6]);
  translate([0,0,5]) cube([14.5,0.25,1]);
  translate([0,0,5.75]) cube([14.5,1,0.25]);
}

scale([24.5, 24.5, 24.5]) { 
  table(w=60,d=30,h=30);
  if (doubles) {
    translate([60,62,0]) rotate([0,0,180]) table(w=60,d=30,h=30);
    translate([0,30,0]) upright_doubles(power=true);
    translate([60-4,30,0]) upright_doubles(power=true);
    translate([60,32,37]) rotate([0,0,180]) binbar(60);
    translate([60,32,54]) rotate([0,0,180]) shelf(w=60, d=15);
    translate([60,62,0]) rotate([0,0,180]) powerbar(w=52,num=8,inset=30, elev=30);
    translate([1,30,64]) double_lightmount(w=60);
    translate([56.5,58,21]) rotate([0,0,180]) drawer();
  } else {
    ;
  }
  translate([0,30,40]) binbar(60);
  translate([0,30,50]) shelf(w=60, d=15);
  powerbar(w=52,num=8,inset=30, elev=30);
  translate([42,4,21]) drawer();
}