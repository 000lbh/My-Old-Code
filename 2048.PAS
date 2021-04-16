program 2048(input,output,lbh);
var a:array[1..4,1..4];
    i,j,k,t,f:word;
    tof,flag:boolean;
procedure rdmfk;
var i,j,t:integer;
begin
    for i:=1 to 4 do
    for j:=1 to 4 do
    if (random(16-i*j)=0) and (a[i,j]=0) then a[i,j]:=2
end;
procedure downcase;
var i,j,t,k:word;
begin
    for i:=1 to 4 do
    for j:=1 to 4 do
    begin
        if j<>4 then
        for k:=j to 3 do
        if a[i,j+1]=0 then
        begin
            t:=a[i,j];a[i,j]:=a[i,j+1];a[i,j+1]:=t
        end else if a[i,j]=a[i,j+1] then
        begin
            a[i,j+1]:=a[i,j+1]+a[i,j];
            a[i,j]:=0
        end else break
    end;
end;
begin

end.