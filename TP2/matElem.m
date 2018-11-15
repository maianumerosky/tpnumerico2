function [M A] = matElem(P,T)
  
  N = size(P,1);
  d = size(P,2);

  M = sparse(N,N);
  A = sparse(N,N);

  NT = size(T,1);

  for r=1:NT
    nodos = T(r,:);
    puntos = P(nodos,:);
    
    med_T = abs(det(H));
    H = [ones(1,d+1); puntos'];
    G = H\[zeros(1,d); eye(d)];
    Mloc = med_T*G*G'/prod(1:d);
    
    M(nodos,nodos) = M(nodos,nodos)+Mloc;
    
    Aloc = med_T/12*toeplitz([2 1 1]);
    A(nodos,nodos) = A(nodos,nodos)+Aloc;

  endfor
  
endfunction