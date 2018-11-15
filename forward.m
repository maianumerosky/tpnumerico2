function y = forward(f,x,h)
    y = (f(x+h) - f(x))./h;