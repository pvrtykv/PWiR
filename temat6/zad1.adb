-- zad1.adb

with Ada.Text_IO;
with Ada.Containers.Vectors;
with Ada.Numerics.discrete_Random;
with Ada.Numerics.Elementary_Functions;

use Ada.Text_IO;
use Ada.Containers;
use Ada.Numerics.Elementary_Functions;

procedure Zad1 is

task RandomPoint is
    entry Start (N : Integer);
end RandomPoint;

task ComputeDistance is
  entry Start;
  entry Koniec;
  entry We(x, y : Integer);
end ComputeDistance;

task body RandomPoint is
   type randRange is new Integer range 0..10;
   package Rand_Int is new ada.numerics.discrete_random(randRange);
   use Rand_Int;
   gen : Generator;
   x : randRange;
   y : randRange;
   Task_N : Integer;
begin
    accept Start(N : Integer) do 
      Task_N := N;
    end Start;
    reset(gen);
    For_Loop :
      for I in Integer range 1 .. Task_N loop
        x := random(gen);
        y := random(gen);
        Put_Line("Losowy punkt: (" & randRange'Image(x) & ", " &
         randRange'Image(y) & ")");
        ComputeDistance.We(Integer(x), Integer(y));
      end loop For_Loop;
    ComputeDistance.Koniec;
end RandomPoint;

task body ComputeDistance is
x1 : Integer;
y1 : Integer;

dist : Float;
begin
  accept Start;
  loop
    select 
     accept We(x, y : Integer) do
	     x1 := x;
       y1 := y;
     end We;
     dist := sqrt(Float(x1*x1 + y1*y1));
	   Put_Line("Odleglosc od poczatku osi wspolrzednych: " & dist'Img);
    or 
	   accept Koniec;
 	   exit;
    end select;
  end loop;
end ComputeDistance;

begin
  RandomPoint.Start(4);
  delay 0.5;
  ComputeDistance.Start;
end Zad1;
	  	