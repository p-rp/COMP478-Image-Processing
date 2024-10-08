
function y = filter_func(T, a, b, u, v)
  y = (T / pi*(u*a + v*b)) * sin(pi*(u*a + v*b)) * exp(-j*pi*(u*a + v*b));
endfunction

