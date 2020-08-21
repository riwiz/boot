package test;

import java.util.List;

public class 실행 {

	public void 일반적인사람들(List<사람> 사람들) {
		for(사람 s : 사람들)	{
			s.걷다();
			s.먹다();
			s.자다();
			
		}
	}
	
	public static void main(String[] args) {
		동진 dong = new 동진("동진",22);
		인혁 in = new 인혁("인혁",33);
		
	} 
}
