package com.corona.green.api;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class PhoneCodeSend {

	public PhoneCodeSend() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	 public void certifiedPhoneNumber(String phoneNumber, String cerNum) {

	        String api_key = "NCSYSFHGAZ1POKRL";
	        String api_secret = "BMGQWCIYPKNIQK5FWGJNHQWQDT5PUSP6";
	        Message coolsms = new Message(api_key, api_secret);

	        // 4 params(to, from, type, text) are mandatory. must be filled
	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", phoneNumber);    // 수신전화번호
	        params.put("from", "01033388274");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	        params.put("type", "SMS");
	        params.put("text", "[CoronaGreen] 회원가입 휴대폰인증 : 인증번호는" + "["+cerNum+"]" + "입니다.");
	        params.put("app_version", "test app 1.2"); // application name and version

	        try {
	            JSONObject obj = (JSONObject) coolsms.send(params);
	        } catch (CoolsmsException e) {
	        }

	    }
}
