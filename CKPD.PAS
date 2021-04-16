unit ckpd;
interface
{$i ckpd.int}
implementation
    uses crt;
    procedure ckeypressed;
    var c:char;
    begin
        if keypressed then c:=readkey
    end;
end.