module tb_task_func;
  int a = 3, b = 5, result_func, result_task;

  // Function: instant
  function int add_func(int a, int b);
    add_func = a + b;
  endfunction

  // Task: delayed
  task add_task(input int a, b, output int c);
    #10;     // simulate delay
    c = a + b;
  endtask

  initial begin
    $display("---- Function call ----");
    result_func = add_func(a, b);      // executes instantly
    $display("[%0t] Function result = %0d", $time, result_func);

    $display("---- Task call ----");
    add_task(a, b, result_task);       // takes 10 time units
    $display("[%0t] Task result = %0d", $time, result_task);
  end
endmodule
