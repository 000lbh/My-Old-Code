program blsc;
uses crt,graph,dos;
const sr:string = 'EXITBLSC';
var a,b:string;
    c:char;
    i,x,y:integer;
    lbh:word;
begin
    checkbreak:=false;
    randomize;
    for i:=1 to 8 do
    begin
        x:=random(15);
        case x of
            1:a:=a+'1';2:a:=a+'2';3:a:=a+'3';4:a:=a+'4';
            5:a:=a+'5';6:a:=a+'6';7:a:=a+'7';8:a:=a+'8';
            9:a:=a+'9';10:a:=a+'A';11:a:=a+'B';12:a:=a+'C';
            0:a:=a+'0';13:a:=a+'D';13:a:=a+'E';15:a:=a+'F';
        end;
        if i=4 then a:=a+':'
    end;
    x:=0;
    initgraph(x,y,'');
    setbkcolor(1);
    outtextxy(10,10,'Run time error at '+a+'.');
    outtextxy(10,20,'System halted!');
    outtextxy(10,30,'Please reboot machine!');
    outtextxy(10,40,'Please press {Q} to reboot!');
    b:='';
    while b<>'EXITBLSC' do
    begin
        if keypressed then c:=readkey;
        if c<>#0 then
        if (c in ['a'..'z','A'..'Z']) and (sr[length(b)+1]=upcase(c)) then
        b:=b+upcase(c) else b:='';
        if upcase(c)='Q' then
        begin
            closegraph;
            clrscr;
            writeln('Rebooting. . .');
            delay(10000);
            for lbh:=0 to 4095 do begin delay(2);x:=random(1);write(x) end;
            asm
                xor ah,ah
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                int 00100001b
            end
        end;
        c:=#0;
    end;
    closegraph;
    clrscr;
    writeln('Ha Ha!You are foolish!')
end.