// MIT Kevin Walchko 2019

$fn = 90;

// library folder
use <screws.scad>;

module arm(h, d, a){
    aa = 90-a;
    len = h/sin(aa);
    difference(){
        rotate([aa,0,0]) cylinder(h=len*2.5,d=15, center=true);
        translate([0,0,-50]) cube([100,100,100], center=true);
        translate([0,0,h+50]) cube([100,100,100], center=true);
    }
}

difference(){
    cube([100,20,4], center=true);
    /* rotate([180,0,0])  */
    translate([50-3.5,0,0.1]){
        M3Nut(4);
        M3(4);
    }

    /* rotate([180,0,0])  */
    translate([-50+3.5,0,0.1]){
        M3Nut(4);
        M3(4);
    }
}

/* translate([30,-10,0]) rotate([45,0,0]) cylinder(h=30,d=15); */

arm(20,15,60);
