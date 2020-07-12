unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Tabs, Vcl.StdCtrls, DateUtils, ShellApi, IniFiles,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    Общение: TTabSheet;
    Учение: TTabSheet;
    Memo1: TMemo;
    Teach_Answer: TLabeledEdit;
    Memo2: TMemo;
    User_Enter_Text: TEdit;
    Say: TButton;
    Teach_check: TButton;
    Teach_Add: TButton;
    Настройки: TTabSheet;
    User_Name: TLabeledEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Robot_Name: TLabeledEdit;
    Save_Options: TButton;
    Memo3: TMemo;
    Teach_Words: TLabeledEdit;
    Clear_Memo2: TButton;
    Change_Words: TButton;
    Insert_Robot_Name_Code: TButton;
    Insert_User_Name_Code: TButton;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    CheckBox1: TCheckBox;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure SayClick(Sender: TObject);
    procedure Teach_checkClick(Sender: TObject);
    procedure Clear_Memo2Click(Sender: TObject);
    procedure Teach_AddClick(Sender: TObject);
    procedure Change_WordsClick(Sender: TObject);
    procedure Insert_User_Name_CodeClick(Sender: TObject);
    procedure Insert_Robot_Name_CodeClick(Sender: TObject);
    procedure Save_OptionsClick(Sender: TObject);
  private
  procedure Robot_Say(Say: String; i: integer);
  procedure User_Say(Say: String; i: integer);
  procedure FindAnswer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  IniFile: TIniFile;

implementation

{$R *.dfm}
type Words_Type = array of String;

const Robot_Name_Code = '#ROBOT_NAME#';
const User_Name_Code = '#USER_NAME#';
//  \/:*?"<>|
const sign_1 = '#sign_1#';  //  \
const sign_2 = '#sign_2#';  //  /
const sign_3 = '#sign_3#';  //  :
const sign_4 = '#sign_4#';  //  *
const sign_5 = '#sign_5#';  //  ?
const sign_6 = '#sign_6#';  //  "
const sign_7 = '#sign_7#';  //  <
const sign_8 = '#sign_8#';  //  >
const sign_9 = '#sign_9#';  //  |
//  1-\ 2-/ 3-: 4-* 5-? 6-" 7-< 8-> 9-|

var AppPath, AppName: String;
    File_Answer: TextFile;
    Path: String;

function GetMonth: String;
begin
  Result := DateToStr(Date);
  Delete(Result, 1, Pos('.', Result));
end;

