//=======================================
// Base class: Amplifier
//=======================================
class amplifier;
  real gain;
  virtual function real amplify(real vin);
    return vin * gain;
  endfunction
endclass

//---------------------------------------
// Derived classes
//---------------------------------------
class opamp extends amplifier;
  function new(); gain = 1000; endfunction
  function real amplify(real vin);
    return vin * gain; // ideal opamp model
  endfunction
endclass

class bjt_amp extends amplifier;
  function new(); gain = 50; endfunction
  function real amplify(real vin);
    return vin * gain; // small signal model
  endfunction
endclass

class fet_amp extends amplifier;
  function new(); gain = 20; endfunction
  function real amplify(real vin);
    return vin * gain; // simple gain
  endfunction
endclass

//=======================================
// Testbench
//=======================================
module tb;
  amplifier a;
  opamp o; bjt_amp b; fet_amp f;

  initial begin
    o = new(); b = new(); f = new();
    real vin = 0.01; // 10 mV input

    // polymorphic usage
    a = o; $display("Op-Amp Output = %0.2f V", a.amplify(vin));
    a = b; $display("BJT Amp Output = %0.2f V", a.amplify(vin));
    a = f; $display("FET Amp Output = %0.2f V", a.amplify(vin));
  end
endmodule
