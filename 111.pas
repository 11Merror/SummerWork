uses crt, graph;
var
a: array [1..32,1..42] of integer; //field, 0 = alive, 1 = dead, 2 = unused frame
a1: array [1..32,1..42] of integer;
b: array [1..10] of integer; //randomizer with 25% for alive cell
DriverVar,ModeVar,i,j,x,eterrep:integer;

Begin //start of the programm
eterrep:=0; //eternal update of screen
randomize;
DriverVar := Detect;
InitGraph(DriverVar, ModeVar, '');

for i:=1 to 9 do //making 10% randomize
b[i]:=1;
b[10]:=0;

for i:=1 to 39 do Line(i*32,1,i*32,960); // cells creating
for i:=1 to 29 do Line(1,i*32,1280,i*32);

writeln('Randomfilling your field...');  //start of field filling

for j:=2 to 31 do  //the process of randomfilling
 Begin
 for i:=2 to 41 do
  Begin
  a[j,i]:=b[Random(10)+1];
  end;
 end;

for i:=1 to 32 do //i dont know how to describe
  Begin
  for j:=1 to 42 do
  Begin
  a1[i,j]:=a[i,j];
  end;
 end;

for i:=1 to 32 do //frame making
 Begin
  for j:=1 to 42 do
   Begin
   if (i=1) or (j=1) or (i=32) or (j=42) then a[i,j]:=2;
   end;
 end;

for j:=2 to 31 do //field-print
 Begin
 for i:=2 to 41 do
  Begin
  if a[j,i] = 0 then rectangle((i-2)*32+8,(j-2)*32+8,(i-2)*32+24,(j-2)*32+24);
  end;
 end;



//for j:=1 to 32 do //print-the-field function
 //Begin
 //Writeln;
 //for i:=1 to 42 do
  //Begin
  //write(a[j,i],' ');
  //end;
 //end;
//write('Field was printed!');

delay(100); //delay till field update

while eterrep=0 do //eternal update of screen
Begin

for i:=2 to 31 do //field update
 Begin
 for j:=2 to 41 do
  Begin
  x:=0;
  if a[i-1,j-1]=0 then Inc(x); //neibourghs check
  if a[i-1,j]=0 then Inc(x);
  if a[i-1,j+1]=0 then Inc(x);
  if a[i,j-1]=0 then Inc(x);
  if a[i,j+1]=0 then Inc(x);
  if a[i+1,j-1]=0 then Inc(x);
  if a[i+1,j]=0 then Inc(x);
  if a[i+1,j+1]=0 then Inc(x);

  if x<2 then a1[i,j]:=1;            //rule check
  if (x=2) or (x=3) then a1[i,j]:=0;
  if x>3 then a1[i,j]:=1;
  end;
 end;

 for i:=1 to 32 do //i dont know how to describe
  Begin
  for j:=1 to 42 do
  Begin
  a[i,j]:=a1[i,j];
  end;
 end;

 for j:=2 to 31 do
 Begin
 for i:=2 to 41 do
  Begin
  if a[j,i] = 0 then Begin SetColor(White); rectangle((i-2)*32+8,(j-2)*32+8,(i-2)*32+24,(j-2)*32+24); end
  else Begin SetColor(Black); rectangle((i-2)*32+8,(j-2)*32+8,(i-2)*32+24,(j-2)*32+24); end;
  end;
 end;

 delay(100);

end; //end of eternal update

end. //end of the programm
