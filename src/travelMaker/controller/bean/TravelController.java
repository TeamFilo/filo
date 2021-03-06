package travelMaker.controller.bean;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.fasterxml.jackson.databind.ObjectMapper;

import travelMaker.model.dto.ChattingDTO;
import travelMaker.model.dto.GalleryDTO;
import travelMaker.model.dto.GroupMemberDTO;
import travelMaker.model.dto.GroupRequestDTO;
import travelMaker.model.dto.GroupSpaceDTO;
import travelMaker.model.dto.ScheduleDTO;
import travelMaker.model.dto.SmallPosDTO;
import travelMaker.model.dto.TmUserDTO;
import travelMaker.model.dto.UserRkDTO;
import travelMaker.service.bean.MemberService;
import travelMaker.service.bean.TravelService;

@Controller
@RequestMapping("/travel/")
public class TravelController {

	@Autowired
	private TravelService travelService = null;
	@Autowired
	private MemberService memberService = null;
	
	/*
	//스케줄러: 날짜(마감일/시작일/종료일)에 따른 여행 상태 변경
	@Scheduled(cron = "0 1 12 * * *")
	public void groupStatusCheck() throws Exception {
		System.out.println("매일 오전 12:01에 호출");
		List list = travelService.getAllGroups();
		DateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date today = sdf.parse(sdf.format(new Date()));
		for(int i=0 ; i<list.size() ; i++) {
			GroupSpaceDTO dto = (GroupSpaceDTO)list.get(i);
		//	1)모든 그룹에 대해 마감일이 되는 시점(closingDate==sysdate)에 해당 그룹의 status==1로 update
			Date cDate = sdf.parse(dto.getClosingDate());
			if(cDate.getTime()<=today.getTime()) {
				travelService.changeGrpStatus(dto.getgNo(), 1);
			}
		//	2)모든 그룹에 대해 여행 시작일이 되는 시점(startDate==sysdate)에 해당 그룹의 status==2로 update
			Date sDate = sdf.parse(dto.getStartDate());
			if(sDate.getTime()<=today.getTime()) {
				travelService.changeGrpStatus(dto.getgNo(), 2);
			}
		//	3)모든 그룹에 대해 여행 종료일이 되는 시점(endDate==sysdate)에 해당 그룹의 status==3으로 update
			Date eDate = sdf.parse(dto.getEndDate());
			if(eDate.getTime()<=today.getTime()) {
				travelService.changeGrpStatus(dto.getgNo(), 3);
			}
		}
	}
	
	//스케줄러: 여행 횟수에 따른 회원 레벨 변경
	@Scheduled(fixedDelay = 1800000)
	public void memberRankCheck() throws Exception {
		System.out.println("회원 레벨 변경 스케줄러- 30분마다 호출["+new Date()+"]");
		List<TmUserDTO> list = memberService.getAllMembers();
		for(int i=0 ; i<list.size() ; i++) {
			TmUserDTO dto = list.get(i);
			if(dto.getTravelCnt()>=10 && dto.getTravelCnt()<25) {
				dto.setRk(2);	//트래블러로
				memberService.updateMember(dto);
			}
			if(dto.getTravelCnt()>=25 && dto.getTravelCnt()<50) {
				dto.setRk(3);	//어드바이저로
				memberService.updateMember(dto);
			}
			if(dto.getTravelCnt()>=50) {
				dto.setRk(4);	//마스터로
				memberService.updateMember(dto);				
			}
		}
	}
	
	//스케줄러: 총평 작성과 공개여부 설정을 모두 마친 그룹의 status를 4로 변경
	@Scheduled(fixedDelay = 30000)
	public void travelEndCheck() throws Exception {
		System.out.println("총평/공개여부 설정 시 그룹 status 변경 체크- 30초마다 호출["+new Date()+"]");
		List<GroupSpaceDTO> list = travelService.getAllGroups();
		for(int i=0; i<list.size(); i++) {
			if((list.get(i).getShared()==1 || list.get(i).getShared()==2) && list.get(i).getGenReview()!=null) {
				travelService.changeGrpStatus(list.get(i).getgNo(), 4);
			}
		}
	}
	*/
	@RequestMapping("makingWrite.fl")
	public String makingWrite(String pageNum, Model model) {
		List posList = memberService.getAllPos();
		model.addAttribute("posList",posList);
		model.addAttribute("pageNum",pageNum);
		return "tm/client/travel/makingWrite";
	}
	
