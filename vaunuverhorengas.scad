
thickness=8;
diameter=65;

/*
 * It is better to set $fa and $fs as Torsten suggested rather than
 * fixing all curves to be octagons. It then adapts to the size of the
 * shape. $fa = 5; $fs = 0.5 is suitable for 3D printing viscous
 * plastic like ABS because it acts like a French curve. You might
 * want $fa a bit lower for PLA when doing a final render.
 *
 * https://github.com/openscad/openscad/issues/237#issuecomment-287891242
 */
$fa = 4;
$fs = 0.5;

// One knob (a sphere)
module knob(radius) {
    translate([diameter, 0, 0]) {
        sphere(r = radius);
    }
}

// The donut aka ring. with knobs.
module ring() {
    rotate(a=15) {
        rotate_extrude(angle=330, convexity = 10) {
            translate([diameter, 0, 0]) {
                circle(r=thickness);
            }
        }
    }

    // Knobs at the ends (where the opening is)
    for (angle = [-11.6, 11.6]) {
        rotate(a = angle) {
            knob(thickness*1.6);
        }
    }

    // Knobs on the ring (but not on the ends)
    for (angle = [45 : 45 : 315]) {
        rotate(a = angle) {
            knob(thickness*1.3);
        }
    }
}

// Cut out a bit of bottom to make flat surface for printing
difference() {
    translate([0, 0, thickness]) {
        ring();
    }
    translate([0, 0, -thickness/2.1]) {
        cube([3*diameter, 3*diameter, thickness], center=true);
    }
}