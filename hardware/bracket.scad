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
    translate([-3/2,w/2-4-5,0]) cube([3,6,10]); // battery stop
    translate([0,-w/2,0]) bolt();
    translate([-h,-w2/2,0]) bolt();
    translate([-h,w2/2,0]) bolt();
}

module bar(l, w, h){
    cube([l,w,h]);
}

/* module mount(){
    cube([20, 100, 4]);
} */

/* module arch(){
    dia = 187;

    scale([1,1,.35]) rotate([0,90,0]) {
        difference()
        {
            cylinder(d=dia, h=20);
            translate([0,0,-2]) scale([1,.9,1]) cylinder(d=dia-1, h=24);
            translate([0,-dia/2-5,-2]) cube([dia+10, dia+10, 24]);
        }
    }
} */

module standoff(h){
    difference(){
        cylinder(h=h, d=8);
        translate([0,0,-1]) cylinder(h+2, d=2.5);
    }
    cylinder(d=15, h=3);
}

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

module turret(){
    color("blue") rotate([0,0,90]) import("stl/turret.stl");
}

module brace(){
    th = 4;
    color("red") {
        /* translate([10,47-5,0]) bar(50, 10, th);
        translate([10,-47-5,0]) bar(50, 10, th); */
        translate([11.5,0,0])
        difference()
        {
            union(){
                cylinder(d=100,h=4);
                translate([0,-50,0]) cube([50, 100, th]);
            }
            translate([0,0,-2]) cylinder(d=80, h=4+4);
        }
    }
}

/* translate([10,0,4]) battery(); */

boltPattern(); // mount points to roomba
/* translate([-5/2,170/2,0]) rotate([0,0,-90]) bar(170, 5,3); // center bar */
//translate([3,177/2-10/2,0]) bar(60,10,3); // left frward bar
//translate([3,-177/2-10/2,0]) bar(60,10,3); // rihgt frward bar
/* translate([52,0,0]) arch(); */
//translate([52,-50,30]) mount();

/* translate([0,0,30]) brace(); */

// pi
/* translate([11.5,0,34]) turret(); */
/* translate([55,0,34]) turret(); */

// rpi mounts
translate([55,50-3.5,0]) {
    standoff(30);
    translate([-5,0,0]) rotate([0,0,-90]) bar(95,10,3);
    rotate([0,0,220]) translate([0,-5,0]) bar(120,10,3);
}
translate([55,-50+3.5,0]) {
    standoff(30);
    rotate([0,0,-220]) translate([0,-5,0]) bar(120,10,3);
}

translate([54,45,0]) rotate([0,0,-90]) bar(90,3,20);

/* translate([-35,-50+3.5,0]) standoff(30); */

// battery front stop
/* translate([51, 0,0]) rotate([0,90,0])
difference()
{
    cylinder(d=40, h=6);
    translate([0,0,-1]) cylinder(d=30, h=12);
    translate([0,-20,-2]) cube([40,40, 15]);
} */

// battery back stop
translate([-40, 0,0]) rotate([0,90,0])
difference()
{
    /* cylinder(d=40, h=6);
    translate([0,0,-1]) cylinder(d=30, h=12);
    translate([0,-20,-2]) cube([40,40, 15]); */
    dia = 60;
    cylinder(d=dia, h=10);
    translate([0,0,-1]) cylinder(d=dia-10, h=15);
    translate([0,-dia/2,-2]) cube([40,dia, 15]);
    rotate([0,90,0]) translate([-5,0,-28]) M3Nut(10);
}

/* translate([30,-10,0]) rotate([45,0,0]) cylinder(h=30,d=15); */

/* translate([30,0,0]) arm(20,15,60); */
