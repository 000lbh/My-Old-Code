program mouse;
uses crt,dos;
var x,y,z,bu:word;
begin
    x:=0;
    y:=0;
    z:=0;
    bu:=0;
    asm
        mov ax,0
        int 33h
    end;
    while (not keypressed) and (bu<>1) do
    begin
        delay(500);
        asm
            mov ax,3
            int 33h
            mov bu,bx
            mov x,cx
            mov y,dx
        end;
        writeln(bu,' ',x div 8+1,' ',y div 8+1,' ')
    end;
end.