	@RequestMapping("makingWritePro.fl")
	public String makingWritePro(String pageNum, GroupSpaceDTO dto, Model model) throws Exception {
		String idSkin = memberService.getMember(dto.getId()).getIdSkin();
		System.out.println("idSkin:"+idSkin);
		dto.setIdSkin(idSkin);
		travelService.insertMaking(dto);
		model.addAttribute("pageNum",pageNum);
		return "redirect:makingList.fl";
	}
	
	@RequestMapping("makingList.fl")
	public String makingList(String pageNum, HttpServletRequest request, Model model) throws Exception {
		//유저 정보
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		model.addAttribute("id",id);
		UserRkDTO rkInfo = new UserRkDTO();
		if(id!=null) {			
			rkInfo = travelService.getMemRk(id);
		}else if(id==null) {
			rkInfo.setRkNo(0);
			rkInfo.setRkName("비로그인");
		}
		
		//모든 여행 가져와서 상태가 참여 중(1)인 것만 담음
		List<GroupSpaceDTO> jList = travelService.getMyGroups(id,1);
		for(int i=0;i<jList.size();i++) {
			if(jList.get(i).getStatus()>=3) {	//끝났거나 모집취소한 건 제외
				jList.remove(i);
			}
		}					
		
		model.addAttribute("joiningList",jList);
		
		//모든 여행 가져와서 상태가 대기 중(0)인 것만 담음
		List<GroupSpaceDTO> wList = travelService.getMyGroups(id,0);
		for(int i=0;i<wList.size();i++) {
			if(wList.get(i).getStatus()!=0) {	//아직 모집 중인 것만 담아야 하므로
				wList.remove(i);
			}
		}
		
		model.addAttribute("waitingList",wList);
		
		//모집 중인 여행
		Map map = travelService.getArticles(pageNum);
		model.addAttribute("rkInfo",rkInfo);
		model.addAttribute("pageNum",map.get("pageNum"));
		model.addAttribute("pageSize",map.get("pageSize"));
		model.addAttribute("currPage",map.get("currPage"));
		model.addAttribute("start",map.get("start"));
		model.addAttribute("end",map.get("end"));
		model.addAttribute("count",map.get("count"));
		model.addAttribute("number",map.get("number"));
		model.addAttribute("articleList",map.get("articleList"));
		model.addAttribute("startD",map.get("startD"));
		model.addAttribute("endD",map.get("endD"));
		return "tm/client/travel/makingList";
	}
	
	@ResponseBody
	@RequestMapping("listSearch.fl")
	public String listSearch(String pageNum, @RequestBody Map<Object,Object> map) throws Exception {
	//	검색(시작일,종료일)값을 각각 변수에 담아 매개변수로 보내줌
		String startD = (String)map.get("startD");
		String endD = (String)map.get("endD");
		Map listMap = new HashMap();
	//	listMap = travelService.getSearchArticles(pageNum, startD, endD);
		listMap = travelService.getArticles(pageNum);
		ObjectMapper mapper = new ObjectMapper();
	//	String json = mapper.writeValueAsString(listMap);
		String json = mapper.writeValueAsString("startD="+startD+"&endD="+endD);
		return json;
	}
	
