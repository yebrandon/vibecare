public String [][] initializeInfo()
{
  String [] info;
  info = loadStrings("info.txt");
  String [][] tokens = new String[info.length][];


  for (int i = 0; i < info.length; i++)
  {
    tokens[i] = splitTokens(info[i], ",");
  }

  return tokens;
}
