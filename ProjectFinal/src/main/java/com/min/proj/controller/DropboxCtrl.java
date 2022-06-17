package com.min.proj.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dropbox.core.DbxDownloader;
import com.dropbox.core.DbxException;
import com.dropbox.core.DbxRequestConfig;
import com.dropbox.core.v2.DbxClientV2;
import com.dropbox.core.v2.files.CreateFolderErrorException;
import com.dropbox.core.v2.files.DownloadErrorException;
import com.dropbox.core.v2.files.FileMetadata;
import com.dropbox.core.v2.files.ListFolderResult;
import com.dropbox.core.v2.files.Metadata;
import com.dropbox.core.v2.files.UploadErrorException;
import com.dropbox.core.v2.team.GroupsGetInfoError;

@Controller
public class DropboxCtrl {

	private static final String ACCESS_TOKEN = "sl.BJZrh388-PVUhL4vMRZlos_xWwrqRR6DdYYtfx8t5nz1Rj-JgBlUL6-rRFYd1Nu24Nnbsp0NYSkmbKX4BSI1MaVkcygl4ykttdLuBdSLXUqmeDAOlBmCMFvDAbdDY3Ln6lfcDaLBlny6";		
	private static final  DbxRequestConfig config = new DbxRequestConfig("dropbox/java-tutorial", "en_US");
	private static final DbxClientV2 client = new DbxClientV2(config, ACCESS_TOKEN);

	private Logger logger = LoggerFactory.getLogger(DropboxCtrl.class);
	
	@RequestMapping(value = "/drop.do",method = RequestMethod.GET)
	public String moveDrop() {
		logger.info("DropboxCtrl DropMatch {}");
		
		return "/proj/dropbox";
	}
	
	@RequestMapping(value = "/dropMatch.do",method = RequestMethod.GET)
	public String DropMatch(HttpSession session) throws CreateFolderErrorException, DbxException {
		logger.info("DropboxCtrl DropMatch {}");
		
//		Metadata.met
		
		int cnt = 0;
		ListFolderResult result = client.files().listFolder("");
		while (true) {
			for (Metadata metadata : result.getEntries()) {
				//TODO 9. 변경점
//                if(metadata.getPathLower().equals("/자두과")) {
				if (metadata.getPathLower().equals("/"+session.getAttribute("projName"))) {
					cnt++;
					break;
				}
			}
			if (!result.getHasMore()) {
				break;
			}
			result = client.files().listFolderContinue(result.getCursor());
		}
//		System.out.println("@@@@@@@@@@        cnt : " + cnt);
		
		if(cnt==0) {
			// TODO 7. 변경점
//			client.files().createFolder("/"+session.getAttribute("projName"));
			client.files().createFolder("/"+session.getAttribute("projName")+"/문서1");
			client.files().createFolder("/"+session.getAttribute("projName")+"/문서2");
			client.files().createFolder("/"+session.getAttribute("projName")+"/문서3");
			client.files().createFolder("/"+session.getAttribute("projName")+"/문서4");
			client.files().createFolder("/"+session.getAttribute("projName")+"/문서5");
		}
		
		return "/proj/dropbox";
	}
	
	@RequestMapping(value = "/dropBaseDown.do",method = RequestMethod.GET)
	public String dropBaseDown() throws DownloadErrorException, DbxException, IOException {
		logger.info("DropboxCtrl dropBaseDown {}");
		//로컬에 폴더 생성 영역
    	String path = "C:\\PROJECTFILE";
    	java.io.File Dropbox = new java.io.File(path);
    	java.io.File DropboxUpload = new java.io.File(path+"\\Upload");
    	
    	if(!Dropbox.exists()) {
    		Dropbox.mkdir();
    	}
    	if(!DropboxUpload.exists()) {
    		DropboxUpload.mkdir();
    	}
        try {
        	for (int i = 1; i < 6; i++) {
        		DbxDownloader<FileMetadata> downloader = client.files().download("/File"+i+".txt");
        		FileOutputStream out = new FileOutputStream("C:\\PROJECTFILE\\File"+i+".txt");
        		downloader.download(out);
        		out.close();
			}
        } catch (DbxException ex) {
            System.out.println(ex.getMessage());
        }
        System.out.println("다운로드 완료");
		
		return "/proj/dropbox";
	}
	
	@RequestMapping(value = "/dropUpload.do",method = RequestMethod.GET)
	public String dropUpload() throws FileNotFoundException, IOException, UploadErrorException, DbxException {
		logger.info("DropboxCtrl dropUpload {}");
		
	// Upload "test.txt" to Dropbox
    // 위에 들어가는 이름이 서버 자체에 있는 이름으로 추적하는건데 상대경로로 잡아서 뽑아주면 될듯.
     
		try (InputStream in = new FileInputStream("C:\\PROJECTFILE\\Upload\\*.txt")) {
     // 아래 들어가는게 내가 저장하는 이름으로 들어가는거
     	FileMetadata metadata = client.files().uploadBuilder("/testYam.txt")
             .uploadAndFinish(in);
     }
		System.out.println("성공띠");
		return "/proj/dropbox";
	}
}