	@RequestMapping("makingCont.fl")
	public String makingCont(String pageNum, int gNo, Model model) throws Exception {
		GroupSpaceDTO content = travelService.getContent(gNo);
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int writerGender = travelService.getGender(content.getId());
		int memIdGender = travelService.getGender(id);
		int memStatus = travelService.getMemStatus(gNo, id);
		List posList = new ArrayList();
		SmallPosDTO dto = new SmallPosDTO();
		if(content.getPo1()!=-1) {
			dto = travelService.getPosInfo(content.getPo1());
			posList.add(dto.getPosName());
		}
		if(content.getPo2()!=-1) {
			dto = travelService.getPosInfo(content.getPo2());
			posList.add(dto.getPosName());			
		}
		if(content.getPo3()!=-1) {
			dto = travelService.getPosInfo(content.getPo3());
			posList.add(dto.getPosName());			
		}
		//시작일, 종료일, 마감일 DATE 타입으로 변환해서 보내주기
		DateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date sDate = sdf.parse(content.getStartDate());
		Date eDate = sdf.parse(content.getEndDate());
		Date cDate = sdf.parse(content.getClosingDate());
		Date today = sdf.parse(sdf.format(new Date()));

		long endStartGap = (eDate.getTime()-sDate.getTime())/(24*60*60*1000);
		long closeTodayGap = (cDate.getTime()-today.getTime())/(24*60*60*1000);
		
		model.addAttribute("esGap",endStartGap);
		model.addAttribute("ctGap",closeTodayGap);
		
		model.addAttribute("posList",posList);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("content",content);
		model.addAttribute("writerGender",writerGender);
		model.addAttribute("id",id);
		model.addAttribute("memIdGender",memIdGender);
		model.addAttribute("memStatus",memStatus);
		return "tm/client/travel/makingCont";
	}
	
	@RequestMapping("makingDel.fl")
	public String makingDel(int gNo) throws Exception {
		travelService.deleteContent(gNo);
		return "redirect:makingList.fl";
	}
	
	@RequestMapping("makingReq.fl")
	public String makingReq(int gNo, Model model) throws Exception {
		GroupSpaceDTO content = travelService.getContent(gNo);
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		Map<String, Integer> map = travelService.getUserPos(id);
		//지원자 포지션
		SmallPosDTO posInfo1 = travelService.getPosInfo(map.get("pos1"));
		SmallPosDTO posInfo2 = travelService.getPosInfo(map.get("pos2"));
		//모집 포지션
		SmallPosDTO dto = new SmallPosDTO();
		List posList = new ArrayList();
		if(content.getPo1()!=-1) {
			dto = travelService.getPosInfo(content.getPo1());
			posList.add(dto.getPosName());
		}
		if(content.getPo2()!=-1) {
			dto = travelService.getPosInfo(content.getPo2());
			posList.add(dto.getPosName());			
		}
		if(content.getPo3()!=-1) {
			dto = travelService.getPosInfo(content.getPo3());
			posList.add(dto.getPosName());			
		}
		
		model.addAttribute("posList",posList);
		model.addAttribute("content",content);
		model.addAttribute("id",id);
		model.addAttribute("pos1",map.get("pos1"));
		model.addAttribute("pos2",map.get("pos2"));
		model.addAttribute("posInfo1",posInfo1);
		model.addAttribute("posInfo2",posInfo2);
		return "tm/client/travel/makingReq";
	}
	
	@RequestMapping("makingReqPro.fl")
	public String makingReqPro(GroupRequestDTO dto) throws Exception {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		dto.setId(id);
		//신청 처리하기
		travelService.applyForGroup(dto);
		return "redirect:makingList.fl";	
	}
	
