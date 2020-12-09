with Ada.Text_IO;
with Ada.Numerics.discrete_Random;


use Ada.Text_IO;

procedure Zad2 is

task RandomN is
    entry Start;
end RandomN;

task RandomC is
    entry Start;
end RandomC;

task RandomD is 
    entry Start;
end RandomD;

task RandomSix is
    entry Start;
end RandomSix;

task body RandomN is
    type randRange is new Integer range 0..5;
   package Rand_Int is new ada.numerics.discrete_random(randRange);
   use Rand_Int;
   gen : Generator;
   num : randRange;
begin
    accept Start;
    reset(gen);
    num := random(gen);
    Put_Line("Losowy numer:" & randRange'Image(num));
end RandomN;

task body RandomC is
    type randRange is new Integer range 0..4;
    package Rand_Int is new ada.numerics.discrete_random(randRange);
    use Rand_Int;
    gen : Generator;
    num : randRange;
begin
    accept Start;
    reset(gen);
    num := random(gen);
    Put_Line("Losowy kolor: ");
    case num is
        when 0 => Put_Line("niebieski");
        when 1 => Put_Line("zielony");
        when 2 => Put_Line("zolty");
        when 3 => Put_Line("czerwony");
        when 4 => Put_Line("fioletowy");
    end case;
end RandomC;

task body RandomD is
    type randRange is new Integer range 0..6;
    package Rand_D is new ada.numerics.discrete_random(randRange);
    use Rand_D;
    gen : Generator;
    num : randRange;
begin
    accept Start;
    reset(gen);
    num := random(gen);
    Put_Line("Losowy dzien tygodnia: ");
    case num is
        when 0 => Put_Line("poniedzialek");
        when 1 => Put_Line("wtorek");
        when 2 => Put_Line("sroda");
        when 3 => Put_Line("czwartek");
        when 4 => Put_Line("piatek");
        when 5 => Put_Line("sobota");
        when 6 => Put_Line("niedziela");
    end case;
end RandomD;

task body RandomSix is
    type randRange is new Integer range 1..49;
   package Rand_Int is new ada.numerics.discrete_random(randRange);
   use Rand_Int;
   gen : Generator;
   num : randRange;
begin
    accept Start;
    reset(gen);
    Put_Line("6 liczb z zakresu 1..49:");
    For_Loop :
        for I in Integer range 1 .. 6 loop
            num := random(gen);
            Put_Line(randRange'Image(num));
        end loop For_Loop;
end RandomSix;


begin
    RandomN.Start;
    delay 0.5;
    RandomC.Start;
    delay 0.5;
    RandomD.Start;
    delay 0.5;
    RandomSix.Start;
end Zad2;