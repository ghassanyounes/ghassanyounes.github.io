
difference() {
    translate([0,15,0])
    union() {
        translate([0,-15,25])
        cylinder(h=50,r=350,center=true,$fn=200);
        scale([10,10,1])linear_extrude(height=100) {
            import(center=true,"logo_simple_small.svg");
        }
    }
    for(i=[-80,80])
        for (j=[-315,315])
            translate([i,j,0])
            cylinder(h=200,r=10,center=true);
}