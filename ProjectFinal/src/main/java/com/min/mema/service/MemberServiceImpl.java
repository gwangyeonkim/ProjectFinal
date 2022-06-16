package com.min.mema.service;

import java.security.SecureRandom;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.min.mema.mapper.IMemberDao;
import com.min.mema.vo.MemberVo;
import com.min.proj.vo.ProjectVo;
import com.sun.net.httpserver.Authenticator.Result;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements IMemberService {
	
	@Autowired
	private IMemberDao dao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	

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
		return sendEmail(email, 0);
		
	}

	@Override
	public String chkHp(String hp) {
		int certificatedNum = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
//		String api_key = "NCS1ATWB7BLNOTJ7";
//	    String api_secret = "XZZYP2EP9G8LOBAW0DTNELWOZJPROCGQ";
//	    Message coolsms = new Message(api_key, api_secret);
	    
	    HashMap<String, String> params = new HashMap<String, String>();

	    params.put("to", hp);    // 수신전화번호
        params.put("from", "010-2731-4002");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨 -> 발신전화 번호는 coolSMS에 등록해줘야됨
        params.put("type", "SMS");// type 방식
        params.put("text", "휴대폰인증 메시지 : 인증번호는" + "["+certificatedNum+"]" + "입니다.");
      	params.put("app_version", "test app 1.2"); // application name and version
	    
//      	try {
//  	      JSONObject obj = (JSONObject) coolsms.send(params);
//  	      System.out.println(obj.toString());
//  	    } catch (CoolsmsException e) {
//  	      System.out.println(e.getMessage());
//  	      System.out.println(e.getCode());
// 	      return "error";
//  	    }
		
		return Integer.toString(certificatedNum);
	}
	
	@Override
	public int modifyMember(MemberVo vo) {
		return dao.modifyMember(vo);
	}
	
	@Override
	public int modifyMemberPw(MemberVo vo) {
		return dao.modifyMemberPw(vo);
	}
	
	
	@Override
	public String findIdmdmber(Map<String, Object> map) {
		return dao.findIdmdmber(map);
	}
	
	@Override
	public List<MemberVo> memberlistAll(MemberVo vo) {
		return dao.memberlistAll(vo);
	}
	
	@Override
	public MemberVo memberSelect(String id) {
		return dao.memberSelect(id);
	}
	
	
	@Override
	public String findAndUpdatePw(MemberVo vo) {
		MemberVo pVo = dao.findPwmember(vo);
		String email = vo.getMemEmail();
		int upResult = 0;
		if (pVo != null) {
			if (pVo.getMemEmail().equals(email)) {
				String result = sendEmail(email, 1);
				String encodePw = passwordEncoder.encode(result);
				vo.setMemPw(encodePw);
				upResult = dao.updatePw(vo);
			}
		}
		return upResult+"";
	}
	
	// 임시비밀번호 난수 발생
	private String getRamdomPassword(int size) {
        char[] charSet = new char[] {
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                '!', '@', '#', '$', '%', '^', '&' };
        StringBuffer sb = new StringBuffer();
        SecureRandom sr = new SecureRandom();
        sr.setSeed(new Date().getTime());

        int idx = 0;
        int len = charSet.length;
        for (int i=0; i<size; i++) {
            // idx = (int) (len * Math.random());
            idx = sr.nextInt(len);    // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
            sb.append(charSet[idx]);
        }

        return sb.toString();
    }
	
	private String sendEmail(String email, int type) {
		 String from = "aloob111@naver.com";//보내는 이 메일주소
	        String to = email;
	        String title = new String();
	        String content = new String();
	        String result = new String();
	        
	        if (type == 0) {
	        	int certificatedNum = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
				title = "회원가입시 필요한 인증번호 입니다.";
		        content = "[인증번호]  입니다. "+ certificatedNum +" <br/> 인증번호 확인란에 기입해주십시오.";
		        result = certificatedNum+"";
			}else {
				String newPw = getRamdomPassword(10);
				title = "회원님의 임시비밀번호 입니다.";
				content = "회원님읜 임시비밀번호는 " + newPw + "입니다";
				result = newPw;
			}
	        
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
	        }
		return result;
	}

	
	@Override
	public String inviteMember(MemberVo vo) {
		
//		MemberVo id = new MemberVo();
//		id.getMemberId();S
//		System.out.println(id);
		vo.getMemberId();
		String token = dao.inviteMember(vo);
		System.out.println(token+"!!!!!!!!!!!!!!!");
		System.out.println(vo+"!!!!!!!!!!!!!!!!!!!");
		
		String from = "aloob111@naver.com";//보내는 이 메일주소
		String to = vo.getMemEmail();
		String title = "프로젝트 가입하기 위한 토큰입니다.";
		String content = "[토큰번호] "+ token +" 입니다. <br/> 프로젝트 참여하기에 입력해주세요.";
		
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
      }
		
		return token;
	}


	
	

}
