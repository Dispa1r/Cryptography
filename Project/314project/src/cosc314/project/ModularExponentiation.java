package cosc314.project;

public class ModularExponentiation {

	public double ModularExp(double x, int n)
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
}
