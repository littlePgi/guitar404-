package entity;

import java.util.concurrent.TimeUnit;

public class TextDemo {
	
	private static  boolean stoprequested = true;
	
	/*private static synchronized void requeseSotp(){
		stoprequested = true;
	}
	private static synchronized boolean stopRequested(){
		return stoprequested;
	}*/
	
	public static void main(String[] args) {
		
		Thread thread = new Thread(new Runnable() {
			
			@Override
			public void run() {
				System.out.println("ִ�з�����");
				int i = 0;
				while (!stoprequested) 
					i++;
			}
		});
		thread.start();
		System.out.println("��ʼ����");
		try {
			TimeUnit.SECONDS.sleep(1);
			stoprequested = true;
			System.out.println("����ֹͣ");
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
