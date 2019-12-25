// MIT Kevin Walchko 2019

$fn = 90;

// library folder
use <screws.scad>;

module battery(){
    w = 79;
    l = 160;
    color("red") translate([-w/2, -l/2, 0]) cube([w,l,23]);
}

module bolt(){
    hh = 10;
    sink = 5;
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
    translate([0,-w/2,0]) bolt();
    translate([-h,-w2/2,0]) bolt();
    translate([-h,w2/2,0]) bolt();
}

module bar(l, w, h){
    cube([l,w,h]);
}

module mount(){
    cube([20, 100, 4]);
}

module arch(){
    dia = 187;

    scale([1,1,.35]) rotate([0,90,0]) {
        difference()
        {
            cylinder(d=dia, h=20);
            translate([0,0,-2]) scale([1,.9,1]) cylinder(d=dia-1, h=24);
            translate([0,-dia/2-5,-2]) cube([dia+10, dia+10, 24]);
        }
    }

    /* translate([0,-177,0]) cube([20, 177, 30]); */

    /* scale([1,1,.65]) rotate([0,90,0]) {
        difference()
        {
            cylinder(d=dia, h=20);
            translate([0,0,-2]) scale([1,1,1]) cylinder(d=dia-3, h=24);
            translate([0,-dia/2-5,-2]) cube([dia+10, dia+10, 24]);
        }
    } */
    /* difference() */
    {
        /* translate([0,-50,0]) cube([20, 100, 30]);
        translate([-2,0,0]) rotate([0,90,0]) scale([.8,1.25,1]) cylinder(d=70,h=24); */

        /* w = 20;
        l = 75;
        translate([-2,-l/2,20]) rotate([0,90,0]) minkowski()
        {
          cube([w,l,25]);
          cylinder(r=6,h=1);
        } */
    }
    /* translate([0,-50,30]) mount(); */

    /* translate([0,0,40]) rotate([0,90,0]) minkowski()
    {
      cube([25,90,25]);
      cylinder(r=2,h=1);
    } */
}

/* module arm(h, d, a){
    aa = 90-a;
    len = h/sin(aa);
    difference()
    {
        rotate([aa,0,0]) scale([.5,1,1]) cylinder(h=len*2.5,d1=20,d2=50, center=false);
        s = 100;
        translate([-(2*s)/2,-(2*s)/2,-s]) cube([2*s,2*s,s], center=false);
        translate([-(2*s)/2,-(2*s)/2,h]) cube([2*s,2*s,s], center=false);
    }
} */

//difference()
/* {
    cube([100,20,4], center=true);
    rotate([180,0,0])
    translate([50-3.5,0,0.1]){
        M3Nut(4);
        M3(4);
    }

    rotate([180,0,0])
    translate([-50+3.5,0,0.1]){
        M3Nut(4);
        M3(4);
    }
} */

module standoff(h){
    difference(){
        cylinder(h=h, d=8);
        translate([0,0,-1]) cylinder(h+2, d=2.5);
    }
    cylinder(d=15, h=3);
}

translate([15,0,0])
difference() {
    scale([.60,1,1]) difference() {
        cylinder(d=177, h=3);
        translate([0,0,-1]) cylinder(d=157, h=5);
    }

}

module turret(){
    color("blue") rotate([0,0,90]) import("stl/turret.stl");
}

/* translate([10,0,4]) battery(); */

boltPattern(); // mount points to roomba
/* translate([-5/2,170/2,0]) rotate([0,0,-90]) bar(170, 5,3); // center bar */
//translate([3,177/2-10/2,0]) bar(60,10,3); // left frward bar
//translate([3,-177/2-10/2,0]) bar(60,10,3); // rihgt frward bar
/* translate([52,0,0]) arch(); */
//translate([52,-50,30]) mount();

// pi
/* translate([55,0,30]) turret(); */

// rpi mounts
translate([55,50-3.5,0]) standoff(30);
translate([55,-50+3.5,0]) standoff(30);

// battery front stop
translate([61, 0,0]) rotate([0,90,0])
difference()
{
    cylinder(d=40, h=6);
    translate([0,0,-1]) cylinder(d=30, h=12);
    translate([0,-20,-2]) cube([40,40, 15]);
}

// battery back stop
translate([-37, 0,0]) rotate([0,90,0])
difference()
{
    cylinder(d=40, h=6);
    translate([0,0,-1]) cylinder(d=30, h=12);
    translate([0,-20,-2]) cube([40,40, 15]);
}

/* translate([30,-10,0]) rotate([45,0,0]) cylinder(h=30,d=15); */

/* translate([30,0,0]) arm(20,15,60); */
