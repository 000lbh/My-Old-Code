uses crt;
label loc0;
var bu,x,y,xx,yy,x1,y1,wx,wy:word;
    c:char;
begin
    checkbreak:=false;
    wx:=wherex;wy:=wherey;
    gotoxy(1,1);
    clreol;
    write('Message will show here;Press {Esc} to exit;{Enter} to clear screen');
    asm
        mov ax,0
        int 33h
        mov ax,1
        int 33h
    end;
loc0:while c<>#27 do
    begin
        asm
            mov ax,3
            int 33h
            mov bu,bx
            mov x,cx
            mov y,dx
        end;
        if bu=1 then begin xx:=x div 8+1;yy:=y div 8+1;gotoxy(xx,yy) end;
        if keypressed then begin c:=readkey;
        if (c in [#32..#126]) and ((xx<>80) or (yy<>25))then write(c);
        if c=#0 then begin c:=readkey;x1:=xx;y1:=yy;
        case c of
            'H':begin if yy<>1 then dec(yy);gotoxy(xx,yy) end;
            'P':begin if yy<>25 then inc(yy);gotoxy(xx,yy) end;
            'K':begin if xx<>1 then dec(xx);gotoxy(xx,yy) end;
            'M':begin if xx<>80 then inc(xx);gotoxy(xx,yy) end;
            else begin gotoxy(1,1);clreol;write('Function key!');gotoxy(x1,y1) end
        end;end;
        x1:=xx;y1:=yy;
        if (xx=80) and (yy=25) then begin gotoxy(1,1);clreol;write('Can not write here!');
        end;
        if c=#13 then clrscr;
        gotoxy(x1,y1)
        end;
    end;
    gotoxy(1,1);clreol;
    write('Do you want to exit?  [n]  [y]');
    c:=#0;x:=10;y:=10;
    while 1=1 do
    begin
        if keypressed then c:=upcase(readkey);
        asm
            mov ax,3
            int 33h
            mov bu,bx
            mov x,cx
            mov y,dx
        end;
        if (c='N') or ((x div 8+1=24) and (y div 8+1=1) and (bu=1)) then begin gotoxy(1,1);clreol;write('Continued!');
        goto loc0 end;
        if (c='Y') or ((x div 8+1=29) and (y div 8+1=1) and (bu=1)) then break
    end;
    gotoxy(1,1);clreol;
    writeln('Bye!    ^_^');
    gotoxy(wx,wy)
end.