// MIT Kevin Walchko 2019

$fn = 90;

// library folder
use <screws.scad>;

module battery(){
    w = 79;
    l = 160;
    color("red") translate([-w/2, -l/2-3, 0]) cube([w,l,23]);
}

module bolt(){
    hh = 10;
    sink = 7;
    difference(){
        union() {
            cylinder(d=10, h=hh);
            cylinder(d=20, h=3);
        }
        translate([0,0,hh-sink]) M3Nut(2*hh);
    }
}

module boltPattern(){
    w = 177;
    w2 = w-2*50;
    h = 35;
    translate([0,w/2,0]) bolt();
    translate([-3/2,w/2-10,0]) cube([3,7,10]); // battery stop tab on bolt
    translate([0,-w/2,0]) bolt();
    translate([-h-3/2,-w2/2+4,0]) cube([3,8,10]); // battery stop tab on bolt
    translate([-h,-w2/2,0]) bolt();
    translate([-h-3/2,w2/2-11,0]) cube([3,8,10]); // battery stop tab on bolt
    translate([-h,w2/2,0]) bolt();
}

// generic bar ... just  a cube
module bar(l, w, h){
    cube([l,w,h]);
}


module standoff(h){
    // long standoff for self-tapping M3 screw
    difference(){
        cylinder(h=h, d=8);
        translate([0,0,-1]) cylinder(h+2, d=2.5);
    }
    cylinder(d=15, h=3); // foot
}


// RPI deck
module turret(){
    color("blue") rotate([0,0,90]) import("stl/turret.stl");
}

module brace(){
    th = 4;
    color("red") {
        /* translate([10,47-5,0]) bar(50, 10, th);
        translate([10,-47-5,0]) bar(50, 10, th); */
        translate([11.5+15,0,0])
        difference()
        {
            union(){
                cylinder(d=100,h=4);
                // keep going straight for left/right wishbone arm
                translate([0,-50,0]) cube([50-15, 100, th]);

                // bottom wishbone bar
                translate([-40-26.5,-15,0]) bar(20,30,th);

                // bump up nubs for rpi
                nub = 2;
                nubd = 6;
                translate([0,50-3,4]) cylinder(d=nubd,h=nub);
                translate([0,-50+3,4]) cylinder(d=nubd,h=nub);
                translate([-50+3,0,4]) cylinder(d=nubd,h=nub);
            }
            translate([0,0,-2]) cylinder(d=80, h=4+4);
            translate([0,-80/2,-2]) cube([50, 80, th+4]); // square off inside

            // left wishbone pi mount point
            translate([55-11.5,50-3.5,0]) translate([-15,0,0]) M3(4);

            // bottom nuts to connect to pi
            translate([0,50-3,3]) rotate([0,180,0]) M3Nut(18);
            translate([0,-50+3,3]) rotate([0,180,0]) M3Nut(18);
            translate([-50+3,0,3]) rotate([0,180,0]) M3Nut(18);

            // right pi whishbone mount point
            translate([55-11.5,-50+3.5,0]) translate([-15,0,0]) M3(4); //cylinder(d=6.2, h=5); //right rpi hole

            // back pi wishbone mount point
            translate([-40-26.5,-15,0]) translate([5,15,0]) M3(4);
        }
    }
}

module bracket(){
    boltPattern(); // mount points to roomba

    // outer main support ring
    translate([15,0,0])
    /* difference() */
    {
        scale([.60,1,1])
        difference()
        {
            cylinder(d=177, h=3);
            translate([0,0,-1]) cylinder(d=157, h=5); // center hole
            translate([70,0,0]) cube([40,90,10], center=true); // front hole
            translate([-70,0,0]) cube([40,50,10], center=true); // back hole
        }

    }

    // rpi mounts
    translate([55,50-3.5,0]) {
        standoff(30);
        translate([-5,0,0]) rotate([0,0,-90]) bar(95,10,3);
        /* rotate([0,0,220]) translate([0,-5,0]) bar(120,10,3); */
    }
    translate([55,-50+3.5,0]) {
        standoff(30);
        /* rotate([0,0,-220]) translate([0,-5,0]) bar(120,10,3); */
    }
    // half circle to get around  schedule/clock buttons
    translate([50,0,0])
    difference()
    {
        cylinder(d=100, h=3);
        translate([0,0,-1]) cylinder(d=80, h=5);
        translate([0,-120/2,-1]) cube([60,120,5]);
    }
    // bars from bottom half circle to backstop
    translate([5,0,0]) {
        rotate([0,0,-215]) translate([0,-5,0]) bar(51,10,3);
        rotate([0,0,215]) translate([0,-5,0]) bar(51,10,3);
    }
    // bat between rpi mounting standoffs
    translate([54,45,0]) rotate([0,0,-90]) bar(90,3,20);


    // battery backstop
    translate([-40, 0,0]) rotate([0,90,0])
    difference()
    {
        dia = 60;
        union(){
            cylinder(d=dia, h=10);
            translate([-30,-15,0]) cube([10,30,10]);
        }
        translate([0,0,-1]) cylinder(d=dia-10, h=15);
        translate([0,-dia/2,-2]) cube([40,dia, 15]);
        rotate([0,90,0]) translate([-5,0,-28]) M3Nut(10);
    }
}

/* translate([10,0,4]) battery(); */

translate([0,0,30]) brace();

// pi
/* translate([11.5+15,0,34+2]) turret(); */

/* bracket(); */

/* translate([30,-10,0]) rotate([45,0,0]) cylinder(h=30,d=15); */

/* translate([30,0,0]) arm(20,15,60); */
