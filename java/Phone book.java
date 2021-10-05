import java.util.*;
import java.io.*;
public class Main {
   

	public static void main(String[] args) {
	    try{
            int no_of_entries=0;
            int no_of_query=0;
            int i=0;
            String name=null;
            int number=0;
            HashMap<String,Integer>phoneBook=new HashMap<String,Integer>();
            BufferedReader b=new BufferedReader(new InputStreamReader(System.in));
            no_of_entries=Integer.parseInt(b.readLine());
            while(i<no_of_entries){
                name=b.readLine();
                number=Integer.parseInt(b.readLine());
                phoneBook.put(name,number);
                i++;
            }
            int j=0;
            no_of_query=Integer.parseInt(b.readLine());
            String[] query=new String[no_of_query];
            while(j<no_of_query){
                query[j]=b.readLine();
                j++;
            }
            for(j=0;j<no_of_query;j++)
            {
            if(phoneBook.containsKey(query[j])) 
                System.out.println(query[j]+"="+phoneBook.get(query[j]));
            else
                System.out.println("Not found");
            }
        }
        catch(Exception e){
            
        }
           
	}
}
