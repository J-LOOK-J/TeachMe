package bit.data.controller;

import bit.data.dto.LectureDto;
import bit.data.dto.UserDto;
import bit.data.dto.UserLecJoinDto;
import bit.data.service.LecDetailServiceInter;
import bit.data.service.LectureServiceInter;
import bit.data.service.UserServiceInter;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import util.ChangeName;

import java.sql.SQLOutput;
import java.util.List;

@Controller
public class ManagerController {
    @Autowired
    LectureServiceInter lectureService;
    @Autowired
    LecDetailServiceInter lecDetailService;
    @Autowired
    UserServiceInter userService;

    //메뉴에서 회원관리 클릭 시 회원 목록 출력
    @GetMapping("/userlist")
    public String getUserList(@RequestParam(defaultValue = "1") int currentPage,
                              @RequestParam(value = "searchword", required = false) String sw, //value: userlist의 name(url에서 ? 뒤에 오는 텍스트)과 일치 시킬 것 String 변수명이 일치되면 value는 생략가능
                              Model model){
        int totalCount = userService.getUserTotalCount(sw);
        int perPage=10;//한 페이지 당 보여질 글의 갯수
        int perBlock=5;//한 블럭당 보여질 페이지의 갯수
        int startNum;//db에서 가져올 글의 시작번호(mysql은 첫글이 0번,오라클은 1번)
        int startPage;//각 블럭당 보여질 시작페이지
        int endPage;//각 블럭당 보여질 끝페이지
        int totalPage;//총 페이지수
        int no;//각 페이지 당 출력할 시작번호

        //총 페이지수를 구한다
        //총글의 개수/한페이지 당 보여질 개수로 나눔 (7/5=1)
        //나머지가 1이라도 있으면 무조건 1페이지 추가 (1+1=2페이지가 필요)
        totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

        //각 블럭 당 보여질 시작페이지
        //perBlock=5 일 경우 현재페이지가 1~5 일 경우는 시작페이지가 1, 끝페이지가 5
        //만약 현재페이지가 13 일 경우는 시작페이지가 11, 끝페이지가 15
        startPage=(currentPage-1)/perBlock*perBlock+1;
        endPage=startPage+perBlock-1;
        //총페이지수가 23개일 경우 마지막 블럭은 끝페이지가 25가 아니라 23이라야한다
        if(endPage>totalPage){
            endPage=totalPage;
        }

        //각 페이지에서 보여질 시작번호
        //예: 1페이지->0, 2페이지:5, 3페이지 : 10...
        startNum=(currentPage-1)*perPage;

        //각페이지당 출력할 시작번호 구하기
        //예: 총글갯수가 23이라면  1페이지는 23,2페이지는 18,3페이지는 13...
        no=totalCount-(currentPage-1)*perPage;
        List<UserDto> list = userService.getUserList(sw, startNum, perPage);

        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", totalPage);

        return "/manager/manager/userList";

    }

    //회원관리에서 돋보기 아이콘 클릭 시 회원상세정보로 이동
    @GetMapping("/userdetail")
    public ModelAndView userDetail(int usernum){
        ModelAndView mview = new ModelAndView();
        UserDto userdto = userService.getUserDetailbyManager(usernum);
        List<UserLecJoinDto> joinlist = userService.getUserLecJoin(usernum);
//        System.out.println(joinlist.get(10).getLecdenum());
        mview.addObject("userdto", userdto);
        mview.addObject("joinlist", joinlist);

        mview.setViewName("/manager/manager/userDetail");
        return mview;
    }

    //회원 정보 수정폼으로 가기
    @GetMapping("/updateuserform")
    public ModelAndView updateUserForm(int usernum){
        ModelAndView mview = new ModelAndView();

        UserDto dto = userService.getUserDetailbyManager(usernum);

//        DB(type:date)에서 timestamp로 불러올 때 형식 변경해서 읽을 수 있게 해주기
//        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//        dto.setBirthday(sdf.format(dto.getBirth()));
//        System.out.println("birth:"+dto.getBirthday());

        mview.addObject("dto", dto);

        mview.setViewName("/manager/manager/updateUserForm");
        return mview;
    }

