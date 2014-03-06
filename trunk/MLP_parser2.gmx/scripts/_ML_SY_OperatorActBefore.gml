var o1,o2;
o1 = argument0;
o2 = argument1;

return !(o1.precedence < o2.precedence || (o1.assoc == ML_O_LEFTASSOC && o1.precedence == o2.precedence));
