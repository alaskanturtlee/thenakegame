unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type
    student = record
    name : string[30];
    surname: string[30];
    department : string[30];
    course : integer;
    end;

    ForArrName = array[1..16] of string;
    ForArr = file of student;
    TypeArr = array[1..17] of ForArr;

    lint = longint;
    mass=array[1..1000000] of student;
    Func=function(a,b:student):boolean;




  { TWindow1 }

  TWindow1 = class(TForm)
    Checking: TButton;
    Generate: TButton;
    ChooseFile: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SaveDialog1: TSaveDialog;
    OpenDialog2: TOpenDialog;
    procedure CheckingClick(Sender: TObject);
    procedure ChooseFileClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure GenerateClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure SortingClick(Sender: TObject);
  private

  public
     Array1:mass;
    N:Longword;

    ArrayOfFiles: TypeArr;
    ArrayOfFilesName: ForArrName;

    ArrayOfMerge: TypeArr;
    ArrayOfMergeNames: ForArrName;

    names:array [0..14] of string;
    surnames:array [0..14] of string;
    departments:array [0..4] of string;
    course:array [0..3] of integer;

   A, FileMerge1,FileMerge2,FileMerge3,FileMerge4,FileMerge5,FileMerge6,FileMerge7,FileMerge8,
    FinalFile,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16:file of student;

    nextparametre,parametre,nameA,nameB,nameC:string;
    studentA,studentB: student;

    j,k,kol:integer;


   temp, Size,first, last,RN,i:lint;


   fname1,fname2:string;
  end;

var
  Window1: TWindow1;

implementation

{$R *.lfm}

{ TWindow1 }
 procedure TWindow1.FormCreate(Sender: TObject);
begin
     Panel1.Caption:='Welcome';
    course[0]:=1;
    course[1]:=2;
    course[2]:=3;
    course[3]:=4;

    names[0]:= 'Brian';
    names[1]:= 'Colton';
    names[2]:= 'David';
    names[3]:= 'Anna';
    names[4]:= 'Vlad';
    names[5]:= 'Andrey';
    names[6]:= 'Mary';
    names[7]:= 'Duke';
    names[8]:= 'Bob';
    names[9]:= 'Marshall';
    names[10]:= 'Hannah';
    names[11]:= 'Tessa';
    names[12]:= 'Yu';
    names[13]:= 'Jack';
    names[14]:= 'Felix';

    surnames[0]:= 'Fely';
    surnames[1]:= 'Ornow';
    surnames[2]:= 'Orwell';
    surnames[3]:= 'Hulsk';
    surnames[4]:= 'Truman';
    surnames[5]:= 'Malan';
    surnames[6]:= 'Red';
    surnames[7]:= 'White';
    surnames[8]:= 'Orace';
    surnames[9]:= 'Aleron';
    surnames[10]:= 'Xone';
    surnames[11]:= 'Borde';
    surnames[12]:= 'Leob';
    surnames[13]:= 'Vettel';
    surnames[14]:= 'Petrov';

    departments[0]:= 'Web';
    departments[1]:= 'Game Development';
    departments[2]:= 'Mobile';
    departments[3]:= 'AI';
    departments[4]:= 'Languages';

     ArrayOfFiles[1]:= f1;
    ArrayOfFiles[2]:= f2;
    ArrayOfFiles[3]:= f3;
    ArrayOfFiles[4]:= f4;
    ArrayOfFiles[5]:= f5;
    ArrayOfFiles[6]:= f6;
    ArrayOfFiles[7]:= f7;
    ArrayOfFiles[8]:= f8;
    ArrayOfFiles[9]:= f9;
    ArrayOfFiles[10]:= f10;
    ArrayOfFiles[11]:= f11;
    ArrayOfFiles[12]:= f12;
    ArrayOfFiles[13]:= f13;
    ArrayOfFiles[14]:= f14;
    ArrayOfFiles[15]:= f15;
    ArrayOfFiles[16]:= f16;


    ArrayOfFilesName[1]:='C:\lazarus\lab9_FILES\1st.txt';
    ArrayOfFilesName[2]:='C:\lazarus\lab9_FILES\2nd.txt';
    ArrayOfFilesName[3]:='C:\lazarus\lab9_FILES\3rd.txt';
    ArrayOfFilesName[4]:='C:\lazarus\lab9_FILES\4th.txt';
    ArrayOfFilesName[5]:='C:\lazarus\lab9_FILES\5th.txt';
    ArrayOfFilesName[6]:='C:\lazarus\lab9_FILES\6th.txt';
    ArrayOfFilesName[7]:='C:\lazarus\lab9_FILES\7th.txt';
    ArrayOfFilesName[8]:='C:\lazarus\lab9_FILES\8th.txt';
    ArrayOfFilesName[9]:='C:\lazarus\lab9_FILES\9th.txt';
    ArrayOfFilesName[10]:='C:\lazarus\lab9_FILES\10th.txt';
    ArrayOfFilesName[11]:='C:\lazarus\lab9_FILES\11th.txt';
    ArrayOfFilesName[12]:='C:\lazarus\lab9_FILES\12th.txt';
    ArrayOfFilesName[13]:='C:\lazarus\lab9_FILES\13th.txt';
    ArrayOfFilesName[14]:='C:\lazarus\lab9_FILES\14th.txt';
    ArrayOfFilesName[15]:='C:\lazarus\lab9_FILES\15th.txt';
    ArrayOfFilesName[16]:='C:\lazarus\lab9_FILES\16th.txt';

        ArrayOfMerge[1]:=FileMerge1;
        ArrayOfMerge[2]:=FileMerge2;
        ArrayOfMerge[3]:=FileMerge3;
        ArrayOfMerge[4]:=FileMerge4;
        ArrayOfMerge[5]:=FileMerge5;
        ArrayOfMerge[6]:=FileMerge6;
        ArrayOfMerge[7]:=FileMerge7;
        ArrayOfMerge[8]:=FileMerge8;

        ArrayOfMergeNames[1]:='C:\lazarus\lab9_FILES\Merge1.txt';
        ArrayOfMergeNames[2]:='C:\lazarus\lab9_FILES\Merge2.txt';
        ArrayOfMergeNames[3]:='C:\lazarus\lab9_FILES\Merge3.txt';
        ArrayOfMergeNames[4]:='C:\lazarus\lab9_FILES\Merge4.txt';
        ArrayOfMergeNames[5]:='C:\lazarus\lab9_FILES\Merge5.txt';
        ArrayOfMergeNames[6]:='C:\lazarus\lab9_FILES\Merge6.txt';
        ArrayOfMergeNames[7]:='C:\lazarus\lab9_FILES\Merge7.txt';
        ArrayOfMergeNames[8]:='C:\lazarus\lab9_FILES\Merge8.txt';


