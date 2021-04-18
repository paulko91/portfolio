package project.file.upload;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.FileVO.FileVO;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController <Resource> {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		/*
		 * Date date = new Date(); DateFormat dateFormat =
		 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		 * 
		 * String formattedDate = dateFormat.format(date);
		 */

		String filename = (String) request.getAttribute("filename");

		System.out.println("------------------->" + filename);

		String dirName = "C:\\tmp";

		File dir = new File(dirName);

		String files[] = dir.list();

		for (String fi : files) {

			System.out.println(fi);
		}

		File[] files2 = dir.listFiles();

		ArrayList arrList = new ArrayList();

		for (File fns : files2) {

			String fileName = fns.getName();

			if (fns.isDirectory()) {

				System.out.println("디렉토리입니다." + fileName);
			} else {

//				System.out.println("파일입니다." + fileName);
//				if(fileName.endsWith(".sys")) {

				System.out.println(fileName + "\t" + (fns.length() / 1024) + "Kbytes입니다.");
//				}

				long fiSize = (long) fns.length() / 1024;

				String fileSize = Long.toString(fiSize);
				FileVO fileVo = new FileVO();
				fileVo.setFileName(fileName);
				fileVo.setFileSize(fileSize + "Kbyte");

				arrList.add(fileVo);

			}
		}

		model.addAttribute("arrList", arrList);

		return "home";
	}
	
	@RequestMapping(value = "/mainupload", method = RequestMethod.POST,
			headers =("content-type=multipart/*")
			)
	public String FileUpload(@RequestParam("mediaFile") MultipartFile mediaFile) throws IllegalStateException, IOException {
		
		File saveFile = new File("C:\\tmp", mediaFile.getOriginalFilename());
		
		mediaFile.transferTo(saveFile);
				
		return "redirect:/";
		
	}
	
	@RequestMapping(value="/filedownload", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(
			@RequestHeader("User-Agent") String userAgent, String filename) throws UnsupportedEncodingException 
	{
		
		Resource resource = (Resource) new FileSystemResource("C:\\tmp\\" + filename);
		
		
		if(((FileSystemResource) resource).exists() == false) {
			
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		
		String resourceName = ((FileSystemResource) resource).getFilename();
		
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		
		
		HttpHeaders headers = new HttpHeaders();

		String downloadName = null;
		if(userAgent.contains("Trident")) {
			
			logger.info("IE browser");
			downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
		} else if(userAgent.contains("Edge")) {
			
			logger.info("Edge browser");
			downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
			
		} else {
			
			logger.info("Chrome brower");
			downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
		}
		
		logger.info("download:" + downloadName);
		
		headers.add("Content-Disposition", "attachment; filename=" + downloadName);
		
		
		return (ResponseEntity<Resource>) 
				new ResponseEntity<FileSystemResource>
		((FileSystemResource) resource,headers,HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST,
			headers = ("content-type=multipart/*")
			)
	public String FileUpload( HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String a, @RequestParam("mediaFile") MultipartFile mediaFile) throws IllegalStateException, IOException
	{
		
			String saveFolder = "C:\\tmp\\"+a;
			File newFolder = new File(saveFolder);
			
			if(!newFolder.exists()) {
				newFolder.mkdir();
			}
			

			File saveFile = new File(newFolder, mediaFile.getOriginalFilename());
			
			mediaFile.transferTo(saveFile);
					
			return "redirect:/";
	}
	
//	@RequestMapping(value = "/upload", method = RequestMethod.POST
//			)
//	public String FileUpload( HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String a, @RequestParam("filename") String fileName) throws IllegalStateException, IOException
//	{
//		
//		String saveFolder = "C:\\tmp\\"+a;
//		File newFolder = new File(saveFolder);
//		
//		if(!newFolder.exists()) {
//			newFolder.mkdir();
//		}
//		
//		Resource resource = (Resource) new FileSystemResource("C:\\tmp\\" + fileName);
//		
//		File saveFile = new File(newFolder, resource.getOriginalFilename());
//		
//		fileName.transferTo(saveFile);
//				
//		return "redirect:/";
//	}
}
