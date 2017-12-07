
public class Project314 {

  public static void main (String[] args) {
    
    int[] pairs = {3781, 14409,   31552, 3930,   27214, 15442,  5809, 30274,    
5400, 31486   ,19936, 721    ,27765, 29284  ,29820, 7710,    
31590, 26470  ,3781, 14409   ,15898, 30844  ,19048, 12914,   
16160, 3129   ,301, 17252    ,24689, 7776   ,28856, 15720,   
30555, 24611  ,20501, 2922   ,13659, 5015   ,5740, 31233,   
1616, 14170   ,4294, 2307    ,2320, 29174   ,3036, 20132,   
 14130, 22010  ,25910, 19663  ,19557, 10145  ,18899, 27609,   
26004, 25056  ,5400, 31486   ,9526, 3019    ,12962, 15189,   
29538, 5408   ,3149, 7400    ,9396, 3058    ,27149, 20535,   
1777, 8737    ,26117, 14251  ,7129, 18195   ,25302, 10248,  
 23258, 3468   ,26052, 20545  ,21958, 5713   ,346, 31194,     
8836, 25898   ,8794, 17358   ,1777, 8737    ,25038, 12483 ,  
10422, 5552   ,1777, 8737    ,3780, 16360   ,11685, 133,     
25115, 10840  ,14130, 22010  ,16081, 16414  ,28580, 20845 ,  
23418, 22058  ,24139, 9580   ,173, 17075    ,2016, 18131,    
19886, 22344  ,21600, 25505  ,27119, 19921  ,23312, 16906,   
21563, 7891   ,28250, 21321  ,28327, 19237  ,15313, 28649,   
24271, 8480   ,26592, 25457  ,9660, 7939    ,10267, 20623,   
30499, 14423  ,5839, 24179   ,12846, 6598   ,9284, 27858,    
24875, 17641  ,1777, 8737    ,18825, 19671  ,31306, 11929,   
3576, 4630    ,26664, 27572  ,27011, 29164  ,22763, 8992,   
3149, 7400    ,8951, 29435   ,2059, 3977    ,16258, 30341,  
21541, 19004  ,5865, 29526   ,10536, 6941   ,1777, 8737,    
 17561, 11884  ,2209, 6107    ,10422, 5552   ,19371, 21005,  
 26521, 5803   ,14884, 14280  ,4328, 8635    ,28250, 21321,   
      28327, 19237  ,15313, 28649};

    
    //Loop for decrypting and displaying
    String pt = "";
    int j = 0;
    for (int i=0; i < pairs.length/2; i++) {
      int r = pairs[j];
      int t = pairs[j+1];
      int a = solveDLP(31847, 5, 18074);
      
      int s = modInverse(r, 31847);
      s = reduceByMod(s, 31847);
      
      int rToA = s^a;
      rToA = reduceByMod(rToA, 31847);
      int m = t * rToA;
      m = reduceByMod(m, 31847);
      
      pt += numToText(m);
      System.out.println("Next pt: " + pt);
      j+=2;
    }
    
    /*int r = pairs[0];
    int t = pairs[1];
    int a = solveDLP(31847, 5, 18074);
    
    
    int s = modInverse(r, 31847);
    System.out.println(s);
    s = reduceByMod(s, 31847);
    System.out.println(s);
    
    int rToA = s^a;
    System.out.println(rToA);
    rToA = reduceByMod(rToA, 31847);
    System.out.println("rToA is : "  + rToA);
    
    int m = t * rToA;
    System.out.println("m is : "  + m);
    m = reduceByMod(m, 31847);
    System.out.println(m);
    System.out.println(numToText(m));*/
  }
  
  
  
  
  
  //q is a prime (p in question), a is a primitive root of q (alpha in question), y is a residue mod q (beta in question)
  public static int solveDLP(int q, int a, int y) {
    int x = a;
    int i = 1;
    while (x != y) {
      x = x * a;
      x = reduceByMod(x, q);
      i++;
    }
    return i;
  }
  
  //a is the number, b is the mod
  public static int reduceByMod(int a, int b) {
    int c = a;
    if (a > b) {
      c = a / b;
      c = a - (c * b);
    }
    if (a == b) return 0;
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
    x = reduceByMod(x, 26);
    System.out.println("x is: " + x);
    return getCharacter(x) + getCharacter(y) + getCharacter(z);
  }
  
  //Gets the integer value that corresponds with a character (a = 0, b = 1, etc...)
  public static String getCharacter(int num) {
    int letter = 'a' + num;
    return Character.toString((char)letter);
  }
  
  //OTHER CODE
  //ModInverseUsingEE
   public static int modInverse(int a, int m)
 {
  int m0 = m, t, q;
  int x0 = 0; 
  int x1 = 1;

  if (m == 1)
   return 0;

  while (a > 1)
  {
   // q is quotient
   q = a / m;
   t = m;

   // m is remainder now, process same as
   // Euclid's Algorithm
   m = a % m;
   a = t;

   t = x0;
   x0 = x1 - q * x0;
   x1 = t;
  }

  // Make x1 positive
  if (x1 < 0)
   x1 += m0;

  return x1;
}
   
   //ModularExponentiation
    public static double ModularExp(double x, int n)
    {
        if (n < 0)
            return ModularExp(1 / x, -n);
        else if (n == 0)
            return 1;
        else if (n == 1)
            return x;
        else if (n % 2 == 0)
            return ModularExp(x * x, n / 2);
        else 
            return x * ModularExp(x * x, (n - 1)/2);    
}
 
    
    //ExtendedEuclidean
     public static int gcd(int a, int b)
    {
        if (a == 0)
            return b;
         
        return gcd(b%a, a);
    }
    
}
