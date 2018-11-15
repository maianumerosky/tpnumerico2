function y = backward(f,x,h)
    y = (f(x) - f(x-h))./h;