package com.moviews.util;

import java.io.InputStream;
import java.net.URL;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class RecaptchaCheck {
	/*
		g-recaptcha-response = recaptchaResponse
	 */
	public static String recaptchaCheck (String recaptchaResponse) throws Exception {
		String checkAddr = "https://www.google.com/recaptcha/api/siteverify";
		String secretKey = "6LdcWhATAAAAAIa94P1fvBfIt-Nx--iMZ26G94Zc";

		checkAddr = checkAddr + "?" + "secret=" + secretKey + "&" + "response=" + recaptchaResponse;

		URL url = new URL(checkAddr);
		System.out.println(url);
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(bos.getOut().toString());
		String result = jsonObject.get("success").toString();
		in.close();
		bos.close();
		return result;
	}
}
