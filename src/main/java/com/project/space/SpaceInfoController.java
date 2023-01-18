package com.project.space;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.space.domain.Mem_InfoVO;
import com.project.space.domain.Space_InfoVO;
import com.project.space.spaceinfo.service.SpaceInfoService;


@Controller
public class SpaceInfoController {
	
	@Inject
    private SpaceInfoService spaceinfoservice;


    //httpservlet 객체받아서 login한 사용자의 id를 받아옴
    private static final Logger logger = LoggerFactory.getLogger(SpaceInfoController.class);
    @PostMapping("/owner/spaceInsert")
    public String spaceInfo(Model m, HttpSession session ,@ModelAttribute Space_InfoVO vo, BindingResult br,@RequestParam("simage") List<MultipartFile> simage , HttpServletRequest req) throws IOException{        
        logger.info("spaceInsert:"+vo);
        br.getFieldError();


        
        // 유효성 검사 (SNAME)
        if(vo.getSname()==null||vo.getSname().trim().isEmpty()) {
            logger.info("공간명 입력안함");
            return "redirect:/owner/MySpaceInsert";
        }
		ServletContext app=req.getServletContext();

		String upDir=app.getRealPath("/resources/SpaceInfoImg");  //context를 기준으로 절대경로 구하기
		logger.info("upDir: "+upDir);

   
		
		File dir=new File(upDir);
		if(!dir.exists()) {  //업로드 디렉토리 생성
			dir.mkdirs();  //디렉토리가 여러 계층에 있는 경우 dirs
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

        
        //session에서 id값 받아오기
        String userid = ((Mem_InfoVO)session.getAttribute("loginUser")).getUserid();
        vo.setUserid(userid);
        vo.setScontents(vo.getScontents().replace("\r\n", "<br>"));
        vo.setSrule(vo.getSrule().replace("\r\n", "<br>"));
        //만약 simage1이 null이라면 기존에 있던 이미지를 그대로 유지

        Space_InfoVO origin_svo = spaceinfoservice.selectByuseridSname(userid, vo.getSname());


        try{
            if(vo.getSimage1()==null) {
                vo.setSimage1(origin_svo.getSimage1());
            }
        }catch(NullPointerException e) {
            logger.info("simage1이 null이므로 기존 이미지 유지");
        }
        try{
            if(vo.getSimage2()==null) {
                vo.setSimage2(origin_svo.getSimage2());
            }
        }catch(NullPointerException e) {
            logger.info("simage2이 null이므로 기존 이미지 유지");
        }
        try{
            if(vo.getSimage3()==null) {
                vo.setSimage3(origin_svo.getSimage3());
            }
        }catch(NullPointerException e) {
            logger.info("simage3이 null이므로 기존 이미지 유지");
        }
        try{
            if(vo.getSimage4()==null) {
                vo.setSimage4(origin_svo.getSimage4());
            }
        }catch(NullPointerException e) {
            logger.info("simage4이 null이므로 기존 이미지 유지");
        }            
        
        logger.info("업로드 이후 product: "+vo);
        

        //공간 이름이 중복되는지 확인하고 중복된다면 update, 중복되지 않는다면 insert

        if(spaceinfoservice.GetAllSpaceNameByUserid(userid).contains(vo.getSname())) {
            logger.info("이미 등록된 공간이 있습니다.");
            logger.info("기존 공간을 덮어 씁니다");
            int n = spaceinfoservice.SpaceInfoUpdate(vo);
            logger.info("공간등록 성공여부:"+n);
            return "redirect:/owner/MySpaceList";
        }else {
            int n = spaceinfoservice.SpaceInfoInsert(vo);
            logger.info("공간등록 성공여부:"+n);
            return "redirect:/owner/MySpaceList";
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

    @GetMapping("/owner/MySpaceInsert")
	public String mySpaceEdit(Model m , HttpSession session) {
        

        String userid = ((Mem_InfoVO)session.getAttribute("loginUser")).getUserid();
        
        m.addAttribute("hashtag", spaceinfoservice.getHashTagAll());
        m.addAttribute("ex_spaceinfo",spaceinfoservice.selectByUserid(userid));
		return "ajax/OwnerPage/MySpaceInsert";
	}




    @RequestMapping("/owner/spaceInsertAjax")
    @ResponseBody
    public Space_InfoVO spaceInsertAjax(@RequestParam String userid, @RequestParam String sname) {
        logger.info("sname:"+sname);
        Space_InfoVO vo = spaceinfoservice.selectByuseridSname(userid, sname);

        vo.setScontents(vo.getScontents().replace("<br>", "\r\n"));
        vo.setSrule(vo.getSrule().replace("<br>", "\r\n"));
        return vo;
    }

    
	@GetMapping("/owner/MySpaceList")
	public String mySpaceList(Model m, HttpSession session) {

        String userid = ((Mem_InfoVO)session.getAttribute("loginUser")).getUserid();

        List<Space_InfoVO> sivolist = spaceinfoservice.selectByUserid(userid);

        m.addAttribute("spaceinfo", sivolist);
        		
		return "ajax/OwnerPage/MySpaceList";
	}

    @PostMapping("/owner/MySpaceDelete")
    public String mySpaceDelete(@RequestParam String sname, HttpSession session) {
        String userid = ((Mem_InfoVO)session.getAttribute("loginUser")).getUserid();
        spaceinfoservice.deleteBySname(sname, userid);

        return "redirect:/owner/MySpaceList";
    }

    @PostMapping("/owner/spaceinfodelete")
    public String spacedelete(@RequestParam String sname, HttpSession session) {
        String userid = ((Mem_InfoVO)session.getAttribute("loginUser")).getUserid();

        
        int i = spaceinfoservice.deleteBySname(userid, sname);

        if(i==1) {
            logger.info("공간 삭제 성공");
            return "redirect:/owner/MySpaceList";
        }else {
            logger.info("공간 삭제 실패");
            return "redirect:/owner/MySpaceInsert";
        }
    }
    
}
