uses mouse;
var a,b,c:word;
begin
    writeln(mouseinit,' ',mouseerr,' ',whyerr);
    initmouse;
    writeln(mouseinit,' ',mouseerr,' ',whyerr);
    showmouse;
    writeln(mouseinit,' ',mouseerr,' ',whyerr);
    hidemouse;
    writeln(mouseinit,' ',mouseerr,' ',whyerr);
    mousestate(a,b,c);
    writeln(mouseinit,' ',mouseerr,' ',whyerr,a,' ',b,' ',c);
    setmouse(8,8);
    writeln(mouseinit,' ',mouseerr,' ',whyerr);
end.