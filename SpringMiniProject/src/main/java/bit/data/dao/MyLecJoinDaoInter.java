package bit.data.dao;


import bit.data.dto.MyLecJoinDto;

import java.util.List;
import java.util.Map;

public interface MyLecJoinDaoInter {
    public List<MyLecJoinDto> getMyLecListByNum(Map<String,Object> map);

    public List<MyLecJoinDto> getTotalIncom(int year);
}
