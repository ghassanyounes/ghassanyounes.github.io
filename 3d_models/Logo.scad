rend = 0;
resolution = 100;

if (rend == 0 || rend == 2) {
    union() {
        linear_extrude(height=2) {
        import(center=true,"logo_simple_small.svg");
        }
        translate ([0,0,10]) {
            linear_extrude(height=2) {
            import(center=true,"logo_simple_small.svg");
            }
        }
    }
}

if (rend == 0 || rend == 1) {
    difference() {
        translate ([0,-1,1]) minkowski() {
            sphere(1, $fn=resolution/5);
            union () {
                    cylinder(h=10, d=70, $fn=resolution);
                translate([0,35,0]) {
                    difference() {
                        cylinder(h=10, d=30, $fn=resolution/2.5);
                        cylinder(h=10, d=15, $fn=resolution/5);
                    }
                }
            }
        }
        union() {
            linear_extrude(height=2) {
            import(center=true,"logo_simple_small.svg");
            }
            translate ([0,0,10]) {
                linear_extrude(height=2) {
                import(center=true,"logo_simple_small.svg");
                }
            }
        }
    }
}
