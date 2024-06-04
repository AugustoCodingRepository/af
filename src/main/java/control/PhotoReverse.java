package control;

import java.io.*;

public class PhotoReverse {
	public static byte[] reverseMyPng(File png) {
		try {
		FileInputStream fis = new FileInputStream(png);
		byte[] imgBytes = new byte[(int) png.length()];
		fis.read(imgBytes);
		fis.close();
		return imgBytes;
		}
		catch(IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static File reverseMyBytes(byte[] imgBytes, int productID) {
		try {
			byte[] pngBytes = imgBytes;
			File png = new File(productID+".png");
			FileOutputStream fos = new FileOutputStream(png);
			fos.write(pngBytes);
			fos.close();
			return png;
		}
		catch(IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}