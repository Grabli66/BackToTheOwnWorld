unit MainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  ActnList, Types;

type

  { TDialogEditorForm }

  TDialogEditorForm = class(TForm)
    NewPersonMenuItem: TMenuItem;
    DeletePersonMenuItem: TMenuItem;
    AddScenePartMenuItems: TMenuItem;
    DeleteScenePartMenuItem: TMenuItem;
    AddDialogScenePartMenuItem: TMenuItem;
    AddTextScenePartMenuItem: TMenuItem;
    NewGroupAction: TAction;
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
    procedure NewGroupActionExecute(Sender: TObject);
  private

  public

  end;

var
  DialogEditorForm: TDialogEditorForm;

implementation

{$R *.lfm}

{ TDialogEditorForm }

procedure TDialogEditorForm.DialogTreeViewContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: boolean);
var
  node: TTreeNode;
begin
  Handled := True;
  node := DialogTreeView.GetNodeAt(MousePos.X, MousePos.Y);
  if node = nil then
    Exit;

  DialogTreeView.PopupMenu := DialogGroupEditorPopup;
  DialogGroupEditorPopup.PopUp;
end;

procedure TDialogEditorForm.NewGroupActionExecute(Sender: TObject);
var
  node: TTreeNode;
begin
  node := DialogTreeView.Items.GetFirstNode;
  if node = nil then
    Exit;

  DialogTreeView.Items.AddChild(node, 'Новая группа');
end;

end.
