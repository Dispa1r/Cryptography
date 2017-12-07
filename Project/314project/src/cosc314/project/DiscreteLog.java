package cosc314.project;

public class DiscreteLog {

	//q is prime, a is a primitive root of q, y is a residue mod q
	public static int DiscreteLog(int q, int a, int y) {
		int x = -1;
    		int i = 1;
    		while (x != y) {
      			x = (int) Math.pow(a, i);
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
    		return c;
  }

}
