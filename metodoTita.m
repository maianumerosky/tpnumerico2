#Parametros
alpha = 1;
dx = 0.1;
dt = 0.01;
tita = 0.3;

f = @(x) x.*(x-1);

# Codigo
r = dt/dx^2;
J = 1/dx;
K = 1/dt;

# Matriz A
v1 = (1+2*tita*alpha*r)*ones(1,J);
v2 = (-1*tita*alpha*r)*ones(1,J);

A = spdiags([v2',v1',v2'],[-1,0,1],J,J);

# Matriz B
v3 = (1-2*(1-tita)*alpha*r)*ones(1,J);
v4 = ((1-tita)*alpha*r)*ones(1,J);

B = spdiags([v4',v3',v4'],[-1,0,1],J,J);
