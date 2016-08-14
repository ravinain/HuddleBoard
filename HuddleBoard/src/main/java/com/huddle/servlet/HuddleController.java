package com.huddle.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;

import com.huddle.actions.ControllerAction;
import com.huddle.util.StringUtils;

/**
 * 
 * @author cdacr
 *
 */
public class HuddleController extends HttpServlet {

	/** */
	private static final long serialVersionUID = 987267567516242430L;
	/** */
	static Logger logger = Logger.getLogger(HuddleController.class.getName());

	@Override
	public void doGet(final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		doProcess(request, response);
	}

	@Override
	public void doPost(final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		doProcess(request, response);
	}

	public void doProcess(final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		logger.info("Inside Process");
		final ControllerAction ca = new ControllerAction();
		final String type = StringUtils.avoidNull(request.getParameter("type"));

		if (StringUtils.avoidNull(request.getParameter("page"))
				.equals("huddle")) {
			ca.getData(request, response);
		} else if (StringUtils.avoidNull(request.getParameter("page")).equals(
				"graph")) {
			ca.forwardRequest(request, response);
		} else {
			ca.processRequest(request, response);
			logger.info(request.getAttribute("result"));
			final PrintWriter out = response.getWriter();
			final Map<String, Object> resultMap = (Map<String, Object>) request
					.getAttribute("result");
			final JSONObject jsonObj = new JSONObject();
			jsonObj.put("message", resultMap.get("message"));
			jsonObj.put("id", StringUtils.avoidNull(resultMap.get("autoGenId")));
			out.println(jsonObj);
		}/* else {
			ca.processRequest(request, response);
			logger.info(request.getAttribute("result"));
			PrintWriter out = response.getWriter();
			Map<String, Object> resultMap = (Map<String, Object>)request.getAttribute("result"); 
			out.println(StringUtils.avoidNull(resultMap.get("message")));
			}*/
	}

}
