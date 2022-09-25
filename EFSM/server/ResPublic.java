/* the public resource class 
 * Here the public resources are generated by apktool and the corresponding file locates at
 * ".../res/values/public.xml"
 * It contains resource tags for "string", "id", "menu", "layout", "drawable" and etc.
 * */
public class ResPublic{
		private String type; /* "string", "id", "menu", "layout", "drawable" */
		private String name;
		private int id;
		
		/* constructor */
		public ResPublic(String type, String name, int id){
			this.type = type;
			this.name = name;
			this.id = id;
		}
		/* copy constructor */
		public ResPublic(ResPublic mPublicRes){
			this(mPublicRes.getType(), mPublicRes.getName(), mPublicRes.getID());
		}
		/* getter */
		public String getType(){
			return this.type;
		}
		public String getName(){
			return this.name;
		}
		public int getID(){
			return this.id;
		}
		/* toString */
		public String toString(){
			return this.type + "  " + this.name + "  " + this.id;
		}
	}