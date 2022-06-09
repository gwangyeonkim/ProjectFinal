package com.min.mema.service;

import java.util.HashMap;

import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.min.mema.mapper.IMemberDao;
import com.min.mema.vo.MemberVo;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements IMemberService {
	
	@Autowired
	private IMemberDao dao;
	
	@Autowired
	private JavaMailSender mailSender;
	

	@Override
	public MemberVo loginChk(String id, String pw) {
		return dao.loginChk(id, pw);
	}

	@Override
	public int signUp(MemberVo vo) {
		return dao.signUp(vo);
	}

	@Override
	public int chkUserId(String id) {
		return dao.chkUserId(id);
	}

	@Override
	public String chkEmail(String email) {
		int certificatedNum = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);

        String from = "aloob111@naver.com";//보내는 이 메일주소
        String to = email;
        String title = "회원가입시 필요한 인증번호 입니다.";
        String content = "[인증번호] "+ certificatedNum +" 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(title);
            mailHelper.setText(content, true);

            mailSender.send(mail);
        } catch(Exception e) {
        	e.printStackTrace();
            return null;
        }
        return certificatedNum+"";
	}

	@Override
	public String chkHp(String hp) {
		int certificatedNum = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
		String api_key = "NCS1ATWB7BLNOTJ7";
	    String api_secret = "XZZYP2EP9G8LOBAW0DTNELWOZJPROCGQ";
	    Message coolsms = new Message(api_key, api_secret);
	    
	    HashMap<String, String> params = new HashMap<String, String>();

	    params.put("to", hp);    // 수신전화번호
        params.put("from", "010-2731-4002");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨 -> 발신전화 번호는 coolSMS에 등록해줘야됨
        params.put("type", "SMS");// type 방식
        params.put("text", "휴대폰인증 메시지 : 인증번호는" + "["+certificatedNum+"]" + "입니다.");
      	params.put("app_version", "test app 1.2"); // application name and version
	    
      	try {
  	      JSONObject obj = (JSONObject) coolsms.send(params);
  	      System.out.println(obj.toString());
  	    } catch (CoolsmsException e) {
  	      System.out.println(e.getMessage());
  	      System.out.println(e.getCode());
  	    }
		
		return Integer.toString(certificatedNum);
	}
	
	@Override
	public int modifyMember(MemberVo vo) {
		return dao.modifyMember(vo);
	}

}
