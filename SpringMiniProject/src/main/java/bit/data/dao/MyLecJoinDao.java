package bit.data.dao;

import bit.data.dto.MyLecJoinDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class MyLecJoinDao implements MyLecJoinDaoInter{

    @Autowired
    SqlSession session;
    String ns="bit.data.dao.MyLecJoinDao.";

    @Override
    public List<MyLecJoinDto> getMyLecListByNum(Map<String,Object> map) {
        return session.selectList(ns+"getMyLecListByNum",map);
    }
}
