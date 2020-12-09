with Ada.Text_IO;
use Ada.Text_IO;

procedure Zad1 is
    N : Integer := 10;
    type BuffArr is Array (1..N) of Integer;
    protected Buffer is
        Entry Write(X : in Integer);
        Entry Read(X : Out Integer);
    private
        Buffers : BuffArr;
        Next_in, Next_out : Integer range 1..N := 1;
        current : Integer range 0..N := 0;
    end Buffer;

    protected body Buffer is 
        Entry Write(X : in Integer) when current < N is
        begin
            Buffers(Next_in) := X;
            Next_in := (Next_in mod N) + 1;
            current := current + 1;
        end Write;
        Entry Read(X : out Integer) when current > 0 is
        begin
            X := Buffers(Next_out);
            Next_out := (Next_out mod N) + 1;
            current := current - 1;
        end Read;
    end Buffer;

    task type Producer(Id : Positive) is
        Entry Stop;
    end Producer;

    task body Producer is
        item: Integer := 0;
    begin
        loop
            select
                accept Stop;
                exit;
            or
                delay 0.001;
            end select;
            item := item + 1;
            Put_line("Producer" & Integer'Image(Id)
            & " writing" & Integer'Image(item));
            Buffer.Write(item);
        end loop;
    end Producer;

    task type Consumer(Id : Positive) is
        Entry Stop;
    end Consumer;

    task body Consumer is
        item : Integer;
    begin
        loop
            select
                accept stop;
                exit;
            or
                delay 0.001;
            end select;
            Buffer.Read(item);
            Put_Line("Consumer" & Integer'Image(Id)
            & " reads" & Integer'Image(item));
        end loop;
    end Consumer;

    P1 : Producer(1);
    C1 : Consumer(1);

begin  
    delay 0.2;
    P1.Stop;
    C1.Stop;
end Zad1;