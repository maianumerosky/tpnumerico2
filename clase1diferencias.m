u = @(x) exp(x);
r = [-4:0.5:-1];
h = 10.^r;
Du = [];

for i = 1:length(h) 
    Du = [Du centradas(u,0,h(i))];
end

E = Du -1;

loglog(h,E)