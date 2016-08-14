package com.huddle.util;

/**
 * 
 * @author cdacr
 *
 */
public class StringUtils {

	/** */
	private StringUtils() {
	}

	/**
	 * Method converts Object type into String if input param 
	 * is type of String otherwise returns empty string.
	 * @param obj 
	 * @return String object.
	 */
	public static String avoidNull(final Object obj) {
		if (obj != null && obj instanceof String) {
			return (String) obj;
		} else {
			return "";
		}
	}

}
