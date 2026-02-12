//===============================================
// Shape Area Calculation using OOP & Polymorphism
//===============================================

class shape;
  // Virtual function — will be redefined by child classes
  virtual function real area();
    return 0.0;
  endfunction
endclass


//---------------- Rectangle ----------------
class rectangle extends shape;
  real length, breadth;

  function new(real l, real b);
    length = l;
    breadth = b;
  endfunction

  function real area();
    return length * breadth;
  endfunction
endclass


//---------------- Circle ----------------
class circle extends shape;
  real radius;

  function new(real r);
    radius = r;
  endfunction

  function real area();
    return 3.1416 * radius * radius;
  endfunction
endclass


//---------------- Triangle ----------------
class triangle extends shape;
  real base, height;

  function new(real b, real h);
    base = b;
    height = h;
  endfunction

  function real area();
    return 0.5 * base * height;
  endfunction
endclass


//---------------- TEST / MAIN PROGRAM ----------------
module tb;
  shape s;                    // base class handle
  rectangle r; circle c; triangle t;

  initial begin
    r = new(4, 5);           // length=4, breadth=5
    c = new(3);              // radius=3
    t = new(6, 2);           // base=6, height=2

    // Use single handle 's' to access all
    s = r;
    $display("Area of Rectangle = %0.2f", s.area());

    s = c;
    $display("Area of Circle    = %0.2f", s.area());

    s = t;
    $display("Area of Triangle  = %0.2f", s.area());
  end
endmodule
