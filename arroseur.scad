$fn = 100;

// 42.1 < x < 42.5
inside_size = 42.4;
inside_border = 1.5;
border_height = 4.5;
inside_height = 53;
wall = 2;
// 4 << 
wire_diameter = 4.25;
wire_extra_space = 2.75;

//if (false)
difference() {
union() {
  difference() {
    cube([inside_size + 2 * wall, inside_size + 2 * wall, inside_height + wall]);
    translate([wall, wall, wall]) cube([inside_size, inside_size, inside_height + wall]);
  }

  translate([0, 0, -border_height]) difference() {
    translate([0, 0, inside_height + wall]) union() {
      translate([wall, wall, 0]) rotate([0, 90, 0]) cylinder(r = inside_border, h = inside_size);
      translate([wall, wall + inside_size, 0]) rotate([0, 90, 0]) cylinder(r = inside_border, h = inside_size);
      translate([wall, wall, 0]) rotate([-90, 0, 0]) cylinder(r = inside_border, h = inside_size);
      translate([wall + inside_size, wall, 0]) rotate([-90, 0, 0]) cylinder(r = inside_border, h = inside_size);
    }
    translate([-100, -20, 0]) cube([100, 100, 100]);
    translate([inside_size + 2 * wall, -20, 0]) cube([100, 100, 100]);
    translate([-20, -100, 0]) cube([100, 100, 100]);
    translate([-20, inside_size + 2 * wall, 0]) cube([100, 100, 100]);
    translate([-2, -2, inside_height + wall]) cube([100, 100, 100]);
  }
}
  translate([wall + wire_diameter / 2 + 1, wall + wire_diameter / 2 + 1, -1]) hull() {
    cylinder(d = wire_diameter, h = 4);
    translate([wire_extra_space, 0, 0]) cylinder(d = wire_diameter, h = 4);
  }
//  translate([-20, -20, 0]) cube([100, 100, 100 + wall + inside_height - (border_height + 1)]);
}
