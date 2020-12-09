generic 
    Rozmiar: Natural;
    type Typ_Elementu is (<>);
package Buf_Gen is
    type TBuf is array(Integer range 1..Rozmiar) of Typ_Elementu;
end Buf_Gen;

