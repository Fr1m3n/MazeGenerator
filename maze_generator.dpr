program maze_generator;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  WALL = '#';
  CELL = ' ';

type
  cord = record
    x, y: integer;
    mark: integer;
  end;
  neibs = array[1..4] of cord;

var
  start: cord;
  stek:array[1..1000000] of cord;
  maze: array[1..1000, 1..1000] of char;
  mark: array[1..1000, 1..1000] of byte;
  y, x, n, m, pos: integer;

function getNeibs(c: cord): neibs;     // �������, ������������ ������ �������
begin
  if c.x + 2 < m then  // �������� ������
  begin
    getNeibs[1].x := c.x + 2;
    getNeibs[1].y := c.y;
    getNeibs[1].mark := mark[c.y][c.x + 2];
  end
    else
      getNeibs[1].mark := 5;
  if c.x - 2 > 1 then
  begin
    getNeibs[2].x := c.x - 2;
    getNeibs[2].y := c.y;
    getNeibs[2].mark := mark[c.y][c.x - 2];
  end
    else
      getNeibs[2].mark := 5;
  if c.y + 2 < n then
  begin
    getNeibs[3].x := c.x;
    getNeibs[3].y := c.y + 2;
    getNeibs[3].mark := mark[c.y + 2][c.x];
  end
    else
      getNeibs[3].mark := 5;
  if c.y - 2 > 1 then
  begin
    getNeibs[4].x := c.x;
    getNeibs[4].y := c.y - 2;
    getNeibs[4].mark := mark[c.y - 2][c.x];
  end
    else
      getNeibs[4].mark := 5;
end;

procedure firstGenerate();  // ��������� �������������� "�������"
var
  i, j: integer;
begin
  for i := 1 to n do
  begin
    for j := 1 to m do
    begin
      mark[i][j] := 0;
      if (i = 1) or (i = n) or (j = 1) or (j = m) or (odd(i)) or ((odd(j))) then
        maze[i][j] := WALL
      else
        maze[i][j] := CELL;
    end;
  end;
end;

procedure removeWall(a, b: cord);  // ��������� �������� ������ ����� ����� ��������
begin
  maze[(a.y + b.y) div 2][(a.x + b.x) div 2] := CELL;
end;

procedure writeMaze();  // ����� ������� ���������
var
  i, j: integer;
begin
  for i := 1 to n do
  begin
    for j := 1 to m do
      write(maze[i][j]);
    writeln;
  end;
end;

procedure generateMaze(); // �������� ��������� ��������� ���������
var
  currCell, nextCell: cord;
  neib, variants: neibs;
  i, choice, countFree: integer;
  anyFree: boolean;
begin
  currCell := start;  // �������� � ��������� �����
  repeat
    mark[currCell.y][currCell.x] := 1;
    neib := getNeibs(currCell);   // �������� �������
    anyFree := false;
    countFree := 0;
    for i := 1 to 4 do  // �������������� ������ � �������� � ������� ����� �����
    begin
      if neib[i].mark = 0 then
      begin
        anyFree := true;
        inc(countFree);
        variants[countFree] := neib[i];
      end;
    end;
    if anyFree then
    begin
      
      choice := random(1000) mod countFree + 1;
      nextCell := variants[choice]; // ��� � ���������� ������ �� ����������
      if countFree > 1 then  // ���� �������� � ������ ������, �� ������� � � ����
      begin
        inc(pos);
        stek[pos] := currCell;
      end;
      removeWall(nextCell, currCell);   // ������� ������
      //mark[currCell.y][currCell.x] := 1;
      currCell := nextCell;    // ������������ ������
    end
    else    // ���� � �������������� ������ ��� �������
      begin
        if pos > 0 then  // ���� ���� �� ����, ��
        begin
          currCell := stek[pos];       // ������ �� ���� ������
          mark[currCell.y][currCell.x] := 1;
          dec(pos);
          anyFree := true;
        end;
      end;
    //writeMaze();
  until (anyFree = false) and (pos = 0);
  //maze[currCell.y][currCell.x] := 'E';
end;



begin
  readln(n, m);
  randomize();
  if not(odd(n)) then inc(n);  // ������   n � m ���������
  if not(odd(m)) then inc(m);
  firstGenerate(); // "�������"
  start.x := 2;  // ��������� �����
  start.y := 2;
  pos := 0;
  mark[start.y][start.x] := 1;
  maze[start.y][start.x] := 'S';
  maze[m - 1][n - 1] := 'E';
 // writeMaze();
  generateMaze();
  writeMaze();
  readln;
  readln;
end.
