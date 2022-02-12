package entites;

public class getWords {

public static String getWord(String name) {
		
		String[] str = name.split("");
		
		if (str.length>22) {
			
			String res="";
			
			for (int i = 0; i <22; i++) {
				res=res+str[i];
			}
			return (res+"...");
		}
		else {
			
			 return (name+"...");
		}
		
		
	}
	
}
