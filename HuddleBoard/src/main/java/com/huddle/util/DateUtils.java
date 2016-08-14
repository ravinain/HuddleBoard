package com.huddle.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

/**
 * 
 * @author cdacr
 *
 */
public class DateUtils {

	/** */
	private DateUtils() {
	}

	/** */
	static Logger logger = Logger.getLogger(DateUtils.class.getName());

	/**
	 * Method convert string date in Date object.
	 * @param: input date should be in string format
	 * @return : return date object in MM/DD/YYYY format
	 */
	public static Date getDateFormatMMDDYYYY(final String dateStr) {
		if (dateStr == null) {
			return null;
		}
		final SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		try {
			return df.parse(dateStr);
		} catch (final ParseException e) {
			logger.error(e.getMessage());
		}
		return null;
	}
}
