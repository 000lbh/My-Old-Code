program mhwg;
var a,b,i,j,k,l,m,n,o,p,q:integer;
begin
    readln(a);
    q:=maxint;
    for i:=-6 to 6 do
    for j:=-6 to 6 do
    for k:=-6 to 6 do
    for l:=-6 to 6 do
    for m:=-6 to 6 do
    begin
        b:=i+7*j+49*k+343*l+2401*m;
        if (abs(i)+abs(j)+abs(k)+abs(l)+abs(m)<q) and (b=a) then q:=abs(i)+abs(j)+abs(k)+abs(l)+abs(m);

    end;
    writeln(q)
end.