    //회원 정보 수정 후 회원 목록으로 이동
    @PostMapping("/updateuser")
    public String updateUser(UserDto dto, MultipartFile uploadphoto, HttpServletRequest request){

        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
        System.out.println(path); //저장되는 실제 경로 확인
        String photo = uploadphoto.getOriginalFilename(); //photo는 실제 파일명
        System.out.println(uploadphoto.getOriginalFilename()); //실제 파일명 확인
        if(uploadphoto.getOriginalFilename().equals("")) {
            dto.setUserphoto(null);
        } else {
            //String newName = ChangeName.getChangeFileName(upload.getOriginalFilename()); //파일 이름을 시간으로 변경할 때 사용
            try {
                uploadphoto.transferTo(new File(path + "/" + photo));
                dto.setUserphoto(photo);
            } catch (IllegalStateException | IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        userService.updateUser(dto);
        return "redirect:userlist";
    }

    @GetMapping("/deleteuser")
    public String deleteUser(int usernum){
        userService.deleteUser(usernum);
        return "redirect:userlist";
    }

    @GetMapping("/deleteuserphoto")
    public String deleteUserPhoto(int usernum){
        userService.deleteUserPhoto(usernum);
        return "redirect:userlist";
    }

    //강좌 목록 출력
    @GetMapping("/lecturelist")
    public String getLecturelist(@RequestParam(defaultValue = "1") int currentPage,
                                 @RequestParam(value = "searchcolomn", required = false) String sc,
                                 @RequestParam(value = "searchword", required = false) String sw,
                                 Model model) { //강의 목록 출력
        int totalCount = lectureService.getTotalLectureCount(sc,sw);
        int perPage=12;//한 페이지 당 보여질 글의 갯수
        int perBlock=5;//한 블럭당 보여질 페이지의 갯수
        int startNum;//db에서 가져올 글의 시작번호(mysql은 첫글이 0번,오라클은 1번)
        int startPage;//각 블럭당 보여질 시작페이지
        int endPage;//각 블럭당 보여질 끝페이지
        int totalPage;//총 페이지수
        int no;//각 페이지 당 출력할 시작번호

        //총 페이지수를 구한다
        //총글의 개수/한페이지 당 보여질 개수로 나눔 (7/5=1)
        //나머지가 1이라도 있으면 무조건 1페이지 추가 (1+1=2페이지가 필요)
        totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

        //각 블럭 당 보여질 시작페이지
        //perBlock=5 일 경우 현재페이지가 1~5 일 경우는 시작페이지가 1, 끝페이지가 5
        //만약 현재페이지가 13 일 경우는 시작페이지가 11, 끝페이지가 15
        startPage=(currentPage-1)/perBlock*perBlock+1;
        endPage=startPage+perBlock-1;
        //총페이지수가 23개일 경우 마지막 블럭은 끝페이지가 25가 아니라 23이라야한다
        if(endPage>totalPage){
            endPage=totalPage;
        }

        //각 페이지에서 보여질 시작번호
        //예: 1페이지->0, 2페이지:5, 3페이지 : 10...
        startNum=(currentPage-1)*perPage;

        //각페이지당 출력할 시작번호 구하기
        //예: 총글갯수가 23이라면  1페이지는 23,2페이지는 18,3페이지는 13...
        no=totalCount-(currentPage-1)*perPage;
        List<LectureDto> list = lectureService.getLectureList(sc, sw, startNum, perPage);

        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", totalPage);

        return "/manager/manager/lectureList";
    }

    //강의 등록 폼으로 이동
    @GetMapping("/addlectureform")
    public String addLecture(){
        return "/manager/manager/addLectureForm";
    }

    //강의 등록 후 강의 리스트로 이동
    @PostMapping("/insertlecture")
    public String insertLecture(LectureDto dto, MultipartFile photoupload, HttpServletRequest request) {
        //사진이 여러개일 때는 MultipartFile을 List로 가져와야함
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
        System.out.println(path); //저장되는 실제 경로 확인
        String photo = photoupload.getOriginalFilename(); //photo는 실제 파일명
        System.out.println(photoupload.getOriginalFilename()); //실제 파일명 확인
        if(photoupload.getOriginalFilename().equals("")) {
            dto.setLecphoto("no");
        } else {
            //String newName = ChangeName.getChangeFileName(upload.getOriginalFilename()); //파일 이름을 시간으로 변경할 때 사용
            try {
               photoupload.transferTo(new File(path + "/" + photo));
               dto.setLecphoto(photo);
            } catch (IllegalStateException | IOException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
       }
        lectureService.insertLecture(dto);
        return "redirect:lecturelist";
    }

    //    이번달에 개설된 강의 총 수 반환
    @GetMapping("/manager/totalLectureCount")
    @ResponseBody
    public int getLecTotalCountMonth(int lecyear, int lecmonth){
        System.out.println("lecyear"+lecyear);
//        System.out.println("lecmonth"+lecmonth);
        int result = lecDetailService.getLecTotalCountMonth(lecyear, lecmonth);
        if(!(result>0)) result=0;
        System.out.println(result);
        return result;
    }

/*    @GetMapping("/manager/usertotalCount")
    @ResponseBody
    public int getUserTotalCount(){
        int result = userService.getUserTotalCount();
        if(!(result>0)) result=0;
        System.out.println(result);//sql 에서 해당 값이 없는 경우 0을 넣어줌
        return result;
    }*/
}
