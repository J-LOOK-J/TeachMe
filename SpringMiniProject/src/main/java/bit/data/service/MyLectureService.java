package bit.data.service;

import bit.data.dao.MyLectureDao;
import bit.data.dao.MyLectureDaoInter;
import bit.data.dto.MyLectureDto;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyLectureService implements MyLectureServiceInter{

    @Autowired
    MyLectureDaoInter myLectureDao;
    
    
    @Override
    public void insertMyLecture(MyLectureDto mylecDto) {
      
    	myLectureDao.insertMyLecture(mylecDto);
    }
    
    @Override
    public void updatePayok(int usernum) {
      
    	myLectureDao.updatePayok(usernum);
    }
    @Override
    public List<MyLectureDto>   getReview(int lecdenum) {
    	
    	return myLectureDao.getReview(lecdenum);
		
    }
    
}
