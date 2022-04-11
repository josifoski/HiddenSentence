unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLProc, LazUTF8;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1;
  st, st2, stizlez : String;
  remarr : array [1..10000] of integer;
  i, j, dolzina , randchoise, conditionexit: integer;
  skokni : boolean;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  ComboBox1.ItemIndex:=4;
  conditionexit:=16;

end;
procedure CripplingText(st: String);
var i,j,k,m, randchoise, dolzina, spznaci, hiding, plus:Integer;
    remarr : array [1..10000] of integer;
    skokni, skokni1, skokni2, NajdenaBukva, NajdenaBukva1, NajdenaBukva2 : Boolean;
    charP, charP1, charP2 , znak, st2, LevZbor, DesenZbor: String;
    Zbor, Zbor2 : array [1..1000] of String;

begin
  hiding:=conditionexit;
  dolzina:=UTF8length(st);
  if st='' then st:=' ';
  i:=0;
  spznaci:=0;
  for j:=1 to dolzina do begin
   znak:=UTF8Copy(st, j, 1);
   if (znak=' ') or (znak=',') or (znak='.') or (znak=';') or (znak='!') or (znak='?') or (znak=':') or (znak='"') or (znak='„') or (znak='“') or (znak='(') or (znak=')') or (znak='[') or (znak=']') or (znak='{') or (znak='}') or (znak=#13) then spznaci:=spznaci+1;
  end;

  if ((hiding > 0) AND (hiding <=90))then begin
  repeat
    randchoise:=random(dolzina)+1;
    skokni:=false;
    charP:=UTF8Copy(st, randchoise, 1);
    if (charP=' ') or (charP=',') or (charP='.') or (charP=';') or (charP='!') or (charP='?') or (charP=':') or (charP='"') or (charP='„') or (charP='“') or (charP='(') or (charP=')') or (charP='[') or (charP=']') or (charP='{') or (charP='}') or (charP=#13) then begin
           skokni:=true;
    end;
    for j:=1 to i do
     if randchoise = remarr[j] then skokni:=true;
    if not(skokni) then begin
      i:=i+1;
      remarr[i]:=randchoise;
    end;
  until (i >= round(dolzina/(100/conditionexit))) or (i >= (dolzina - spznaci -1));
  end; // if hiding > 0  and hiding < 90

  if (hiding=91) OR (hiding=92) OR (hiding=93) then begin
      // skrsi ja recenicata na zborovi
      k:=1;
      st:=trim(st);
      for i:=1 to UTF8length(st)do begin
          if UTF8Copy(st, i, 1) <> ' ' then Zbor[k]:=Zbor[k]+UTF8Copy(st, i, 1)
                      else begin
                         k:=k+1;
                      end;   // if UTF8Copy
                      end;   // for i:=1 to UTF8


      for i:=1 to k do begin
        NajdenaBukva:=False;
        NajdenaBukva1:=False;
        NajdenaBukva2:=False;
        LevZbor:='';
        DesenZbor:='';
        if UTF8Length(Zbor[i]) mod 2 = 0 then plus:=0
                                         else plus:=1;
        for m:=1 to UTF8Length(Zbor[i]) do begin
          if (hiding=91) then charP:=UTF8Copy(Zbor[i], m, 1)
                         else charP:=UTF8Copy(Zbor[i], UTF8Length(Zbor[i])-m+1, 1);
          if (hiding=93) then begin
           if m <= ((UTF8Length(Zbor[i]) DIV 2) + plus) then begin
                                     charP1:=UTF8Copy(Zbor[i], m, 1);
                                     CharP2:=UTF8Copy(Zbor[i], UTF8Length(Zbor[i])-m+1, 1);
           if (charP1=' ') or (charP1=',') or (charP1='.') or (charP1=';') or (charP1='!') or (charP1='?') or (charP1=':') or (charP1='"') or (charP1='„') or (charP1='“') or (charP1='(') or (charP1=')') or (charP1='[') or (charP1=']') or (charP1='{') or (charP1='}') then
             skokni1:=true else skokni1:=false;
            if (charP2=' ') or (charP2=',') or (charP2='.') or (charP2=';') or (charP2='!') or (charP2='?') or (charP2=':') or (charP2='"') or (charP2='„') or (charP2='“') or (charP2='(') or (charP2=')') or (charP2='[') or (charP2=']') or (charP2='{') or (charP2='}') then
             skokni2:=true else skokni2:=false;
             if skokni1 then LevZbor:=LevZbor + charP1
                      else if NajdenaBukva1 then LevZbor:=LevZbor+'-'
                                           else begin
                                              LevZbor:=LevZbor+charP1;
                                              NajdenaBukva1:=True;
                                           end;
             if not(m = ((UTF8Length(Zbor[i]) DIV 2) + 1)) then
             if skokni2 then DesenZbor:=charP2 + DesenZbor
                       else if NajdenaBukva2 then DesenZbor:='-' + DesenZbor
                                            else begin
                                               DesenZbor:=charP2 + DesenZbor;
                                               NajdenaBukva2:=True;
                                            end;
           end; // if m <= round
          end; // if crippling=93

          if (charP=' ') or (charP=',') or (charP='.') or (charP=';') or (charP='!') or (charP='?') or (charP=':') or (charP='"') or (charP='„') or (charP='“') or (charP='(') or (charP=')') or (charP='[') or (charP=']') or (charP='{') or (charP='}') then
             skokni:=true
             else skokni:=false;

          if hiding=91 then begin
             if skokni then Zbor2[i]:=Zbor2[i] + charP
                       else if NajdenaBukva then Zbor2[i]:=Zbor2[i]+'-'
                                            else begin
                                               Zbor2[i]:=Zbor2[i]+charP;
                                               NajdenaBukva:=True;
                                            end;
          end; // if hiding=91
          if hiding=92 then begin
             if skokni then Zbor2[i]:=charP + Zbor2[i]
                       else if NajdenaBukva then Zbor2[i]:='-' + Zbor2[i]
                                            else begin
                                               Zbor2[i]:=charP + Zbor2[i];
                                               NajdenaBukva:=True;
                                            end;
          end; // if hiding=92
        end; // for m:=1 to
        if hiding=93 then Zbor2[i]:=LevZbor+DesenZbor;
       end; // for i:=1 to k
    end; // if (hiding=91) OR (hiding=92)

  st2:=st;

  if ((hiding > 0) AND (hiding <=90)) then
   for j:=1 to i do begin
             UTF8Delete(st2, remarr[j],1);
             UTF8Insert(AnsiToUTF8('-'), st2, remarr[j]);
       end;

  if (hiding=91) OR (hiding=92) OR (hiding=93) then begin
    st2:='';
    for i:=1 to k do begin
       st2:=st2+Zbor2[i]+'  ';
       Zbor[i]:='';
       Zbor2[i]:='';
      end; // for i
  end; // if (hiding=91


  if hiding > 0 then
                  stizlez:=st2
                else
                  stizlez:=st;

end;
procedure TForm1.Button1Click(Sender: TObject);
var charP : String;
    spznaci : Integer;
    st : String;
begin
 st:=Memo1.Text;
 CripplingText(st);
 Memo1.Text:=stizlez;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.text:='';
end;

procedure TForm1.Button3Click(Sender: TObject);
var stshow : String;
begin
  stshow:='Just paste sentence/text'+#13;
  stshow:=stshow + 'and click hide'+#13#13;
  stshow:=stshow+'josifoski@gmail.com'+#13;
  stshow:=stshow+'2013-december';
  ShowMessage(stshow);

end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
  0: conditionexit:=0;
  1: conditionexit:=1;
  2: conditionexit:=5;
  3: conditionexit:=10;
  4: conditionexit:=16;
  5: conditionexit:=22;
  6: conditionexit:=29;
  7: conditionexit:=35;
  8: conditionexit:=40;
  9: conditionexit:=45;
  10: conditionexit:=50;
  11: conditionexit:=60;
  12: conditionexit:=70;
  13: conditionexit:=80;
  14: conditionexit:=90;
  15: conditionexit:=91;
  16: conditionexit:=92;
  17: conditionexit:=93;
  end;
end;

end.

