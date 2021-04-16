program readfc(input,output,lnhf);
uses crt;
var c:char;
begin
    c:=#0;
    repeat
         if keypressed then begin c:=readkey;
         if c=#0 then
         begin
             write('You pressed function key:');
             c:=readkey;
             CASE c of
                 ';':writeln('{F1}');
                 else writeln(c)
             end;
         end else if c=#13 then writeln('You pressed key:{enter}')
         else if c=#8 then writeln('You pressed key:{Backspace}')
         else if c=#27 then writeln('You pressed key:{ESC}')
         else writeln('You pressed key:',c) end
    until upcase(c)='Q'
end.