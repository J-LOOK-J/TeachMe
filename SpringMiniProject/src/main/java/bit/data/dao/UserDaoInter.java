package bit.data.dao;

import bit.data.dto.UserDto;

import java.util.List;
import java.util.Map;

public interface UserDaoInter {

    public int getUserTotalCount();
    public List<UserDto> getAllUsers();
    public UserDto getDataByNum(int usernum);
    public UserDto getDataById(String userid);

    public void updateUserPhoto(Map<String, Object> map);
    public void updateUser(UserDto dto);
    public void deleteUser(int usernum);




}
