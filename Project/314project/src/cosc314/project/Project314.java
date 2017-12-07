public class Project314 {

  public static void main (String[] args) {
    System.out.println("For DLP:");
    //input for 3^x = 12 (mod 17)
    System.out.println("x is: " + solveDLP(31847, 5, 18074));
    System.out.println("For num conversion:");
    System.out.println("The result of numToText(3781): " + numToText(17575));
  }
  
  
  
  
  
  //q is a prime (p in question), a is a primitive root of q (alpha in question), y is a residue mod q (beta in question)
  public static int solveDLP(int q, int a, int y) {
    int x = a;
    int i = 1;
    while (x != y && i < 8000) {
      x = x * a;
      x = reduceByMod(x, q);
      i++;
    }
    return i-1;
  }
  
  //a is the number, b is the mod
  public static int reduceByMod(int a, int b) {
    int c = a;
    if (a > b) {
      c = a / b;
      c = a - (c * b);
    }
    return c;
  }
  
  
  //Takes an integer and finds that corresponding 3 letter text
  public static String numToText(int a) {
    //x * 26^2 + y * 26 + z = a
    //z is just a mod 26
    int z = reduceByMod(a, 26);
    System.out.println("Z is: " + z);
    //y is a - z (mod 26^2)/26
    int y = (reduceByMod(a, 676) - z)/26;
    System.out.println("y is: " + y);
    //Solve the original for x
    int x = (a - (y*26 + z))/676;
    System.out.println("x is: " + x);
    return getCharacter(x) + getCharacter(y) + getCharacter(z);
  }
  
  //Returns the number block using 3 letters
  /*public static int textToNum(char a, char b, char c) {
    int block = getCharCode(a) * 26^2 + getCharCode(b) * 26 + getCharCode(c);
    return block;
  }*/
  
  //Gets the integer value that corresponds with a character (a = 0, b = 1, etc...)
  public static String getCharacter(int num) {
    int letter = 'a' + num;
    return Character.toString((char)letter);
  }
}
