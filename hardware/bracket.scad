// MIT Kevin Walchko 2019

$fn = 90;

// library folder
use <screws.scad>;

module arm(h, d, a){
    aa = 90-a;
    len = h/sin(aa);
    difference()
    {
        rotate([aa,0,0]) scale([.5,1,1]) cylinder(h=len*2.5,d1=20,d2=50, center=false);
        s = 100;
        translate([-(2*s)/2,-(2*s)/2,-s]) cube([2*s,2*s,s], center=false);
        translate([-(2*s)/2,-(2*s)/2,h]) cube([2*s,2*s,s], center=false);
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

translate([30,0,0]) arm(20,15,60);