procedure SaveData;
begin
  Path := ExtractFilePath(Application.ExeName) + 'Data' + '\';
  if DirectoryExists(Path) = FALSE then
    CreateDir(Path);
  if DirectoryExists(Path + GetMonth) = FALSE then
    CreateDir(Path + GetMonth);
  if FileExists(Path + GetMonth + '\' + DateToStr(Date)) then
    begin
      //Memo1.Lines.LoadFromFile(Path + GetMonth + '\' + DateToStr(Date));
      //ListBox1.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + '\' + File_Today_Name);
      //SoundsChoose.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + '\' + File_Name);
      //SoundsChooseForAlarmOnce.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + '\' + File_Name);
    end
    else
    begin
      AssignFile(File_Answer, Path + GetMonth + '\' + DateToStr(Date));
      ReWrite(File_Answer);
      CloseFile(File_Answer);
    end;
end;

function ReplaseText(Text, Substr, Replace_To: String): String;
var S: String;
    insert_index: integer;
begin
  S := Text;
  insert_index := Pos(Substr, S);
  Delete(S, insert_index, Length(Substr));
  Insert(Replace_To, S, insert_index);
  Result := S;
end;

procedure TForm1.Robot_Say(Say: String; i: integer);
begin
  if Pos(sign_1, Say) <> 0 then
    begin
      Say := ReplaseText(Say, sign_1, '\');
    end;
  if Pos(sign_2, Say) <> 0 then
    begin
      Say := ReplaseText(Say, sign_2, '/');
    end;
  if Pos(sign_3, Say) <> 0 then
    begin
      Say := ReplaseText(Say, sign_3, ':');
    end;
  if Pos(sign_4, Say) <> 0 then
    begin
      Say := ReplaseText(Say, sign_4, '*');
    end;
  if Pos(sign_5, Say) <> 0 then
    begin
      Say := ReplaseText(Say, sign_5, '?');
    end;
  if Pos(sign_6, Say) <> 0 then
    begin
      Say := ReplaseText(Say, sign_6, '"');
    end;
  if Pos(sign_7, Say) <> 0 then
    begin
      Say := ReplaseText(Say, sign_7, '<');
    end;
  if Pos(sign_8, Say) <> 0 then
    begin
      Say := ReplaseText(Say, sign_8, '>');
    end;
  if Pos(sign_9, Say) <> 0 then
    begin
      Say := ReplaseText(Say, sign_9, '|');
    end;

  if Pos(Robot_Name_Code, Say) <> 0 then
    begin
      Say := ReplaseText(Say, Robot_Name_Code, Robot_Name.Text);
    end;
  if Pos(User_Name_Code, Say) <> 0 then
    begin
      Say := ReplaseText(Say, User_Name_Code, User_Name.Text);
    end;

  case i of
  1:
    begin
      Memo1.Lines.Add(' - ' + Trim(Robot_Name.Text) + ' говорит: ' + Trim(Say));
      exit;
    end;
  2:
    begin
      Memo2.Lines.Add(' - ' + Trim(Robot_Name.Text) + ' говорит: ' + Trim(Say));
      exit;
    end;
  end;
end;

procedure TForm1.User_Say(Say: String; i: integer);
begin
  case i of
  1:
    begin
      Memo1.Lines.Add(' - ' + Trim(User_Name.Text) + ' говорит: ' + Trim(Say));
      exit;
    end;
  2:
    begin
      Memo2.Lines.Add(' - ' + Trim(User_Name.Text) + ' говорит: ' + Trim(Say));
      exit;
    end;
  end;

end;

function FillWordsArray(Say: String): Words_Type;
var i: integer;
    Words: Words_Type;
begin
  Trim(Say);

  if Pos('\', Say) <> 0 then  //  1-\ 2-/ 3-: 4-* 5-? 6-" 7-< 8-> 9-|
    Say := ReplaseText(Say, '\', sign_1);
  if Pos('/', Say) <> 0 then
    Say := ReplaseText(Say, '/', sign_2);
  if Pos(':', Say) <> 0 then
    Say := ReplaseText(Say, ':', sign_3);
  if Pos('*', Say) <> 0 then
    Say := ReplaseText(Say, '*', sign_4);
  if Pos('?', Say) <> 0 then
    Say := ReplaseText(Say, '?', sign_5);
  if Pos('"', Say) <> 0 then
    Say := ReplaseText(Say, '"', sign_6);
  if Pos('<', Say) <> 0 then
    Say := ReplaseText(Say, '<', sign_7);
  if Pos('>', Say) <> 0 then
    Say := ReplaseText(Say, '>', sign_8);
  if Pos('|', Say) <> 0 then
    Say := ReplaseText(Say, '|', sign_9);

  while Length(Say) <> 0 do
  begin
    SetLength(Words, Length(Words) + 1);
    if Pos(' ', Say) = 0 then
      Words[Length(Words) - 1] := Copy(Say, 1, Length(Say))
    else
      Words[Length(Words) - 1] := Copy(Say, 1, Pos(' ', Say) - 1);
    if Pos(' ', Say) = 0 then
      Delete(Say, 1, Length(Say))
    else
      Delete(Say, 1, Pos(' ', Say));
  end;
  Result := Words;
end;

function CreatePathFromWords(Words: Words_Type): String;
var Path: String;
    i: integer;
begin
  for I := 0 to High(Words) do
    Path := Path + Words[i] + '\';
  Result := Path;
end;

procedure TForm1.Change_WordsClick(Sender: TObject);
var Words: Words_Type;
    Words_Path: String;
begin
  Words := FillWordsArray(Teach_Words.Text);
  Words_Path := CreatePathFromWords(Words);
  Path := ExtractFilePath(Application.ExeName) + 'Data' + '\';
  if FileExists(Path + Words_Path + 'default.txt') then
    begin
        ShellExecute(0, 'Open', PChar(Path + Words_Path + 'default.txt'), '', nil, 1);
    end
  else
  ShowMessage('Нужный файл не был найден');
end;

procedure TForm1.Clear_Memo2Click(Sender: TObject);
begin
  Memo2.Clear;
end;

procedure TForm1.FindAnswer;
var Words: Words_Type;
    Words_Path, Words_Path_Relative, Answer: String;
    i: integer;
begin
  Words := FillWordsArray(User_Enter_Text.Text);
  Words_Path := CreatePathFromWords(Words);
  Path := ExtractFilePath(Application.ExeName) + 'Data' + '\';
  if DirectoryExists(Path) = FALSE then
    CreateDir(Path);
  if FileExists(Path + Words_Path + 'default.txt') then
    begin
      Memo3.Lines.LoadFromFile(Path + Words_Path + 'default.txt');
      if Memo3.Lines.Count = 0 then
        begin
          PageControl1.TabIndex := 1;
          Teach_Words.Text := Trim(User_Enter_Text.Text);
        end
      else
      begin
        User_Say(User_Enter_Text.Text, 1);
        Robot_Say(Memo3.Lines[Random(Memo3.Lines.Count)], 1);
      end;
    end
    else
    begin
      for I := 0 to High(Words) do
      begin
      Words_Path_Relative := Words_Path_Relative + Words[i] + '\';
        if DirectoryExists(Path + Words_Path_Relative) = FALSE then
          CreateDir(Path + Words_Path_Relative);
      end;
      AssignFile(File_Answer, Path + Words_Path + 'default.txt');
      ReWrite(File_Answer);
      CloseFile(File_Answer);

      Memo3.Lines.LoadFromFile(Path + Words_Path + 'default.txt');
      if Memo3.Lines.Count = 0 then
        begin
          PageControl1.TabIndex := 1;
          Teach_Words.Text := Trim(User_Enter_Text.Text);
          Teach_Answer.Clear;
          Teach_Answer.SetFocus;
        end
      else
      begin
        User_Say(User_Enter_Text.Text, 1);
        Robot_Say(Memo3.Lines[Random(Memo3.Lines.Count)], 1);
      end;
    end;
end;

procedure TForm1.Save_OptionsClick(Sender: TObject);
begin
  IniFile.WriteString('DATA','USER NAME', User_Name.Text);
  IniFile.WriteString('DATA','ROBOT NAME', Robot_Name.Text);

  if CheckBox1.Checked then
    IniFile.WriteBool('OPTIONS','Hello', TRUE)
  else
    IniFile.WriteBool('OPTIONS','Hello', FALSE);

  if CheckBox2.Checked then
    IniFile.WriteBool('OPTIONS','Clear', TRUE)
  else
    IniFile.WriteBool('OPTIONS','Clear', FALSE);

  if CheckBox3.Checked then
    IniFile.WriteBool('OPTIONS','Clear 2', TRUE)
  else
    IniFile.WriteBool('OPTIONS','Clear 2', FALSE);
end;

procedure TForm1.SayClick(Sender: TObject);
var Words: Words_Type;
begin
  if Length(Trim(User_Enter_Text.Text)) <> 0 then
    FindAnswer;
  User_Enter_Text.Clear;
end;

procedure TForm1.Teach_AddClick(Sender: TObject);
var Words: Words_Type;
    Words_Path, Words_Path_Relative: String;
    i: integer;
begin
  if (Length(Trim(Teach_Words.Text)) <> 0) and (Length(Trim(Teach_Answer.Text)) <> 0) then
  begin
    Words := FillWordsArray(Teach_Words.Text);
    Words_Path := CreatePathFromWords(Words);
    Path := ExtractFilePath(Application.ExeName) + 'Data' + '\';
    if DirectoryExists(Path) = FALSE then
      CreateDir(Path);
    if FileExists(Path + Words_Path + 'default.txt') then
      begin
        Memo3.Lines.LoadFromFile(Path + Words_Path + 'default.txt');
        if Memo3.Lines.IndexOf(Trim(Teach_Answer.Text)) < 0 then
        begin
          Memo3.Lines.Add(Trim(Teach_Answer.Text));
          Memo3.Lines.SaveToFile(Path + Words_Path + 'default.txt');
          Memo2.Lines.Add('**** ЗАПИСЬ [' + Trim(Teach_Answer.Text) + '] УСПЕШНО ДОБАВЛЕНА ****');
        end
        else
          Memo2.Lines.Add('**** ЗАПИСЬ [' + Trim(Teach_Answer.Text) + '] УЖЕ СУЩЕСТВУЕТ ****');
      end
      else
      begin
        for I := 0 to High(Words) do
        begin
          Words_Path_Relative := Words_Path_Relative + Words[i] + '\';
          if DirectoryExists(Path + Words_Path_Relative) = FALSE then
            CreateDir(Path + Words_Path_Relative);
        end;
        AssignFile(File_Answer, Path + Words_Path + 'default.txt');
        ReWrite(File_Answer);
        CloseFile(File_Answer);

        Memo3.Lines.LoadFromFile(Path + Words_Path + 'default.txt');
        if Memo3.Lines.IndexOf(Trim(Teach_Answer.Text)) < 0 then
        begin
          Memo3.Lines.Add(Trim(Teach_Answer.Text));
          Memo3.Lines.SaveToFile(Path + Words_Path + 'default.txt');
          Memo2.Lines.Add('**** ЗАПИСЬ [' + Trim(Teach_Answer.Text) + '] УСПЕШНО ДОБАВЛЕНА ****');
        end
        else
          Memo2.Lines.Add('**** ЗАПИСЬ [' + Trim(Teach_Answer.Text) + '] УЖЕ СУЩЕСТВУЕТ ****');
      end;
      if CheckBox2.Checked then
      begin
        Teach_Words.Clear;
        Teach_Answer.Clear;
      end;

      if CheckBox3.Checked then
      begin
        Teach_Answer.Clear;
      end;
    end
    else
  ShowMessage('Одно из полей пустое!');
end;

procedure TForm1.Teach_checkClick(Sender: TObject);
begin
  if (Length(Trim(Teach_Words.Text)) <> 0) and (Length(Trim(Teach_Answer.Text)) <> 0) then
  begin
    User_Say(Trim(Teach_Words.Text), 2);
    Robot_Say(Trim(Teach_Answer.Text), 2);
  end
  else
  ShowMessage('Одно из полей пустое!');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\' + 'Options.ini');
  User_Name.Text := IniFile.ReadString('DATA','USER NAME', 'Хозяин');
  Robot_Name.Text := IniFile.ReadString('DATA','ROBOT NAME', 'Джек');
  CheckBox1.Checked := IniFile.ReadBool('OPTIONS','Hello', FALSE);
  CheckBox2.Checked := IniFile.ReadBool('OPTIONS','Clear', FALSE);
  CheckBox3.Checked := IniFile.ReadBool('OPTIONS','Clear 2', TRUE);

  PageControl1.TabIndex := 0;
  //Memo1.Lines.Add('Привет ' + User_Name.Text + ', тебя приветствует робот ' + Robot_Name.Text + '! Я обещаю, что буду прилежно учиться всему, что ты сочтёшь для меня полезным! Ну, давай, я весь в внимании ;)');
  if not CheckBox1.Checked then
  Robot_Say('Привет ' + User_Name.Text + ', тебя приветствует робот ' + Robot_Name.Text + '! Я обещаю, что буду прилежно учиться всему, что ты сочтёшь для меня полезным! Ну, давай пообщаемся ;)', 1);
  Label1.Caption := 'Программа искусственного интеллекта "' + Form1.Caption + '"' + #13#10 +   //' + #13#10 + '
               #13#10 + #13#10 + 'Авторское право © 2012 Кучеров Р. М.' + #13#10 +
              'Надеюсь, большинство прав защищено.' + #13#10 + #13#10 +
              'Любую критику, вопросы, предложения - ' + #13#10 +
              'с радостью почитаю по адресу quoe@mail.ru'
end;

procedure TForm1.Insert_Robot_Name_CodeClick(Sender: TObject);
begin
  Teach_Answer.Text := Teach_Answer.Text + Robot_Name_Code + ' ';
end;

procedure TForm1.Insert_User_Name_CodeClick(Sender: TObject);
begin
  Teach_Answer.Text := Teach_Answer.Text + User_Name_Code + ' ';
end;

end.
