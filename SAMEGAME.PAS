uses crt,graph,ckpd;
var g1,g2:integer;
    wx,wy:^longint;
    score:longint;
    flag:boolean;
    c:char;
    a:array[1..60,1..20] of 0..3;
    f:array[1..60,1..20] of boolean;
procedure cls;
begin
    textbackground(0);
    clrscr;
    window(11,2,70,23);
    textbackground(7);
    clrscr
end;
procedure dt(x,y,nox,noy:integer);
var tof:boolean;
    noxx,noyy:integer;
begin
    if (nox=0) and (noy=0) then
    if (a[x,y]=a[x+1,y]) or (a[x,y]=a[x-1,y]) or (a[x,y]=a[x,y-1]) or (a[x,y]=a[x,y+1]) then
    tof:=true;
    if (nox<>0) and (noy=0) then
    if (a[x,y]=a[x-nox,y]) or (a[x,y]=a[x,y+1]) or (a[x,y]=a[x,y-1]) then
    tof:=true;
    if (nox=0) and(noy<>0) then              
    if (a[x,y-noy]=a[x,y]) or (a[x,y]=a[x-1,y]) or (a[x+1,y]=a[x,y]) then
    tof:=true;
    if (nox<>0) and (noy<>0) then
    if (a[x,y]=a[x-nox,y]) and (a[x,y]=a[x,y-noy]) then
    tof:=true;
    if tof then a[x,y]:=0
end;
procedure prgmend;
var a,b:integer;
begin
    window(1,1,79,25);
    textcolor(7);
    textbackground(0);
    clrscr;
    writeln('Waiting. . .');
    delay(1000);
    clrscr;
    initgraph(g1,g2,'EGAVGA.BGI');
    setcolor(2);
    setbkcolor(12);
    circle(getmaxx div 2,getmaxy div 2,50);
    line(getmaxx div 2-40,getmaxy div 2-20,getmaxx div 2-10,getmaxy div 2-20);
    line(getmaxx div 2+10,getmaxy div 2-20,getmaxx div 2+40,getmaxy div 2-20);
    line(getmaxx div 2-20,getmaxy div 2+20,getmaxx div 2+20,getmaxy div 2+20);
    outtextxy(getmaxx div 2-12,getmaxy div 2,'Bye!');
    delay(2000);
    closegraph;
    clrscr;
    writeln('Program exited.')
end;
procedure sc;
var r,i,j:integer;
begin
    randomize;
    for i:=1 to 60 do for j:=1 to 20 do begin r:=random(3)+1;a[i,j]:=r end
end;
procedure opt(z,b:integer);
var i,j:byte;
begin
    clrscr;
    textcolor(5);
    writeln('Score:',score);
    for i:=1 to 60 do
    for j:=1 to 20 do
    case a[i,j] of
    0:write(' ');
    1:begin textcolor(1);write('Û') end;
    2:begin textcolor(2);write('Û') end;
    3:begin textcolor(14);write('Û') end end;
    gotoxy(z,b)
end;
begin
    cls;
    wx:=nil;
    wy:=nil;
    score:=100;
    sc;
    opt(1,2);
    flag:=true;
    write('*');
    gotoxy(1,2);
    while flag do
    begin
        fillchar(f,sizeof(f),false);
        if keypressed then
        begin
            opt(wherex,wherey);
            c:=readkey;
            case upcase(c) of
                'W':if wherey>2 then gotoxy(wherex,wherey-1);
                'A':gotoxy(wherex-1,wherey);
                'S':if wherey<21 then gotoxy(wherex,wherey+1);
                'D':gotoxy(wherex+1,wherey);
                ' ':begin dt(wherex,wherey,0,0);opt(wherex,wherey) end;
                'Q':begin prgmend;halt end
            end;
            new(wx);new(wy);
            wx^:=wherex;wy^:=wherey;
            write('*');
            gotoxy(wx^,wy^);
            wx:=nil;wy:=nil
        end;
    end;
end.