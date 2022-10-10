package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class MyLecJoinDto {
    public int mylecnum;
    public int usernum;
    public int lecdenum;
    public String payok;
    public Timestamp paytime;
    public int price;
    public String lectypea;
    public String lectypeb;
    public String lecname;
    public String teaname;
    public int roomnum;
    public String lectime;
    public String lecday;
    public int lecmonth;
    public int lecyear;

}