	@RequestMapping("groupSpace.fl")
	public String groupSpace(int gNo, String shared, Model model) throws Exception {
		//그룹 방에 필요한 것: ①개설자가 볼 신청자 목록 ②현재 멤버 리스트 ③채팅 ④일정 ⑤갤러리 ⑥그룹 상태
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int idStatus = travelService.getMemStatus(gNo, id);
		//gNo 주고 해당 개설자 ID 가져오기(groupSpace테이블)
		GroupSpaceDTO grpSpace = travelService.getContent(gNo);
		String leader = grpSpace.getId();
		List grpMem = travelService.getMembers(gNo);
		List grpReq = travelService.getRequests(gNo);
		//groupMember status가 0인 레코드만 뽑아서 groupRequest 정보를 담아 신청자 명단에 사용
		List<GroupRequestDTO> awaiters = new ArrayList<GroupRequestDTO>();
		for(int i=0;i<grpReq.size();i++) {
			GroupRequestDTO req = (GroupRequestDTO)grpReq.get(i);
			int status = travelService.getMemStatus(gNo, req.getId());
			if(status==0) {
				awaiters.add(req);
			}
		}
		
		//새로들어온 신청에서 신청포지션 이름 보여주기위함
		List posName = new ArrayList();
		for(int i=0; i< awaiters.size(); i++) {
			if(((GroupRequestDTO)awaiters.get(i)).getPosNo() != -1) {
				SmallPosDTO grpReqPos = travelService.getPosInfo(((GroupRequestDTO)awaiters.get(i)).getPosNo());
				posName.add(grpReqPos);   //(포스번호, 포스이름)
			}
		}
		
		//jbr여기부터...
		//status = 1 인 멤버들의 그룹리퀘스트dto
		List<GroupRequestDTO> joinMem = new ArrayList<GroupRequestDTO>();
		for(int i=0;i<grpReq.size();i++) {
			GroupRequestDTO req = (GroupRequestDTO)grpReq.get(i);
			int status = travelService.getMemStatus(gNo, req.getId());
			if(status==1) {
				joinMem.add(req);
			}
		}
		
		//joinMem의 posNo를 리스트에 담는다
		List<Integer> posList = new ArrayList<Integer>();
		System.out.println("조인멤 for 밖" + joinMem);
		for(int i = 0; i < joinMem.size(); i++) {
			System.out.println("조인멤 for 안" + joinMem);
			posList.add(((GroupRequestDTO)joinMem.get(i)).getPosNo());
		}
		
		//중복제거..
		HashSet posListFin = new HashSet();
		posListFin.addAll(posList);
		posList.clear();
		posList.addAll(posListFin);
		Map map = new HashMap();
		Map posMem = new HashMap(); 
		
		System.out.println("포스리스트" +posList);
		
			for(int i = 0; i < posList.size(); i++) { 
				if(posList.get(i) != null) {
					if(posList.get(i) == -1) {   //포지션에 번호가 -1 이면
						int nomalCnt = travelService.posCount(gNo,posList.get(i));
					//	System.out.println("일반 :" + nomalCnt + "명");
						posMem.put("일반",nomalCnt);
					}else { //그게아니면
						SmallPosDTO dto = travelService.getPosInfo(posList.get(i));
					//	System.out.println(i + "번째 dto : " + dto.getPosName());
						int posCnt = travelService.posCount(gNo,posList.get(i));
					//	System.out.println( posList.get(i) + "번 "+ dto.getPosName() + "포지션 :" + posCnt + "명");
						posMem.put(dto.getPosName(),posCnt);
					}
				}
			}
			
		//가이드 수 카운트
		List memListFin = new ArrayList<GroupRequestDTO>();
		memListFin = travelService.memListFin(gNo);
		int guideCnt = 0;
		
		for(int i=0; i<memListFin.size(); i++) {
			if(((GroupRequestDTO)memListFin.get(i)).getReqType() == 1) {
				guideCnt = guideCnt + 1; 
			}
		}
		System.out.println("가이드카운트" + guideCnt);
		
		model.addAttribute("guideCnt",guideCnt);
		model.addAttribute("memListFin",memListFin);
			
			
		//jbr여기까지...
		
		//시작일, 종료일, 마감일 DATE 타입으로 변환해서 보내주기
		DateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date sDate = sdf.parse(grpSpace.getStartDate());
		Date eDate = sdf.parse(grpSpace.getEndDate());
		Date cDate = sdf.parse(grpSpace.getClosingDate());
		Date today = sdf.parse(sdf.format(new Date()));
		long endStartGap = (eDate.getTime()-sDate.getTime())/(24*60*60*1000);		//시작일과 종료일 사이의 갭
		long closeTodayGap = (cDate.getTime()-today.getTime())/(24*60*60*1000);		//오늘 날짜와 마감일 사이의 갭
		model.addAttribute("esGap",endStartGap);
		model.addAttribute("ctGap",closeTodayGap);
		
		//시작일과 종료일 사이의 날짜들을 배열에 담아 보내주기
		Calendar cal = Calendar.getInstance();
		cal.setTime(sDate);
		cal.add(Calendar.DATE, -1);	//시작일부터
		List dateList = new ArrayList();
		for(long i=0 ; i<=endStartGap ; i++) {
			cal.add(Calendar.DATE, 1);
			dateList.add(sdf.format(cal.getTime()));
		}
		model.addAttribute("dateList",dateList);
		
		//일정
		List scheList = travelService.getSchedule(gNo);
		
		//갤러리
		List gList = travelService.getGroupImgs(gNo);
		model.addAttribute("gList",gList);
		
		//채팅
		List chatList = travelService.getChats(gNo);
		model.addAttribute("chatList",chatList);
		
		//총평
		List<GroupMemberDTO> reviewList = travelService.getReview(gNo);
	
		//본인이 평 입력했는지 확인
		int result = travelService.chReview(gNo, id);		
		GroupSpaceDTO getGroup = travelService.getGroup(gNo);
		
		//공개여부 업데이트
		
		System.out.println("shared값 :" + shared);
		/*if(shared == null) {
			System.out.println("쉐어드 너 설마 여기타니?");
			shared = "";
		}
		*/
		
		if("1".equals(shared) || "2".equals(shared)) {
			travelService.updateShared(gNo, Integer.parseInt(shared));
			int sharedResult = grpSpace.getShared();
			model.addAttribute("sharedResult",sharedResult);
		}
		
		model.addAttribute("posName", posName);
		model.addAttribute("getGroup",getGroup);
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("result",result);
		model.addAttribute("scheList",scheList);
		model.addAttribute("posMem",posMem);
		model.addAttribute("gNo",gNo);
		model.addAttribute("awaiters",awaiters);
		model.addAttribute("id",id);
		model.addAttribute("idStatus",idStatus);
		model.addAttribute("grpSpace",grpSpace);
		model.addAttribute("leader",leader);
		model.addAttribute("grpMem",grpMem);
		model.addAttribute("grpReq",grpReq);
		return "tm/client/travel/groupSpace";
	}
	
