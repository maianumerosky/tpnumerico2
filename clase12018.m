m = 1; k = 2; v = 2; Tf = 10;
h = [0.1;0.01;0.001];
J = Tf./h;
u_posta = @(t) exp(-t).*(cos(t)+sin(t));

%Forward

a = m./h.^2 + v./h;
b = k-2*m./h.^2-v./h;
c = m./h.^2;

for i=1:length(h)
  A{i} = diag(ones(J(i)-1,1)*a(i))+diag(ones(J(i)-2,1)*b(i),-1)+diag(ones(J(i)-3,1)*c(i),-2);
  d{i} = zeros(J(i)-1,1);
  d{i}(1) = -c(i)+b(i)^2/(a(i)+c(i));
  d{i}(2) = b(i)*c(i)/(a(i)+c(i));
  u{i} = A{i}\d{i};
  t{i} = [0:h(i):Tf];
  hold on
  u{i} = [1;1;u{i}];
  E{i} = max(abs(u_posta(t{i})'-u{i}));
  plot(h(i),E{i})
  %plot(t{i},u{i},'color','r')
  hold off
end



%Centradas
figure(2)
a1 = m./h.^2 + v./(2*h);
b1 = k-2*m./h.^2;
c1 = m./h.^2 - v./(2*h);

for i=1:length(h)
  A{i} = diag(ones(J(i)-1,1)*a1(i))+diag(ones(J(i)-2,1)*b1(i),-1)+diag(ones(J(i)-3,1)*c1(i),-2);
  d1{i} = zeros(J(i)-1,1);
  d1{i}(1) = -c1(i)+b1(i)^2/(a1(i)+c1(i));
  d1{i}(2) = b1(i)*c1(i)/(a1(i)+c1(i));
  u1{i} = A{i}\d1{i};
  t{i} = [0:h(i):Tf];
  hold on
  u1{i} = [-b1(i)/(a1(i)+c1(i));-b1(i)/(a1(i)+c1(i));u1{i}];
  %plot(t{i},u1{i},'color','b')
  E1{i} = max(abs(u_posta(t{i})'-u1{i}));
  plot(h(i),E1{i})
  hold off
end