public String rarityToWord(int rarity)
{
 if(rarity ==0)
 {
   return "common";
 }
 else if(rarity == 1)
 {
   return "rare";
 }
 else
 {
   return "legendary";
 }
}
