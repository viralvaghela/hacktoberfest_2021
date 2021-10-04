class dthraed extends Thread
{
	public void run()
	{
	   try
	   {
	      System.out.println("Thread strat"+Thread.currentThread().getName());

	      int temp=0;
	      for(int num=1;num<=30;num++)
	      {
	          for(int i=2;i<num-1;i++)
	          {

	             if(num%i==0)
	             {
	                 temp=temp+1;
	             }
	             else
	             {
	                System.out.println("YEs");
	             }
	          }
	      }
	   }
	   catch(Exception e)
	   {
	      System.out.println(e);
	   }
	}
}
class DaemonThread
{
	public static void main(String args[])
	{
	   dthraed t=new dthraed();
	   t.setDaemon(true);
	   t.setPriority(Thread.MIN_PRIORITY);
	   t.start();
	}
}
