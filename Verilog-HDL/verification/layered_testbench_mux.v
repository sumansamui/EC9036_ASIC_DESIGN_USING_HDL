//===============================================================
// 2:1 MUX Layered Testbench using SystemVerilog OOP
// Author: Prof. Suman Samui
//===============================================================

//---------------- DUT ----------------
module mux_2x1(input logic a, b, sel, output logic y);
  assign y = sel ? b : a;
endmodule


//---------------- INTERFACE ----------------
interface mux_if;
  logic a, b, sel, y;
endinterface


//---------------- TRANSACTION CLASS ----------------
class mux_trans;
  rand bit a, b, sel;
  bit y_expected, y_actual;

  // Calculate expected output
  function void calc_expected();
    y_expected = (sel) ? b : a;
  endfunction

  // Display function
  function void display(string tag);
    $display("[%s] a=%0b b=%0b sel=%0b | exp=%0b act=%0b",
             tag, a, b, sel, y_expected, y_actual);
  endfunction
endclass


//---------------- GENERATOR CLASS ----------------
class generator;
  mailbox gen2drv;

  function new(mailbox m);
    gen2drv = m;
  endfunction

  task run();
    mux_trans tr;
    repeat (10) begin
      tr = new();
      tr.randomize();
      tr.calc_expected();
      gen2drv.put(tr);
      tr.display("GEN");
      #2;
    end
  endtask
endclass


//---------------- DRIVER CLASS ----------------
class driver;
  virtual mux_if vif;
  mailbox gen2drv;

  function new(virtual mux_if v, mailbox m);
    vif = v;
    gen2drv = m;
  endfunction

  task run();
    mux_trans tr;
    forever begin
      gen2drv.get(tr);        // wait for next transaction
      vif.a   <= tr.a;
      vif.b   <= tr.b;
      vif.sel <= tr.sel;
      #1;                     // allow signal to propagate
    end
  endtask
endclass


//---------------- MONITOR CLASS ----------------
class monitor;
  virtual mux_if vif;
  mailbox mon2scb;

  function new(virtual mux_if v, mailbox m);
    vif = v;
    mon2scb = m;
  endfunction

  task run();
    mux_trans tr;
    forever begin
      tr = new();
      #1;
      tr.a         = vif.a;
      tr.b         = vif.b;
      tr.sel       = vif.sel;
      tr.y_actual  = vif.y;
      tr.calc_expected();
      mon2scb.put(tr);
      tr.display("MON");
    end
  endtask
endclass


//---------------- SCOREBOARD CLASS ----------------
class scoreboard;
  mailbox mon2scb;

  function new(mailbox m);
    mon2scb = m;
  endfunction

  task run();
    mux_trans tr;
    forever begin
      mon2scb.get(tr);
      if (tr.y_actual !== tr.y_expected)
        $display("[FAIL] a=%0b b=%0b sel=%0b exp=%0b act=%0b ❌",
                 tr.a, tr.b, tr.sel, tr.y_expected, tr.y_actual);
      else
        $display("[PASS] a=%0b b=%0b sel=%0b -> y=%0b ✅",
                 tr.a, tr.b, tr.sel, tr.y_actual);
    end
  endtask
endclass


//---------------- ENVIRONMENT CLASS ----------------
class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;

  mailbox gen2drv;
  mailbox mon2scb;

  virtual mux_if vif;

  function new(virtual mux_if v);
    vif = v;
    gen2drv = new();
    mon2scb = new();

    gen = new(gen2drv);
    drv = new(vif, gen2drv);
    mon = new(vif, mon2scb);
    scb = new(mon2scb);
  endfunction

  task run();
    fork
      gen.run();
      drv.run();
      mon.run();
      scb.run();
    join_any
  endtask
endclass


//---------------- TOP-LEVEL TESTBENCH ----------------
module tb;
  mux_if mif(); // instantiate interface
  mux_2x1 dut (.a(mif.a), .b(mif.b), .sel(mif.sel), .y(mif.y));

  environment env;

  initial begin
    env = new(mif);  // pass virtual interface
    env.run();
    #50 $finish;
  end
endmodule
