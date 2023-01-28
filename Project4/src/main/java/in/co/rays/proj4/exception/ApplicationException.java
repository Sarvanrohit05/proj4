package in.co.rays.proj4.exception;

/**
 * ApplicationException is propogated from Service classes when an business
 * logic exception occurered.
 *
 * @author Rohit Rajput
 *
 */
public class ApplicationException extends Exception{
	
	/**
	 * @param msg
	 *  :Error message
	 */
	public ApplicationException(String msg){
		super(msg);
	}

}
