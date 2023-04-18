package com.kh.yist.qrTest;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

@Controller
public class QRController {

	@RequestMapping("test.qr")
	public Object createQr(@RequestParam String url) throws WriterException, IOException {
        int width = 200;
        int height = 200;
        BitMatrix matrix = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, width, height);
 
        try (ByteArrayOutputStream out = new ByteArrayOutputStream();) {
            MatrixToImageWriter.writeToStream(matrix, "PNG", out);
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_PNG)
                    .body(out.toByteArray());
        }
    }
	
	@RequestMapping("teacherList.do")
	public String teacherListForm() {
		return "admin/instructorList";
	}
	
	@RequestMapping("studentList.do")
	public String studentListForm() {
		return "admin/studentList";
	}
	
	@RequestMapping("teacherDetail.do")
	public String teacherDetail() {
		return "admin/teacherDetail";
	}
	
	@RequestMapping("teacherDetail-lecture.do")
	public String teacherDetailLecture() {
		return "admin/teacherDetail-lecture";
	}
	
	@RequestMapping("studentDetail.do")
	public String studentDetail() {
		return "admin/studentDetail";
	}
	
	@RequestMapping("gradeView.do")
	public String gradeView() {
		return "admin/gradeView";
	}
}