	@ResponseBody
	@RequestMapping("accepted.fl")
	public String accepted(@RequestBody Map<Object,Object> map) throws Exception {
		String requestId = (String)map.get("requestId");
		int gNo = Integer.parseInt((String)map.get("gNo"));
		System.out.println(requestId);
		System.out.println(gNo);
		//gNo에 신청한 ID를 그룹에 참여 처리 && groupSpace테이블에 actualNum +1 처리
		boolean result = travelService.acceptOrReject(requestId, gNo, 1);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(result);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("rejected.fl")
	public String rejected(@RequestBody Map<Object,Object> map) throws Exception {
		String requestId = (String)map.get("requestId");
		int gNo = Integer.parseInt((String)map.get("gNo"));
		System.out.println(requestId);
		System.out.println(gNo);
		//gNo에 신청한 ID를 그룹에 거절 처리
		travelService.acceptOrReject(requestId, gNo, 2);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(requestId);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("sendChat.fl")
	public String sendChat(@RequestBody Map<Object, Object> map) throws Exception {
		String writer = (String)map.get("writer");
		int gNo = Integer.parseInt((String)map.get("gNo"));
		String cont = (String)map.get("cont");
		travelService.sendChat(gNo, writer, cont);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(map);
		return json;
	}

	@ResponseBody
	@RequestMapping("showChat.fl")
	public String showChat(@RequestBody int gNo) throws Exception {
		List chatList = travelService.getChats(gNo);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(chatList);
		System.out.println();
		return json;
	}
	
	@RequestMapping("uploadPro.fl")
	public String uploadPro(MultipartHttpServletRequest request) throws Exception {
												//ServletContext context
		MultipartFile mf = null;
		String finalName = null;
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			mf = request.getFile("img");
			long size = mf.getSize();
			String orgName = mf.getOriginalFilename();							//sample.jpg
			String imgName = orgName.substring(0, orgName.lastIndexOf('.'));	//sample
			String ext = orgName.substring(orgName.lastIndexOf('.'));
			long date = System.currentTimeMillis();
			finalName = imgName+date+ext;										//sample1616999640437.jpg

			String path = request.getRealPath("save");
			String imgPath = path+"\\"+finalName;
			File copyFile = new File(imgPath);					//D:\yoonseohuh\framework\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\travelMaker\save\sample1616999640437.jpg
			mf.transferTo(copyFile);
			System.out.println(copyFile);
			
			/*서버 폴더에 저장된 이미지 복사해서 github에 공유하는 workspace에도 넣기
			fis = new FileInputStream(copyFile);
			fos = new FileOutputStream(new File("D:\\yoonseohuh\\framework\\workspace\\travelMaker\\tmGallery\\"+finalName));
			int readBuffer = 0;
            byte [] buffer = new byte[(int)copyFile.length()];
            System.out.println(copyFile.length());
            while((readBuffer = fis.read(buffer))!=-1) {
                fos.write(buffer, 0, readBuffer);
            }
            fis.close();
            fos.close();
            */
			//DB에 저장
			GalleryDTO dto = new GalleryDTO();
			dto.setgNo(Integer.parseInt(request.getParameter("gNo")));
			dto.setWriter(request.getParameter("writer"));
			dto.setpRoot(finalName);
			travelService.uploadImage(dto);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		String gNo = request.getParameter("gNo");
		return "redirect:groupSpace.fl?gNo="+gNo;
	}
	
	@RequestMapping("gallery.fl")
	public String gallery(int gNo, Model model) throws Exception {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int idStatus = travelService.getMemStatus(gNo, id);
		GroupSpaceDTO grp = travelService.getContent(gNo);
		List list = travelService.getGroupImgs(gNo);
		
	/*	Gallery테이블									| GalleryLiked테이블
		gNo | pNo | writer | pRoot | likedCnt | reg | +id가 좋아요 했는지 여부
		각 레코드를 하나의 Map으로 담아서 그 전체를 List로 묶기							*/
		GalleryDTO dto = new GalleryDTO();
		List<Map> finList = new ArrayList<Map>();
		for(int i=0 ; i<list.size() ; i++) {
			Map gMap = new HashMap();
			dto = (GalleryDTO)list.get(i);
			gMap.put("gNo",dto.getgNo());
			gMap.put("pNo",dto.getpNo());
			gMap.put("writer",dto.getWriter());
			gMap.put("pRoot",dto.getpRoot());
			gMap.put("likedCnt",dto.getLikedCnt());
			gMap.put("reg",dto.getReg());
			int count = travelService.likedCount(id, dto.getpNo());
			gMap.put("isLiked",count);
			finList.add(gMap);
		}
		model.addAttribute("finList",finList);
		model.addAttribute("idStatus",idStatus);
		model.addAttribute("grp",grp);
		model.addAttribute("list",list);
		return "tm/client/travel/gallery";
	}
	
	@ResponseBody
	@RequestMapping("galleryLiked.fl")
	public String galleryLiked(@RequestBody Map<Object, Object> map) throws Exception {
		String id = (String)map.get("id");
		int gNo = Integer.parseInt((String)map.get("gNo"));
		int pNo = Integer.parseInt((String)map.get("pNo"));
		//좋아요 처리
		travelService.imgLiked(id,gNo,pNo);
		//(메서드 재활용을 위해) 해당 그룹의 이미지 정보 전체를 담아와서 좋아요 된 pNo의 레코드만 res라는 DTO에 담아 리턴
		GalleryDTO res = new GalleryDTO();
		List wholeList = travelService.getGroupImgs(gNo);
		for(int i=0 ; i<wholeList.size() ; i++){
			GalleryDTO dto = (GalleryDTO)wholeList.get(i);
			if(pNo==dto.getpNo()){
				res = dto;
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(res);
		return json;
	}

	@ResponseBody
	@RequestMapping("galleryLikedCancel.fl")
	public String galleryLikedCancel(@RequestBody Map<Object, Object> map) throws Exception {
		String id = (String)map.get("id");
		int gNo = Integer.parseInt((String)map.get("gNo"));
		int pNo = Integer.parseInt((String)map.get("pNo"));
		//좋아요 취소 처리
		travelService.imgLikedCancel(id,gNo,pNo);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString("좋아요 취소");
		return json;
	}
	
	@RequestMapping("schedulePro.fl")
	public String schedulePro(int gNo, String sDate, String sCont) throws Exception {
		travelService.insertSchedule(gNo, sDate, sCont);
		return "redirect:groupSpace.fl?gNo="+gNo;
	}
	
	@RequestMapping("scheduleModi.fl")
	public String scheduleModi(ScheduleDTO dto) throws Exception {
		travelService.updateSchedule(dto);
		return "redirect:groupSpace.fl?gNo="+dto.getgNo();
	}
	
	@RequestMapping("scheduleDel.fl")
	public String scheduleDel(int gNo, int sNo) throws Exception {
		travelService.deleteSchedule(sNo);
		return "redirect:groupSpace.fl?gNo="+gNo;
	}
	
	@ResponseBody
	@RequestMapping("changeStatus.fl")
	public String changeStatus(@RequestBody Map<String, Integer> map) throws Exception {
		//넘어오는 status 값으로 변경
		int gNo = map.get("gNo");
		int status = map.get("status");
		travelService.changeGrpStatus(gNo,status);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(map);
		return json;
	}
	
	//개설자 총평작성
	@RequestMapping("genReviewPro.fl")
	public String genReviewPro(String id, String gNo, String genReview, Model model) throws Exception {
		travelService.genReview(id, Integer.parseInt(gNo), genReview);
		int gNoInt = Integer.parseInt(gNo);
		GroupSpaceDTO space = travelService.getGroup(gNoInt);
		String leader = space.getId();
		
	//	총평 작성하는 시점에 참여자들의 travelCnt를 +1
		List<GroupMemberDTO> list = travelService.getMembers(gNoInt);
		for(int i=0;i<list.size();i++) {
			int status = travelService.getMemStatus(gNoInt, list.get(i).getId());
			if(status==1) {
				memberService.updateTravelCnt(list.get(i).getId(), 1);
			}
		}
		
		model.addAttribute("gNo", Integer.parseInt(gNo));
		return "tm/client/travel/genReviewPro";
	}
	
	
	//그룹멤버 총평댓입력
	@RequestMapping("genReplyPro.fl")
	public String genReplyPro(String id, String gNo, String genReply, Model model) {
		travelService.genReply(id, Integer.parseInt(gNo), genReply);
		
		
		model.addAttribute("gNo", Integer.parseInt(gNo));
		return "tm/client/travel/genReplyPro";
	}
	
}
