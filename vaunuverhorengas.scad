
thickness=8;
outer_diameter=65;

difference() {
    translate([0, 0, thickness]) {
        rotate(a=15) {
            rotate_extrude(angle=330, convexity = 10, $fn = 100) {
                translate([outer_diameter, 0, 0]) {
                    circle(r=thickness, $fn = 100);
                }
            }
        }

        rotate(a=11.6) {
            translate([outer_diameter, 0, 0]) {
                sphere(r=13, $fn=100);
            }
        }

        rotate(a=-11.6) {
            translate([outer_diameter, 0, 0]) {
                sphere(r=13, $fn=100);
            }
        }
    }
    
    translate([0, 0, -4.8]) {
        cube([3*outer_diameter, 3*outer_diameter, 10], center=true);
    }
}