end;


function Comp(a,b:student):boolean;
  begin
    Comp:=False;
    if a.course > b.course then begin
        Comp:=true
        end
        else begin
            if a.course = b.course then begin
                if a.department > b.department then
                        Comp:=true
                else begin
                    if a.department = b.department then begin
                        if a.surname > b.surname then
                            Comp:=true

                    end;
                end;
            end;
        end;




  end;

  function Comp2(a,b:student):boolean;
  begin
  Comp2:=False;
       if a.course < b.course then begin
            Comp2:=true
        end
        else begin
            if a.course = b.course then begin
                if a.department < b.department then
                        Comp2:=true
                else begin
                    if a.department = b.department then begin
                        if a.surname < b.surname then
                            Comp2:=true


                    end;
                end;
            end;
        end;


  end;

{процедура сортировки}
procedure quicksort(var Array1:mass;first, last:lint;Cmp,Cmp2:func);
var f, l: lint;count, mid:student;
begin
    f:=first;
    l:=last;
    mid:=Array1[(f+l) div 2]; {вычисление опорного элемента}
    repeat
        while Cmp(Array1[f],mid) do inc(f);
        while Cmp2(Array1[l],mid) do dec(l);
        if f<=l then {перестановка элементов}
        begin
            count:=Array1[f];
            Array1[f]:=Array1[l];
            Array1[l]:=count;
            inc(f);
            dec(l);
        end;
    until f>l;
    if first<l then quicksort(Array1,first, l,Cmp,Cmp2);
    if f<last then quicksort(Array1,f,last,Cmp,Cmp2);
end;

procedure WriteInFile(var Array1:mass;ArrayOfFiles:TypeArr;ArrayOfFilesName:ForArrName;temp:lint;j:integer);
var d:lint;
begin
    Assign(ArrayOfFiles[j],ArrayOfFilesName[j]);
    rewrite(ArrayOfFiles[j]);
    for d:= 1 to temp do begin
        write(ArrayOfFiles[j],Array1[d]);
        end;
    close(ArrayOfFiles[j]);
end;

procedure Merge(Array1,Array2:TypeArr;Array1N,Array2N:ForArrName;C:integer);
var studentA,studentB:student;
  i,j:lint;
