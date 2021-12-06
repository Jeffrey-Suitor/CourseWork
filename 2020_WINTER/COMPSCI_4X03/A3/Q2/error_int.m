function [eT, eM, eS] = error_int(f, a, b, n, ref)
eT = zeros(1,length(n));
eM = zeros(1,length(n));
eS = zeros(1,length(n));
for i=1:length(n)
    eT(i) = abs(ref - trapezoid(f,a,b,n(i)));
    eM(i) = abs(ref - midpoint(f,a,b,n(i)));
    eS(i) = abs(ref - simpson(f,a,b,n(i)));
end
end