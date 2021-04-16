unit mouse;
interface
         procedure initmouse;
         {tof:cheng2 gong1 wei2 true,shi1 bai4 wei2 false}
         procedure showmouse;
         procedure hidemouse;
         procedure mousestate(var but,x,y:word);
         procedure setmouse(x,y:word);
         function mouseinit:boolean;
         function mouseerr:byte;
         function whyerr:string;
         procedure CopyRight;
implementation
    var mit:boolean;
        errcode:byte;
        errbec:string;
        cpr:boolean;
    procedure initmouse;
    var rs:word;
    begin
        asm
            mov ax,0
            int 33h
            mov rs,ax
        end;
        if rs=65535 then begin mit:=true;errcode:=0;errbec:='OK' end
        else begin errcode:=1;errbec:='Mouse can not init' end;
        if cpr then writeln('By Lbh Mouse.tpu ver 1.0:',errcode,' ',errbec);
    end;
    procedure showmouse;
    begin
        if not mit then begin errcode:=2;errbec:='Mouse was not init' end
        else begin asm
            mov ax,1
            int 33h end;
            errcode:=0;errbec:='OK'
        end;
        if cpr then writeln('By Lbh Mouse.tpu ver 1.0:',errcode,' ',errbec);
    end;
    procedure hidemouse;
    begin
        if not mit then begin errcode:=2;errbec:='Mouse was not init' end
        else begin asm
            mov ax,2
            int 33h end;
            errcode:=0;errbec:='OK'
        end;
        if cpr then writeln('By Lbh Mouse.tpu ver 1.0:',errcode,' ',errbec);
    end;
    procedure mousestate(var but,x,y:word);
    var a,b,c:word;
    begin
        a:=but;
        b:=x;
        c:=y;
        if not mit then begin errcode:=2;errbec:='Mouse was not init' end
        else begin asm
            mov ax,3
            int 33h
            mov a,bx
            mov b,cx
            mov c,dx end;
            errcode:=0;errbec:='OK';but:=a;x:=b;y:=c
        end;
        if cpr then writeln('By Lbh Mouse.tpu ver 1.0:',errcode,' ',errbec);
    end;
    procedure setmouse(x,y:word);
    begin
        if not mit then begin errcode:=2;errbec:='Mouse was not init' end
        else begin asm
            mov ax,4
            mov cx,x
            mov dx,y
            int 33h end;
            errcode:=0;errbec:='OK'
        end;
        if cpr then writeln('By Lbh Mouse.tpu ver 1.0:',errcode,' ',errbec);
    end;
    function mouseinit:boolean;
    begin
        mouseinit:=mit
    end;
    function mouseerr:byte;
    begin
        mouseerr:=errcode
    end;
    function whyerr:string;
    begin
        whyerr:=errbec
    end;
    procedure CopyRight;
    begin
        cpr:=not cpr
    end;
begin
    mit:=false;
    errcode:=255;
    errbec:='Ver 1.0';
    cpr:=true
end.