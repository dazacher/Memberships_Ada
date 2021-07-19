with Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;

procedure Memberships is
   package TIO renames Ada.Text_IO;
   package Math renames Ada.Numerics.Elementary_Functions;
   type Suit is (Clubs, Diamonds, Hearts, Spades, No_Trumps);
   Bid_Suit  : Suit := Clubs;
   Valid_Bid : Boolean;
   subtype Trick_Range is Integer range 1 .. 13;
   Bid_Tricks     : Integer range 0 .. 13 := 0;
   Black_Suit     : Boolean;
   Black_Or_Minor : Boolean;
   --  NS             : Integer               := 0;
   --  Is_Even        : Boolean;
   --  Square_Root    : Integer;

begin
   -- Subtype membership
   Valid_Bid := Bid_Tricks in Trick_Range;
   Valid_Bid := (for some Bid in Trick_Range => Bid = Bid_Tricks);
   if not Valid_Bid then
      TIO.Put_Line ("The hand was passed out.");
   end if;

   -- single literal membership
   if No_Trumps not in Bid_Suit then
      TIO.Put_Line ("No Trumps was not the bid.");
   end if;

   -- Vertical Bar testing
   Black_Suit     := Bid_Suit in Clubs | Spades;
   Black_Or_Minor := Bid_Suit in Clubs .. Diamonds | Spades;
   TIO.Put_Line
     ("The suit was " &
      (if Black_Suit then "Black" else "Diamonds, Hearts or No Trumps"));
   TIO.Put_Line
     ("The suit was " &
      (if Black_Or_Minor then "Black or a Minor Suit"
       else "Hearts,Spades or No Trumps"));

end Memberships;
