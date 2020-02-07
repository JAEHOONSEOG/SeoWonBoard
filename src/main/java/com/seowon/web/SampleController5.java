package com.seowon.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.seowon.domain.ProductVO;

@Controller
public class SampleController5 {

	@RequestMapping(value="/doJson")
	public @ResponseBody ProductVO doJson() {
		ProductVO product = new ProductVO("Sample Product", 30000);
		return product;
	}
}
