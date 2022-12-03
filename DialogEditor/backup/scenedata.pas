unit scenedata;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, fgl;

type
  // Данные персонажа
  TPersonData = class
  end;

  // Базовая часть сцены
  TBaseScenePart = class abstract
  public
    Id: string;
  private
  end;

  // Часть сцены в виде текста
  TTextScenePart = class(TBaseScenePart)
  public
    Text: string;
  private
  end;

  // Часть сцены в виде выбора действия в диалоге
  TChooseScenePart = class(TBaseScenePart)
  public
    Text: string;
  private
  end;

  TPartList = specialize TFPGObjectList<TBaseScenePart>;

  // Данные сцены

  { TSceneData }

  TSceneData = class
  public
    Parts: TPartList;
    constructor Create;
    destructor Destroy; override;
  private
  end;

  TPersonList = specialize TFPGObjectList<TPersonData>;
  TSceneList = specialize TFPGObjectList<TSceneData>;

  // Данные игры

  { TGameData }

  TGameData = class
  public
    Persons: TPersonList;
    Scenes: TSceneList;
    constructor Create;
    destructor Destroy; override;
  private
  end;

implementation

{ TGameData }

constructor TGameData.Create;
begin

end;

destructor TGameData.Destroy;
begin
  FreeAndNil(Persons);
  FreeAndNil(Scenes);

  inherited Destroy;
end;

{ TSceneData }

constructor TSceneData.Create;
begin
  Parts := TPartList.Create();
end;

destructor TSceneData.Destroy;
begin
  FreeAndNil(Parts);
  inherited Destroy;
end;

end.
