package test;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class MapTest {
	public static void main(String[] args)	{
		Map<String,String> hm = new HashMap<>();
//		Map<String,String> map1 = new ConcurrentHashMap<>();
		Map<String,String> map = new Hashtable<>(); // 
		map.put("이름", "보리");
		map.put("나이", "10");
		System.out.println(map);
	}
}
