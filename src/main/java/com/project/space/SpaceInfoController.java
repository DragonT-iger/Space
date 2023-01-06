package com.project.space;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.space.domain.Space_InfoVO;
import com.project.space.spaceinfo.service.SpaceInfoService;

@Controller
public class SpaceInfoController {
	
	@Inject
    private SpaceInfoService spaceinfoservice;


    //httpservlet 객체받아서 login한 사용자의 id를 받는다
    private static final Logger logger = LoggerFactory.getLogger(SpaceInfoController.class);
    @PostMapping("/spaceInsert")
    public String spaceInfo(Model m, @ModelAttribute Space_InfoVO vo, BindingResult br, @RequestParam("simage") List<MultipartFile> simage , HttpServletRequest req) throws IOException{        
        logger.info("spaceInsert:"+vo);
        br.getFieldError();

        // 유효성 검사 (SNAME)
        if(vo.getSname()==null||vo.getSname().trim().isEmpty()) {
            logger.info("공간명 입력안함");
            return "Home";
        }
		ServletContext app=req.getServletContext();

		String upDir=app.getRealPath("/resources/SpaceInfoImg");  //context를 기준으로 절대경로 구하기
		logger.info("upDir: "+upDir);

        
		
		File dir=new File(upDir);
		if(!dir.exists()) {  //업로드 디렉토리 생성
			dir.mkdirs();  //디렉토리가 여러 계층에 있는 경우 dirs
		}

        File image1 = new File(upDir + "/" + vo.getSimage1());
        File image2 = new File(upDir + "/" + vo.getSimage2());
        File image3 = new File(upDir + "/" + vo.getSimage3());
        File image4 = new File(upDir + "/" + vo.getSimage4());

        if(image1.exists()){
            image1.delete();
        }
        if(image2.exists()){
            image2.delete();
        }
        if(image3.exists()){
            image3.delete();
        }
        if(image4.exists()){
            image4.delete();
        }

		//2. 업로드 처리
		if(simage!=null) {
			for(int i=0;i<simage.size();i++) {
				MultipartFile mfile=simage.get(i);
				if(!mfile.isEmpty()) {
					try {
						//업로드 처리 성공
						mfile.transferTo(new File(upDir,mfile.getOriginalFilename()));
						if(i==0) {
							vo.setSimage1(mfile.getOriginalFilename());
						}else if(i==1) {
							vo.setSimage2(mfile.getOriginalFilename());
						}else if(i==2) {
							vo.setSimage3(mfile.getOriginalFilename());
						}else if(i==3) {
                            vo.setSimage4(mfile.getOriginalFilename());
                        }
					} catch (IOException e) {
						logger.error("파일 업로드 실패: "+e);
					}
				}//if
			}//for
		}
        

        
		

        

        //for test
        vo.setUserid("2");
        vo.setH_code(1);
        
        // if(spaceinfoservice.selectByUserid(vo.getUserid())==null) {
        // }else 
            
        
        logger.info("업로드 이후 product: "+vo);

        if(spaceinfoservice.selectByUserid(vo.getUserid())!=null) {
            logger.info("이미 등록된 공간이 있습니다.");
            logger.info("기존 공간을 덮어 씁니다");
            int n = spaceinfoservice.SpaceInfoUpdate(vo);
            logger.info("공간등록 성공여부:"+n);

            
            //return "redirect:ajax/OwnerPage/MySpaceInsert";
            return "Home";
        }else {
            int n = spaceinfoservice.SpaceInfoInsert(vo);
            logger.info("공간등록 성공여부:"+n);

            
            //return "redirect:ajax/OwnerPage/MySpaceInsert";
            return "Home";
        }
        
    }
    


    @GetMapping(value = "/MySpaceInfoView")
    public String SpaceInfoView(Model m , @RequestParam int snum) {
        logger.info("connected MySpaceInfoView.");

        List<Space_InfoVO> sivolist = spaceinfoservice.getSpaceInfoAll();
		
        m.addAttribute("spaceArr", sivolist);

        m.addAttribute("hashtag",spaceinfoservice.selectByh_code(spaceinfoservice.selectBySnum(snum).getH_code()));

        m.addAttribute("spaceinfo",spaceinfoservice.selectBySnum(snum));
        return "ajax/OwnerPage/MySpaceInfoView";
    }

    @GetMapping("/MySpaceInsert")
	public String mySpaceEdit(Model m /* ,  @RequestParam String userid */) {
    	
        //for test
        String userid = "1";

        m.addAttribute("ex_spaceinfo",spaceinfoservice.selectByUserid(userid));
		return "ajax/OwnerPage/MySpaceInsert";
	}
}
