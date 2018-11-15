
f = @(p) p(:,1).*(1-p(:,1)).*p(:,2).*(1-p(:,2));
g = @(p) ones(length(p),1)*3;

%# Si quiero puntos al azar
%nb = 10; #nodos en borde
%ni = 100; #nodos interior
%P = [zeros(nb,1) rand(nb,1);ones(nb,1) rand(nb,1);rand(nb,1) zeros(nb,1);rand(nb,1) ones(nb,1)]; #puntos en borde
%P = [P; rand(ni,2)]; #puntos interiores

# Puntos en cuadricula
hx = 0.05;
hy = 0.05;

Px = 0:hx:1;
nx = length(Px);
Py = 0:hy:1;
ny = length(Py);
P = zeros(ny*nx,2);
c = 1;
for j = 1:ny
  for i=1:nx
    P(c,:) = [Px(i),Py(j)];
    c = c+1;
  endfor
endfor

N = size(P,1);
d = size(P,2);

T = delaunay(P(:,1),P(:,2));
M = sparse(N,N);
A = sparse(N,N);
b = zeros(N,1);

NT = size(T,1);

for r=1:NT
  nodos = T(r,:);
  puntos = P(nodos,:);
  
  med_T = abs(det(H));
  H = [ones(1,d+1); puntos'];
  G = H\[zeros(1,d); eye(d)];
  Mloc = med_T*G*G'/prod(1:d);
  
  M(nodos,nodos) = M(nodos,nodos)+Mloc;
  
  Aloc = med_T/12*toeplitz([2 1 1])
  A(nodos,nodos) = A(nodos,nodos)+Aloc;

endfor

u = zeros(N,1);

borde = [];
for i=1:N
  if P(i,1) == 0 || P(i,1) == 1 || P(i,2) == 0 || P(i,2) == 1
    borde = [borde;i];
  endif
endfor

interior = setdiff([1:N],borde);

D = borde; # D conjunto nodos dirichlet
M(D,:) = zeros(length(D),N);
M(D,D) = eye(length(D));
b(D) = g(P(D,:));

%u(interior,:) = M(interior,interior)\b(interior,:);
u = M\b;

trimesh(T,P(:,1),P(:,2),u)


Gr = zeros(N,2);
cant = zeros(N,1);

for r=1:NT
  nodos = T(r,:);
  uloc = u(nodos);
  Grloc = [];
  Ploc = [P(nodos,1) P(nodos,2)];
  for i = 1:3
    Pi = [P(nodos(i),1) P(nodos(i),2)];
    
    GrLoc 
    
    Grloc = [Grloc; 