private Item[] store = 
{
  new Item(184, 14), 
  new Item(196, 60), 
  new Item(206, 31), 
  new Item(2370, 65), 
  new Item(7282, 73), 
  new Item(8303, 90), 
  new Item(12328, 63), 
  new Item(12705, 14), 
  new Item(13066, 8), 
  new Item(14088, 92), 
  new Item(15320, 82), 
  new Item(15814, 60), 
  new Item(15917, 51), 
  new Item(17911, 96), 
  new Item(18061, 3), 
  new Item(18410, 56), 
  new Item(18465, 27), 
  new Item(18618, 64), 
  new Item(18871, 69), 
  new Item(19967, 45)
};                             
public int linearSearch(int catNumToFind)
{ 
  int result = -1;
  for(int indexSearching=0; indexSearching<store.length; indexSearching++) { 
    if(store[indexSearching].getCatNum() == catNumToFind) {
      result = store[indexSearching].getInventory();
      break;
    }
  }
  return result;
}
public int recursiveLinearSearch(int catNumToFind, int startIndex)
{
  int result = -1;
  if(startIndex>=store.length) {
    result = -1;
  } else if(store[startIndex].getCatNum() == catNumToFind) {
    result = store[startIndex].getInventory();
  } else {
    result=recursiveLinearSearch(catNumToFind, startIndex+1);
  }
  return result;
}
public int binarySearch(int catNumToFind)
{
  int nHigh = store.length -1;
  int nLow = 0;
  int result = -1;
  while(nHigh >= nLow) { 
    int guess = (nHigh+nLow)/2;
    if(store[guess].getCatNum() == catNumToFind) {
      result = store[guess].getInventory();
      break;
    } else if(store[guess].getCatNum() < catNumToFind) {
      nLow = guess+1;
    }
    else{
      nHigh = guess-1;
    }
  }
  return result;
}

public int recursiveBinarySearch(int catNumToFind, int nLow, int nHigh)
{
  int result = -1;
  int guess = (nHigh+nLow)/2;
  if(nHigh<nLow) {
    result = -1;
  } else if(store[guess].getCatNum() == catNumToFind) {
    result = store[guess].getInventory();
  } else if(store[guess].getCatNum() < catNumToFind) {
    result = recursiveBinarySearch(catNumToFind, guess+1, nHigh);
  } else if(store[guess].getCatNum() > catNumToFind){
    result = recursiveBinarySearch(catNumToFind, nLow, guess-1);
  }
  return result;
}







public void setup()
{
  int[] tests = {0, 183, 184, 2370, 15320, 19967, 19968};
  System.out.println();
  System.out.println("Testing Non-Recursive Linear Search");
  System.out.println("=====================");
  for (int i = 0; i < tests.length; i++)
  {

    if (linearSearch(tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+linearSearch(tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Recursive Linear Search");
  System.out.println("=====================");
  for (int i = 0; i < tests.length; i++)
  {

    if (recursiveLinearSearch(tests[i],0) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+recursiveLinearSearch(tests[i],0) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Non-Recursive Binary Search");
  System.out.println("===================================");
  for (int i = 0; i < tests.length; i++)
  {

    if (binarySearch(tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+binarySearch(tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Recursive Binary Search");
  System.out.println("===============================");
  for (int i = 0; i < tests.length; i++)
  {

    if (recursiveBinarySearch(tests[i], 0, store.length - 1) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+recursiveBinarySearch(tests[i], 0, store.length - 1) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
}

public void draw()
{
  //empty!
}