begin
    i:=1;
    j:=1;
    while i < C do begin//for i:= 1 to 11 do begin
        Assign(Array1[i],Array1N[i]);
        Assign(Array1[i+1],Array1N[i+1]);
        if C = 2 then  Array2N[j]:='C:\lazarus\lab9_FILES\SortedFile.txt';
        Assign(Array2[j],Array2N[j]);
        Reset(Array1[i]);
        Reset(Array1[i+1]);
        rewrite(Array2[j]);

        if not(Eof(Array1[i])) then read(Array1[i],studentA);
        if not( EOf(Array1[i+1] )) then read(Array1[i+1],studentB);

        while (not(Eof(Array1[i]) ) and (not EOf(Array1[i+1] ))) do begin
            if Comp(studentA,studentB) then begin
                write(Array2[j],studentA);
                read(Array1[i],studentA);
            end
            else begin
                    write(Array2[j],studentB);
                    read(Array1[i+1],studentB);
            end;
        end;


        while not(EOF(Array1[i])) do begin
            write(Array2[j],studentA);
            read(Array1[i],studentA);
        end;

        while not(EOF(Array1[i+1])) do begin
            write(Array2[j],studentB);
            read(Array1[i+1],studentB);
        end;

                write(Array2[j],studentA);
                write(Array2[j],studentB);



        close(Array1[i]);
        close(Array1[i+1]);
        close(Array2[j]);

        erase(Array1[i]);
        erase(Array1[i+1]);
        inc(j);
        i:=i+2;
    end;


end;

procedure TWindow1.CheckingClick(Sender: TObject);
var
  cur,prev:student;   Check:boolean;
begin
    OpenDialog2.Execute;
    fname1:= OpenDialog2.FileName;
    Panel3.Caption:=fname1;
    Panel1.Caption:='Checking is on...';
    if fname1<> '' then begin
    Check:=True;
      AssignFile(A,fname1);
      reset(a);
      read(A,prev);
      while not(Eof(A)) do begin
            read(A,cur);
            if prev.course < cur.course then begin
               Check:=False;
               break;
            end;
            prev:=cur;
      end;
      CloseFile(A);
      Panel1.Caption:='Checking is completed';
      if Check then
         ShowMessage('File is sorted')
      else
          ShowMessage('File is not sorted');
      end;
end;

procedure TWindow1.ChooseFileClick(Sender: TObject);
var
 mainsize, d:lint;
begin

   if OpenDialog2.Execute then begin
     fname1:= OpenDialog2.FileName;
     Panel2.Caption:=fname1;


     AssignFile(A,fname1);
     reset(A);
     j:=1;
      d:=1;
      mainsize:=768000;

      Panel1.Caption:='Sorting a file...';

      ShowMessage('Sorting is on');
      while not EOF(A) do begin
          for d:= 1 to mainsize do read(A,Array1[d]);
           first:=1; last:=mainsize;
           quicksort(Array1,first,last,@Comp,@Comp2);
           WriteInFile(Array1,ArrayOfFiles,ArrayOfFilesName,mainsize,j); inc(j)
      end;
      closefile(A);

      Merge(ArrayOfFiles,ArrayOfMerge,ArrayOfFilesName,ArrayOfMergeNames,16);
      Merge(ArrayOfMerge,ArrayOfFiles,ArrayOfMergeNames,ArrayOfFilesName,8);
      Merge(ArrayOfFiles,ArrayOfMerge,ArrayOfFilesName,ArrayOfMergeNames,4);
      Merge(ArrayOfMerge,ArrayOfFiles,ArrayOfMergeNames,ArrayOfFilesName,2);

      ShowMessage('Sorting is completed');

      Panel1.Caption:='Sorting is completed';
   end;


end;

procedure TWindow1.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
     Close;
end;


procedure TWindow1.GenerateClick(Sender: TObject);
  var
    r:lint;
begin
   if SaveDialog1.Execute then begin
     fname2:= SaveDialog1.FileName;
    // Panel1.Caption:=fname2;
 //    Label2.Caption:=fname2;


      Randomize;

      AssignFile(f2,fname2);
      rewrite(f2);

      size:= 12288000;

      Panel1.Caption:='Generating a file...';
      ShowMessage('Please wait a minute');
      for r := 1 to size do begin

          j := Random(15);
          studentA.name := names[j];
          j := Random(15);
          studentA.surname := surnames[j];
          j := Random(4);
          studentA.department := departments[j];
          j:= Random(3);
          studentA.course:=j;


          write(f2,studentA);

      end;
      Panel1.Caption:='Generating is completed';
      closefile(f2);
    end;


end;

procedure TWindow1.Label2Click(Sender: TObject);
begin

end;

procedure TWindow1.SortingClick(Sender: TObject);
begin

end;

end.

