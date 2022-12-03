unit MainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  ActnList, Types,
  scenedata;

type

  { TDialogEditorForm }

  TDialogEditorForm = class(TForm)
    NewPersonMenuItem: TMenuItem;
    DeletePersonMenuItem: TMenuItem;
    AddScenePartMenuItems: TMenuItem;
    DeleteScenePartMenuItem: TMenuItem;
    AddDialogScenePartMenuItem: TMenuItem;
    AddTextScenePartMenuItem: TMenuItem;
    NewSceneAction: TAction;
    MainActionList: TActionList;
    MainToolbar: TToolBar;
    DialogTreeView: TTreeView;
    DialogGroupEditorPopup: TPopupMenu;
    NewSceneMenuItem: TMenuItem;
    DeleteSceneMenuItem: TMenuItem;
    NewDialogsButton: TToolButton;
    OpenDialogsButton: TToolButton;
    SaveDialogsButton: TToolButton;
    Separator1: TMenuItem;
    Separator2: TMenuItem;
    procedure DialogTreeViewContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure FormCreate(Sender: TObject);
    procedure NewSceneActionExecute(Sender: TObject);
  private
    // Данные игры
    FGameData: TGameData;
    // Корень в дереве для добавления персонажей
    FPersonItemRoot: TTreeNode;
    // Корень в дереве для добавления сцен
    FSceneItemRoot: TTreeNode;
  public

  end;

var
  DialogEditorForm: TDialogEditorForm;

implementation

{$R *.lfm}

{ TDialogEditorForm }

procedure TDialogEditorForm.FormCreate(Sender: TObject);
begin
  FPersonItemRoot := DialogTreeView.Items.GetFirstNode.Items[0];
  FSceneItemRoot := DialogTreeView.Items.GetFirstNode.Items[1];
  FGameData := TGameData.Create;
end;

procedure TDialogEditorForm.DialogTreeViewContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: boolean);
var
  node: TTreeNode;
begin
  Handled := True;
  node := DialogTreeView.GetNodeAt(MousePos.X, MousePos.Y);
  if node = nil then
    Exit;

  node.Selected := True;

  // Проверяет не корень ли дерева
  if node = DialogTreeView.Items.GetFirstNode then
    Exit();

  if node = FPersonItemRoot then
  begin
    NewPersonMenuItem.Enabled := True;
    DeletePersonMenuItem.Enabled := False;
    NewSceneMenuItem.Enabled := False;
    DeleteSceneMenuItem.Enabled := False;
    AddScenePartMenuItems.Enabled := False;
    DeleteScenePartMenuItem.Enabled := False;
  end
  else if node = FSceneItemRoot then
  begin
    NewPersonMenuItem.Enabled := False;
    DeletePersonMenuItem.Enabled := False;
    NewSceneMenuItem.Enabled := True;
    DeleteSceneMenuItem.Enabled := False;
    AddScenePartMenuItems.Enabled := False;
    DeleteScenePartMenuItem.Enabled := False;
  end;

  DialogTreeView.PopupMenu := DialogGroupEditorPopup;
  DialogGroupEditorPopup.PopUp;
end;

procedure TDialogEditorForm.NewSceneActionExecute(Sender: TObject);
begin
  DialogTreeView.Items.AddChild(FSceneItemRoot, 'Новая сцена');
end;

end.
