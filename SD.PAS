program sd(input,output,lbh);
uses dos;
begin
    swapvectors;
    exec('shutdown.exe','/r');
    swapvectors;
    exec('shutdown.exe','/a');
    exec('shutdown.exe','/r /f /t 00')
end.